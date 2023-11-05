const { sql, connect } = require('../connect');

const REVIEWS = function (review) {
    this.user_id = review.user_id;
    this.product_id = review.product_id;
    this.rating = review.rating;
    this.comment = review.comment;
};

REVIEWS.create = async (review, result) => {
    const pool = await connect;
    const sqlStringAddOrder = `
    INSERT INTO REVIEWS (product_id, user_id, rating, comment, created_at)
    VALUES (@product_id, @user_id, @rating, @comment, GETDATE());
    `;
    await pool.request()
        .input('product_id', sql.Int, review.product_id)
        .input('user_id', sql.Int, review.user_id)
        .input('rating', sql.Int, review.rating)
        .input('comment', sql.NVARCHAR(sql.MAX), review.comment)
        .query(sqlStringAddOrder, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, { id: data.insertId, ...data });
        })
};

REVIEWS.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM REVIEWS
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

REVIEWS.findByProductId = async (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
                SELECT * FROM REVIEWS WHERE product_id = @id
            `;
            const result = await pool.request()
                .input('id', sql.Int, id)
                .query(sqlStringAddProduct);

            resolve(result.recordset);
        } catch (error) {
            reject(error);
        }
    })
}

REVIEWS.deleteById = async (review_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        DELETE FROM REVIEWS
        WHERE review_id = @review_id;
    `;
    await pool.request()
        .input('review_id', sql.Int, review_id)
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

module.exports = REVIEWS;