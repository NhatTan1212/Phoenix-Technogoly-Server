const { sql, connect } = require('../connect');

const ORDER_DETAILS = function (orderDetails) {
    this.product_id = orderDetails.product_id;
    this.order_id = orderDetails.order_id;
    this.quantity = orderDetails.quantity;
    this.price = orderDetails.price;
};

ORDER_DETAILS.create = async (orderDetails, result) => {
    const pool = await connect;
    const sqlStringAddOrder = `
    INSERT INTO ORDER_DETAILS (product_id, order_id, quantity, price, created_at, updated_at)
    VALUES (@product_id, @order_id, @quantity, @price, GETDATE(), GETDATE());
    `;
    await pool.request()
        .input('product_id', sql.Int(255), orderDetails.product_id)
        .input('order_id', sql.Int, orderDetails.order_id)
        .input('quantity', sql.Int, orderDetails.quantity)
        .input('price', sql.Float, orderDetails.price)
        .query(sqlStringAddOrder, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, { id: data.insertId, ...data });
        })
};

ORDER_DETAILS.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM ORDER_DETAILS
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

ORDER_DETAILS.findById = async (order_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM ORDER_DETAILS where order_id = @order_id
    `;
    await pool.request()
        .input('order_id', sql.Int, order_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}
ORDER_DETAILS.deleteById = async (id, result) => {
    const pool = await connect
    sqlString = 'delete from ORDER_DETAILS Where order_id = @id'
    await pool.request()
        .input('id', sql.Int, id)
        .query(sqlString, (err, data) => {
            if (err) {
                console.log(err);
                result(err, null)
            } else {
                result(null, data.recordset)
                sql.close()
            }
        })
}

module.exports = ORDER_DETAILS;