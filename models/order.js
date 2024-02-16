const { sql, connect } = require('../connect');

const ORDERS = function (order) {
    this.user_id = order.user_id;
    this.paymentMethods = order.paymentMethods;
    this.total = order.total;
    this.avatar = order.avatar;
    this.name = order.name;
    this.note = order.note;
    this.guest_id = order.guest_id;
    this.email = order.email;
    this.user_address = order.user_address;
    this.phone = order.phone;
    this.trading_code = order.trading_code;
    this.is_payment = order.is_payment;
    this.is_approved = order.is_approved;
    this.is_being_shipped = order.is_being_shipped;
    this.is_transported = order.is_transported;
    this.is_success = order.is_success;
    this.paid_at = order.paid_at;
    this.approved_at = order.approved_at;
    this.being_shipped_at = order.being_shipped_at;
    this.transported_at = order.transported_at;
    this.successful_at = order.successful_at;
};

ORDERS.create = async (order, result) => {
    const pool = await connect;
    const sqlStringAddOrder = `
    INSERT INTO ORDERS (paymentMethods, guest_id, avatar, note, total, user_id, name, email, user_address, phone, trading_code, 
                        is_payment, is_approved, is_being_shipped, is_transported, is_success, created_at, updated_at)
    VALUES (@paymentMethods,@guest_id, @avatar, @note, @total, @user_id, @name, @email, @user_address, @phone, @trading_code, 
                        @is_payment, @is_approved, @is_being_shipped, @is_transported, @is_success, GETDATE(), GETDATE());
    `;
    await pool.request()
        .input('paymentMethods', sql.VARCHAR(255), order.paymentMethods)
        .input('guest_id', sql.VARCHAR(50), order.guest_id)
        .input('avatar', sql.NVARCHAR(255), order.avatar)
        .input('note', sql.NVARCHAR(255), order.note)
        .input('total', sql.Float, order.total)
        .input('user_id', sql.Int, order.user_id)
        .input('name', sql.NVARCHAR(100), order.name)
        .input('email', sql.VARCHAR(100), order.email)
        .input('user_address', sql.NVARCHAR(255), order.user_address)
        .input('phone', sql.NVARCHAR(255), order.phone)
        .input('trading_code', sql.VARCHAR(255), order.trading_code)
        .input('is_payment', sql.Int, order.is_payment)
        .input('is_approved', sql.Int, order.is_approved)
        .input('is_being_shipped', sql.Int, order.is_being_shipped)
        .input('is_transported', sql.Int, order.is_transported)
        .input('is_success', sql.Int, order.is_success)
        .query(sqlStringAddOrder, (err, data) => {
            if (err) {
                console.log(err)
            }
            const sqlStringSelectLastInsertedId =
                `
                SELECT *
                FROM ORDERS
                WHERE id = (SELECT MAX(id) FROM ORDERS);
            `;
            pool.request().query(sqlStringSelectLastInsertedId, (err, data) => {
                if (err) {
                    console.log(err);
                    result(err, null);
                } else {
                    const lastId = data.recordset[0].id;
                    console.log(lastId)
                    result(null, { id: lastId });
                }
            });
        })
};


ORDERS.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM ORDERS
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

ORDERS.findById = async (user_id, guest_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM ORDERS where user_id = @user_id or guest_id = @guest_id
    `;
    await pool.request()
        .input('user_id', sql.Int, user_id)
        .input('guest_id', sql.VARCHAR(50), guest_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}
ORDERS.findByOrderId = async (order_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM ORDERS where id = @order_id
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

ORDERS.selectLast = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        SELECT *
        FROM ORDERS
        WHERE id = (SELECT MAX(id) FROM ORDERS);
    `;
    await pool.request()
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}

ORDERS.UpdateOrder = async (id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    UPDATE ORDERS
    SET is_payment = @is_payment,
    is_approved = @is_approved,
    is_being_shipped = @is_being_shipped,
    is_transported = @is_transported,
    is_success = @is_success,
    WHERE id = @id;
    `;
    await pool.request()
        .input('id', sql.Int, id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}
ORDERS.UpdateApprovedById = async (id, is_approved) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
            UPDATE ORDERS
            SET is_approved = @is_approved,
            approved_at = CURRENT_TIMESTAMP
            WHERE id = @id;
            `;

            const data = await pool.request()
                .input('id', sql.Int, id)
                .input('is_approved', sql.Int, is_approved)
                .query(sqlStringAddProduct);

            resolve(data.recordset);
        } catch (err) {
            console.log(err);
            reject(err);
        }
    });
}

ORDERS.UpdatePaymentById = async (id, is_payment) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
            UPDATE ORDERS
            SET is_payment = @is_payment,
            paid_at = CURRENT_TIMESTAMP
            WHERE id = @id;
            `;

            const data = await pool.request()
                .input('id', sql.Int, id)
                .input('is_payment', sql.Int, is_payment)
                .query(sqlStringAddProduct);

            resolve(data.recordset);
        } catch (err) {
            console.log(err);
            reject(err);
        }
    });
}

ORDERS.UpdateShippedById = async (id, is_transported) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
            UPDATE ORDERS
            SET is_transported = @is_transported,
            transported_at = CURRENT_TIMESTAMP
            WHERE id = @id;
            `;

            const data = await pool.request()
                .input('id', sql.Int, id)
                .input('is_transported', sql.Int, is_transported)
                .query(sqlStringAddProduct);

            resolve(data.recordset);
        } catch (err) {
            console.log(err);
            reject(err);
        }
    });
}

ORDERS.UpdateShippingById = async (id, is_being_shipped) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
            UPDATE ORDERS
            SET is_being_shipped = @is_being_shipped,
            being_shipped_at = CURRENT_TIMESTAMP
            WHERE id = @id;
            `;

            const data = await pool.request()
                .input('id', sql.Int, id)
                .input('is_being_shipped', sql.Int, is_being_shipped)
                .query(sqlStringAddProduct);

            resolve(data.recordset);
        } catch (err) {
            console.log(err);
            reject(err);
        }
    });
}

ORDERS.UpdateSuccessById = async (id, is_success) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
            UPDATE ORDERS
            SET is_success = @is_success,
            successful_at = CURRENT_TIMESTAMP
            WHERE id = @id;
            `;

            const data = await pool.request()
                .input('id', sql.Int, id)
                .input('is_success', sql.Int, is_success)
                .query(sqlStringAddProduct);

            resolve(data.recordset);
        } catch (err) {
            console.log(err);
            reject(err);
        }
    });
}

ORDERS.UpdateRejectById = async (id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    UPDATE ORDERS
    SET is_success = 2
    WHERE id = @id;
    `;
    await pool.request()
        .input('id', sql.Int, id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}

ORDERS.updateOrderIsRatedById = async (id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    UPDATE ORDERS
    SET is_rated = 1
    WHERE id = @id;
    `;
    await pool.request()
        .input('id', sql.Int, id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}

ORDERS.deleteById = async (id, result) => {
    const pool = await connect
    sqlString = 'delete from ORDERS Where id = @id'
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



module.exports = ORDERS;