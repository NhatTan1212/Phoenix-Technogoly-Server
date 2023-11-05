const { sql, connect } = require('../connect');

const CART = function (cart) {
    this.user_id = cart.user_id;
    this.product_id = cart.product_id;
    this.guest_id = cart.guest_id;
    this.count = cart.count;
};

CART.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM CARTS
    `;
    await pool.request()
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset);
            sql.close();
        })
}

CART.findById = async (user_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM CARTS where user_id = @user_id
    `;
    await pool.request()
        .input('user_id', sql.Int, user_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset);
            sql.close();
        })
}

CART.findByGID = async (guest_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM CARTS where guest_id = @guest_id
    `;
    await pool.request()
        .input('guest_id', sql.VARCHAR(50), guest_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset);
            sql.close();
        })
}

CART.findByGID = async (guest_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM CARTS where guest_id = @guest_id
    `;
    await pool.request()
        .input('guest_id', sql.VARCHAR(50), guest_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset);
            sql.close();
        })
}

CART.findByProductId = async (product_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM CARTS where product_id = @product_id
    `;
    await pool.request()
        .input('product_id', sql.Int, product_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset);
            sql.close();
        })
}

CART.create = async (cart, result) => {
    const pool = await connect;
    const sqlStringAddCart = `
        INSERT INTO CARTS (user_id, product_id, guest_id, prod_name, description, avatar, price, 
                            is_possible_to_order, count, product_total, created_at, updated_at)
        SELECT @user_id, @product_id, @guest_id, prod_name, prod_description, avatar, price, 
                quantity, @count, price * @count, GETDATE(), GETDATE()
        FROM PRODUCTS
        WHERE id = @product_id;
    `;
    await pool.request()
        .input('user_id', sql.Int, cart.user_id)
        .input('product_id', sql.Int, cart.product_id)
        .input('guest_id', sql.VARCHAR(50), cart.guest_id)
        .input('count', sql.Int, cart.count)
        .query(sqlStringAddCart, (err, data) => {
            if (err) {
                console.log(err)
            }
            console.log('add to cart successful')
            result(null, { id: data.insertId, ...data });
            sql.close();
        })
};


CART.updateById = async (user_id, product_id, count, is_possible_to_order, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        UPDATE CARTS
        SET count = count + @count,
        is_possible_to_order = @is_possible_to_order,
        product_total = (count+@count) * price,
        updated_at = CURRENT_TIMESTAMP
        WHERE user_id = @user_id AND product_id = @product_id
        AND count + @count <= is_possible_to_order;
    `;
    await pool.request()
        .input('user_id', sql.Int, user_id)
        .input('product_id', sql.Int, product_id)
        .input('count', sql.Int, count)
        .input('is_possible_to_order', sql.Int, is_possible_to_order)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update cart by user_id success')
            }
            result(null, { "message": "success", "data": data });
            sql.close();
        })
};

CART.updateByGID = async (guest_id, product_id, count, is_possible_to_order, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        UPDATE CARTS
        SET count = count + @count,
        is_possible_to_order = @is_possible_to_order,
        product_total = (count+@count) * price,
        updated_at = CURRENT_TIMESTAMP
        WHERE guest_id = @guest_id AND product_id = @product_id
        AND count + @count <= is_possible_to_order;
    `;
    await pool.request()
        .input('guest_id', sql.VARCHAR(50), guest_id)
        .input('product_id', sql.Int, product_id)
        .input('count', sql.Int, count)
        .input('is_possible_to_order', sql.Int, is_possible_to_order)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update cart by guest_id success')
            }
            result(null, { "message": "success", "data": data });
            sql.close();
        })
};

CART.updateByIdFromCart = async (user_id, product_id, count, is_possible_to_order, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        UPDATE CARTS
        SET count = @count,
        is_possible_to_order = @is_possible_to_order,
        product_total = @count * price,
        updated_at = CURRENT_TIMESTAMP
        WHERE user_id = @user_id AND product_id = @product_id
        AND @count <= is_possible_to_order;
    `;
    await pool.request()
        .input('user_id', sql.Int, user_id)
        .input('product_id', sql.Int, product_id)
        .input('count', sql.Int, count)
        .input('is_possible_to_order', sql.Int, is_possible_to_order)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update cart by user_id success')
            }
            result(null, { "message": "success", "data": data });
            sql.close();
        })
};

CART.updateByGIDFromCart = async (guest_id, product_id, count, is_possible_to_order, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        UPDATE CARTS
        SET count = @count,
        is_possible_to_order = @is_possible_to_order,
        product_total = @count * price,
        updated_at = CURRENT_TIMESTAMP
        WHERE guest_id = @guest_id AND product_id = @product_id
        AND @count <= is_possible_to_order;
    `;
    await pool.request()
        .input('guest_id', sql.VARCHAR(50), guest_id)
        .input('product_id', sql.Int, product_id)
        .input('count', sql.Int, count)
        .input('is_possible_to_order', sql.Int, is_possible_to_order)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update cart by guest_id success')
            }
            result(null, { "message": "success", "data": data });
            sql.close();
        })
};

CART.deleteCart = async (user_id, guest_id, product_id, result) => {
    const pool = await connect;
    const sqlStringDeleteProduct = `
        DELETE FROM CARTS
        WHERE 
        (
            (user_id = @user_id AND @user_id IS NOT NULL)
            OR
            (guest_id = @guest_id AND @guest_id IS NOT NULL)
        )
        AND product_id = @product_id
    `;

    try {
        const request = pool.request()
            .input('user_id', sql.Int, user_id)
            .input('guest_id', sql.VARCHAR(50), guest_id)
            .input('product_id', sql.Int, product_id);

        await request.query(sqlStringDeleteProduct);
        console.log('Success');
        result(null, { "message": "success" });
    } catch (err) {
        console.error(err);
        result(err, null);
    } finally {
        sql.close();
    }
};

module.exports = CART;