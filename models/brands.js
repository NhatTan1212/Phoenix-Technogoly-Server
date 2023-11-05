const { sql, connect } = require('../connect');

const BRANDS = function (brands) {
    this.brand_id = brands.brand_id;
    this.name = brands.name;
    this.description = brands.description;
};

BRANDS.create = async (brands, result) => {
    const pool = await connect;
    const sqlStringAddOrder = `
    INSERT INTO BRANDS (brand_id, name, description)
    VALUES (@brand_id, @name, @description)
    `;
    await pool.request()
        .input('brand_id', sql.Int, brands.brand_id)
        .input('name', sql.NVARCHAR(100), brands.name)
        .input('description', sql.NVARCHAR(255), brands.description)
        .query(sqlStringAddOrder, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, { id: data.insertId, ...data });
        })
};

BRANDS.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM BRANDS
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

BRANDS.findByProductId = async (brand_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM BRANDS where brand_id = @brand_id
    `;
    await pool.request()
        .input('brand_id', sql.Int, brand_id)
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

BRANDS.deleteById = async (brand_id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        DELETE FROM BRANDS
        WHERE brand_id = @brand_id;
    `;
    await pool.request()
        .input('brand_id', sql.Int, brand_id)
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

module.exports = BRANDS;