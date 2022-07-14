import pymysql

user_id = None
basket_id = None
err_code = None


# Helpers

# Takes a certain number of arguments representing to be chosen from
# print them as an ordered list and gives a user opportunity to
# choose 1 of them by entering the number of the option.
# return None on out of range or non-numeric input, otherwise the number of the option
# Takes two named with defaults arguments, msg - inviting user input message,
# err_msg - sent it to error function in case of wrong input
def utils_menu(*menu_items, msg="Please select an option: ", err_msg="Invalid option."):
    for i in range(len(menu_items)):
        print(f"{i + 1}: {menu_items[i]}")
    # print(*[f"{i + 1}: {menu_item}\n" for (i, menu_item) in enumerate(menu_items)])
    choice = input(msg)
    if choice.isnumeric() and int(choice) - 1 in range(len(menu_items)):
        return int(choice)
    else:
        error(err_msg)


# print error message
def error(error_msg, emoji="💥"):
    print(f"\n{emoji} {error_msg}.\n")


# Exception handlers use it in case of exception, to customise messages sent to user
def global_error_handling(err):
    global err_code
    if err_code and err_code == 1062:
        error('Item is already in the basket, try change quantity', emoji='👆')
    else:
        error(err)
    err_code = None


# the function handles the single queries
def sql_query(query, read, *args):
    global err_code
    conn = pymysql.connect(
        host="localhost",
        port=3306,
        user="root",
        password="",
        database="solentDBAssessment"
    )
    rows = None
    try:
        cursor = conn.cursor()
        if args:
            cursor.execute(query, (*args,))
        else:
            cursor.execute(query)
        if read:
            rows = cursor.fetchall()
        else:
            conn.commit()
    except Exception as e:
        conn.close()
        err_code = e.args[0]
        raise Exception(e)  # raising an Exception returns to the main menu
    conn.close()
    return rows, [d[0] for d in cursor.description] if rows else []


def empty_basket(bask):
    query = """
            SELECT * 
            FROM basket_contents
            WHERE basket_id = (%s)
            """
    result, descr = sql_query(query, True, bask)

    return not bool(result)


# App Functions
def welcome():
    global user_id, basket_id
    user_id = input("Please enter your id: ")
    query = """
            SELECT *
            FROM shoppers
            WHERE shopper_id = (%s);
            """
    result, descr = sql_query(query, True, user_id)
    if not len(descr):
        error(f'User with id: {user_id} not found!')
        return False
    fn_index = descr.index('shopper_first_name')
    sn_index = descr.index('shopper_surname')
    print(f'\nWelcome {result[0][fn_index]} {result[0][sn_index]}\n')
    query = """
            SELECT basket_id
            FROM shopper_baskets
            WHERE shopper_id = (%s)
            AND DATE(basket_created_date_time) = DATE(NOW())
            ORDER BY basket_created_date_time DESC
            LIMIT 1;
            """
    result, descr = sql_query(query, True, user_id)
    if not result:
        query_ins = """
                INSERT INTO shopper_baskets (shopper_id, basket_created_date_time) 
                VALUES (%s, NOW());
                """
        sql_query(query_ins, False, user_id)

        result, descr = sql_query(query, True, user_id)
    basket_id = result[0][0]
    return True


def order_history():
    global user_id
    print('Display your order history')
    query = """
            SELECT so.order_id AS 'Order No', DATE_FORMAT(so.order_date, '%d-%m-%Y') AS 'Ordered on', 
               p.product_description AS Description, sel.seller_name AS 'Seller Name', op.quantity AS Quantity, 
               CONCAT('£', op.price) AS 'Price', so.order_status AS Status
            FROM shoppers s
            LEFT JOIN shopper_orders so
              USING(shopper_id)
            LEFT JOIN ordered_products op
              USING(order_id)
            INNER JOIN products p
              USING(product_id)
            INNER JOIN product_sellers
              USING(product_id)
            INNER JOIN sellers sel
              ON product_sellers.seller_id = sel.seller_id
            WHERE op.seller_id = sel.seller_id AND s.shopper_id = %s
            ORDER BY so.order_date DESC;
            """

    result, descr = sql_query(query.replace('%s', user_id), True)
    if not result:
        print('No orders placed by now')
    else:
        format_array = ["{:<12}"] * len(descr)
        format_array[2] = "{:<70}"
        format_array[3] = "{:<20}"
        print(*[format_array[i].format(descr[i]) for i in range(len(descr))])
        for row in result:
            print(*[format_array[i].format(str(row[i])) for i in range(len(row))])


def add_item():
    global user_id, basket_id

    def choose_product_category():
        query = """
                SELECT category_id, category_description
                FROM categories
                """
        result, descr = sql_query(query, True)
        while True:
            user_input = utils_menu(*[r[1] for r in result], msg="Please choose a product category: ")
            if user_input:
                break
        return result[user_input - 1][0]

    def choose_product(cat):
        query = """
                SELECT product_id, product_description
                FROM products
                WHERE category_id = (%s);
                """

        result, descr = sql_query(query, True, cat)
        while True:
            user_input = utils_menu(*[r[1] for r in result], msg="Please choose a product: ")
            if user_input:
                break
        return result[user_input - 1][0]

    def choose_seller(prod):
        query = """
                SELECT ps.*, s.seller_id, s.seller_name
                FROM product_sellers ps
                LEFT JOIN sellers s
                ON ps.seller_id = s.seller_id
                WHERE ps.product_id = (%s);
                """

        result, descr = sql_query(query, True, prod)
        while True:
            user_input = utils_menu(*[f"{r[4]} (£ {r[2]})" for r in result], msg="Please choose a seller: ")
            if user_input:
                break
        return result[user_input - 1][1], result[user_input - 1][2]

    def get_quantity():
        while True:
            user_input = input('Please enter the quantity of the selected product: ')
            if user_input.isnumeric() and int(user_input):
                return int(user_input)

    def next_basket_id():
        query = """
                SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES
                WHERE table_name = 'shopper_baskets';
                """
        result, descr = sql_query(query, True)
        return result[0][0]

    def make_new_shopper_basket(bask, usr):
        query_ins = """
                    INSERT INTO shopper_baskets (basket_id, shopper_id, basket_created_date_time) 
                    VALUES (%s, %s, NOW());
                    """
        sql_query(query_ins, False, bask, usr)

    def add_item_to_basket(*args):
        query = """
                INSERT INTO basket_contents
                VALUES (%s, %s, %s, %s, %s)
                """
        sql_query(query, False, *args)
        print('Item added to your basket')

    print('Add an item to your basket')
    # choose product category
    print('\nSelect the Product category:')
    category_id = choose_product_category()
    if not category_id:
        return False

    # choose product from selected category
    print('\nSelect a Product:')
    product_id = choose_product(category_id)
    if not product_id:
        return False

    # Seller and price
    print('\nSelect the Seller:')
    seller_id, price = choose_seller(product_id)
    if not seller_id:
        return False

    # check if basket is empty
    empty = empty_basket(basket_id)
    if empty:
        basket_id = next_basket_id()
        if not basket_id:
            return False
        make_new_shopper_basket(basket_id, user_id)

    qty = get_quantity()
    add_item_to_basket(basket_id, product_id, seller_id, qty, price)


def view_basket():
    print('View your basket')
    query = """
            SELECT p.product_description AS 'Product Description', s.seller_name AS 'Seller Name', 
            b.quantity AS Qty, b.price AS Price, b.quantity * b.price AS Total, b.product_id
            FROM basket_contents b
            LEFT JOIN products p
            ON b.product_id = p.product_id
            LEFT JOIN sellers s
            ON b.seller_id = s.seller_id
            WHERE basket_id = (%s);
            """
    result, descr = sql_query(query, True, basket_id)
    if result:
        descr = ['Item'] + descr
        res = [list(r) for r in result]
        for i in range(len(result)):
            res[i] = [i + 1] + res[i]
        f_print = ["{:>5}", "{:<70}", "{:<30}", "{:^4}", "  {:^6}", "  {:^7}"]
        f_print1 = ["{:>5}", "{:<70}", "{:<30}", "{:^4}", "£ {:>6}", "£ {:>7}"]
        print(*[f_print[i].format(descr[i]) for i in range(len(descr) - 1)])
        for r in res:
            print(*[f_print1[i].format(r[i]) for i in range(len(descr) - 1)])
        query = "SELECT SUM(price * quantity) FROM basket_contents WHERE basket_id = (%s)"
        result1, descr = sql_query(query, True, basket_id)
        print('\n', "{:>121}".format('Basket Total:'), "£ {:>7}".format(result1[0][0]))
    else:
        print('Your basket is empty')
    return result


def change_quantity():
    print('Change the quantity of an item in your basket')
    result = view_basket()
    if not result:
        return
    while True:
        item = 1 if len(result) == 1 else int(input('Enter the number of the item you want to change: '))
        if item - 1 in range(len(result)):
            break
        print('The number of the item is invalid')
    while True:
        qty = int(input('Enter the new quantity of the selected item: '))
        if qty > 0:
            break
        print('The quantity must be greater then zero')
    query = """
            UPDATE basket_contents
            SET quantity = (%s)
            WHERE product_id = (%s) AND basket_id = (%s);
            """
    sql_query(query, False, qty, result[item - 1][5], basket_id)
    view_basket()


def remove_item():
    print('Remove an item from your basket')
    result = view_basket()
    if not result:
        return
    user_input = input('Please, enter the product id of the basket item they want to remove: ')
    query = """
            SELECT *
            FROM basket_contents
            WHERE basket_id = (%s) AND product_id = (%s);
            """
    found, descr = sql_query(query, True, basket_id, user_input)

    if found:
        if input('Do you want to remove the selected item from the basket Y or N: ')[0].upper() != 'Y':
            return
        query = """
                DELETE FROM basket_contents
                WHERE basket_id = (%s) AND product_id = (%s);
                """
        sql_query(query, False, basket_id, user_input)
        empty = empty_basket(basket_id)
        if empty:
            query = """
                    DELETE FROM shopper_baskets
                    WHERE basket_id = (%s);
                    """
            sql_query(query, False, basket_id)
            print('Your basket is empty')
        else:
            view_basket()
    else:
        print('The product id you have entered is not in your basket')


def checkout():
    print('Checkout')
    global err_code
    result = view_basket()
    if not result:
        print("Your basket is empty")
        return
    if input('Do you wish to proceed with the checkout (Y or N) : ')[0].upper() != 'Y':
        return
    # get next order id
    query = """
            SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES
            WHERE table_name = 'shopper_orders';
            """
    result, descr = sql_query(query, True)
    order = result[0][0]

    # building ordered products array
    query = """
            SELECT product_id, seller_id, quantity, price
            FROM basket_contents
            WHERE basket_id = (%s)
            """
    result, descr = sql_query(query, True, basket_id)
    ordered_products = [[order] + [*r] for r in result]
    for r in ordered_products:
        r[4] = str(r[4])
    ordered_products = [(*r,) for r in ordered_products]  # convert list of lists to list of tuples
    transaction_query1 = """
                         INSERT INTO shopper_orders
                         VALUES (%s, %s, DATE(NOW()),'Placed');
                         """
    transaction_query2 = """
                         INSERT INTO ordered_products
                         VALUES (%s, %s, %s, %s, %s, 'Placed');
                         """
    transaction_query3 = """
                         DELETE FROM basket_contents
                         WHERE basket_id = (%s);
                         """
    transaction_query4 = """
                         DELETE FROM shopper_baskets
                         WHERE basket_id = (%s);
                         """

    # TRANSACTION
    conn = pymysql.connect(
        host="localhost",
        port=3306,
        user="root",
        password="",
        database="solentDBAssessment"
    )
    try:
        conn.begin()
        cursor = conn.cursor()
        cursor.execute(transaction_query1, (order, user_id,))  # creates new order
        cursor.executemany(transaction_query2, ordered_products)  # adds all items from basket to ordered products
        cursor.execute(transaction_query3, basket_id)  # deletes products in the basket
        cursor.execute(transaction_query4, basket_id)  # deletes basket
        cursor.close()
        conn.commit()
    except Exception as e:
        try:
            err_code = e.args[0]
            conn.rollback()
            raise Exception('Transaction failure, rollback')
        except:
            pass


def run():
    global user_id, basket_id
    menu = ['Display your order history', 'Add an item to your basket', 'View your basket',
            'Change the quantity of an item in your basket', 'Remove an item from your basket',
            'Checkout', 'Exit']
    funcs = ['order_history', 'add_item', 'view_basket', 'change_quantity', 'remove_item', 'checkout']

    while True:
        r = welcome()
        if not r:
            print('Good bye!')
            return
        break

    while True:
        try:
            choice = utils_menu(*menu)
            if choice == 7:
                return
            elif choice:
                globals()[funcs[choice - 1]]()
                input('Press Enter to continue')
            else:
                continue
        except Exception as err:
            global_error_handling(err)
            input('Press Enter to continue')


# starting point of the app
if __name__ == "__main__":
    run()
