const { sql, connect } = require('../connect');

const IMAGES = function (image) {
    this.product_id = image.product_id;
    this.url = image.url;
};

IMAGES.create = async (image, result) => {
    const pool = await connect;
    const sqlStringAddOrder = `
    INSERT INTO IMAGES (product_id, url)
    VALUES (@product_id, @url)
    `;
    await pool.request()
        .input('product_id', sql.Int, image.product_id)
        .input('url', sql.NVARCHAR(255), image.url)
        .query(sqlStringAddOrder, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log("Create new image successfully")
                result(null, { id: data.insertId, ...data });
            }
        })
};

IMAGES.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM IMAGES
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

IMAGES.count = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select COUNT(*) FROM IMAGES
    `;
    await pool.request()
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
                result(null, data.recordset);
                sql.close();
            }
        })
}

IMAGES.findByProductId = async (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
                SELECT * FROM IMAGES WHERE product_id = @id
            `;
            const result = await pool.request()
                .input('id', sql.Int, id)
                .query(sqlStringAddProduct);

            resolve(result.recordset);
        } catch (error) {
            reject(error);
        }
    });
};

IMAGES.deleteById = async (product_id, image_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        DELETE FROM IMAGES
        WHERE product_id = @product_id
        and image_id = @image_id;
    `;
    await pool.request()
        .input('product_id', sql.INT, product_id)
        .input('image_id', sql.INT, image_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('Delete image successful ')
                result(null, data.recordset);
                sql.close();
            }
        })
}
IMAGES.deleteAllByProductId = async (product_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        DELETE FROM IMAGES
        WHERE product_id = @product_id
    `;
    await pool.request()
        .input('product_id', sql.INT, product_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('Delete image successful ')
                result(null, data.recordset);
                sql.close();
            }
        })
}

IMAGES.deleteByNum = async (product_id, num, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    WITH CTE AS (
        SELECT TOP ${num} *
        FROM IMAGES
        WHERE product_id = @product_id
        ORDER BY image_id DESC
    )
    
    DELETE FROM CTE;  
    `;
    await pool.request()
        .input('product_id', sql.INT, product_id)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('delete images successful')
                result(null, data.recordset);
                sql.close();
            }
        })
}

IMAGES.updateById = async (product_id, image_id, image_url, result) => {
    const pool = await connect;
    const sqlStringUpdateImages = `
    UPDATE IMAGES
    SET url = @image_url
    WHERE product_id = @product_id
    and image_id = @image_id;
    `;
    await pool.request()
        .input('product_id', sql.INT, product_id)
        .input('image_id', sql.INT, image_id)
        .input('image_url', sql.NVARCHAR(255), image_url)
        .query(sqlStringUpdateImages, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update images successful')
                result(null, { "message": "success", "data": data });
                sql.close();
            }
        })
};

module.exports = IMAGES;