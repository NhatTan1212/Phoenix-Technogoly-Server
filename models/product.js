const { sql, connect } = require('../connect');

const Products = function (product) {
    this.prod_name = product.prod_name;
    this.avatar = product.avatar;
    this.prod_description = product.prod_description;
    this.manufacturer = product.manufacturer;
    this.price = product.price;
    this.cost = product.cost;
    this.quantity = product.quantity;
    this.prod_percent = product.prod_percent;
    this.cpu = product.cpu;
    this.hard_drive = product.hard_drive;
    this.mux_switch = product.mux_switch;
    this.screen = product.screen;
    this.webcam = product.webcam;
    this.connection = product.connection;
    this.prod_weight = product.prod_weight;
    this.pin = product.pin;
    this.operation_system = product.operation_system;

};

Products.create = async (newproduct, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    insert into PRODUCTS(prod_name,avatar,prod_description,manufacturer,price,cost,quantity,prod_percent,cpu,
                            hard_drive,mux_switch,screen,webcam,connection,prod_weight,pin,operation_system) 
    values( @prod_name,@avatar,@prod_description,@manufacturer,@price,@cost,@quantity,@prod_percent,@cpu,
            @hard_drive,@mux_switch,@screen,@webcam,@connection,@prod_weight,@pin,@operation_system)
    `;
    await pool.request()
        .input('prod_name', sql.NVARCHAR(255), newproduct.prod_name)
        .input('avatar', sql.VARCHAR(255), newproduct.avatar)
        .input('prod_description', sql.NVARCHAR(sql.MAX), newproduct.prod_description)
        .input('manufacturer', sql.NVARCHAR(255), newproduct.manufacturer)
        .input('price', sql.FLOAT, newproduct.price)
        .input('cost', sql.FLOAT, newproduct.cost)
        .input('quantity', sql.INT, newproduct.quantity)
        .input('prod_percent', sql.FLOAT, newproduct.prod_percent)
        .input('cpu', sql.NVARCHAR(255), newproduct.cpu)
        .input('hard_drive', sql.NVARCHAR(255), newproduct.hard_drive)
        .input('mux_switch', sql.NVARCHAR(255), newproduct.mux_switch)
        .input('screen', sql.NVARCHAR(255), newproduct.screen)
        .input('webcam', sql.NVARCHAR(255), newproduct.webcam)
        .input('connection', sql.NVARCHAR(255), newproduct.connection)
        .input('prod_weight', sql.NVARCHAR(255), newproduct.prod_weight)
        .input('pin', sql.NVARCHAR(255), newproduct.pin)
        .input('operation_system', sql.NVARCHAR(255), newproduct.operation_system)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('success')
            }
            result(null, { id: data.insertId, ...newproduct });
            sql.close();
        })
};


Products.find = async (result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM PRODUCTS
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


// Products.findById = async (id, result) => {
//     const pool = await connect;
//     const sqlStringAddProduct = `
//         select * FROM PRODUCTS where id = @id
//     `;
//     await pool.request()
//         .input('id', sql.Int, id)
//         .query(sqlStringAddProduct, (err, data) => {
//             if (err) {
//                 console.log(err)
//             } else {
//                 // console.log(data)
//                 result(null, data.recordset);
//             }
//             sql.close();
//         })
// }
Products.findById = async (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
                SELECT * FROM PRODUCTS WHERE id = @id
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

Products.findByQuery = async (slugBrand, slugCategory, sort) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            let sqlStringAddProduct = `
                SELECT * FROM PRODUCTS
            `;

            if (slugBrand !== undefined) {
                sqlStringAddProduct += `WHERE brand_id IN (SELECT brand_id FROM BRANDS WHERE slug IN (${slugBrand}))`;
            }

            if (slugCategory !== undefined) {
                if (slugBrand !== undefined) {
                    sqlStringAddProduct += ' AND ';
                } else {
                    sqlStringAddProduct += ' WHERE ';
                }
                sqlStringAddProduct += `category_id IN (SELECT category_id FROM CATEGORIES WHERE slug IN (${slugCategory}))`;
            }

            if (sort !== undefined) {
                sqlStringAddProduct += ' ORDER BY ' + sort;
            }

            const result = await pool.request().query(sqlStringAddProduct);
            resolve(result.recordset);
        } catch (error) {
            reject(error);
        }
    });
};



Products.findByCategoryId = async (id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        select * FROM PRODUCTS where category_id = @id
    `;
    await pool.request()
        .input('id', sql.Int, id)
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

Products.findByCategorySlug = async (slug, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        SELECT * FROM PRODUCTS 
        WHERE category_id IN (SELECT category_id FROM CATEGORIES WHERE slug IN (${slug}));
    `;
    await pool.request()
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                result(err);
            } else {
                result(null, data.recordset);
                sql.close();
            }
        });
};

Products.findByBrandSlug = async (slug, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        SELECT * FROM PRODUCTS 
        WHERE brand_id IN (SELECT brand_id FROM BRANDS WHERE slug IN (${slug}));
    `;
    await pool.request()
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                result(err);
            } else {
                result(null, data.recordset);
                sql.close();
            }
        });
};

Products.updateById = async (id, newproduct, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    UPDATE PRODUCTS
    SET brand_id = @brand_id,
        category_id = @category_id,
        prod_name = @prod_name,
        avatar = @avatar,
        prod_description = @prod_description,
        manufacturer = @manufacturer,
        price = @price,
        cost = @cost,
        quantity = @quantity,
        prod_percent = @prod_percent,
        cpu = @cpu,
        hard_drive = @hard_drive,
        mux_switch = @mux_switch,
        screen = @screen,
        webcam = @webcam,
        connection = @connection,
        prod_weight = @prod_weight,
        pin = @pin,
        operation_system = @operation_system
    WHERE id = @id;
    `;
    await pool.request()
        .input('id', sql.NVARCHAR(255), id)
        .input('brand_id', sql.INT, newproduct.brand_id)
        .input('category_id', sql.INT, newproduct.category_id)
        .input('prod_name', sql.NVARCHAR(255), newproduct.prod_name)
        .input('avatar', sql.VARCHAR(255), newproduct.avatar)
        .input('prod_description', sql.NVARCHAR(sql.MAX), newproduct.prod_description)
        .input('manufacturer', sql.NVARCHAR(255), newproduct.manufacturer)
        .input('price', sql.FLOAT, newproduct.price)
        .input('cost', sql.FLOAT, newproduct.cost)
        .input('quantity', sql.INT, newproduct.quantity)
        .input('prod_percent', sql.FLOAT, newproduct.prod_percent)
        .input('cpu', sql.NVARCHAR(255), newproduct.cpu)
        .input('hard_drive', sql.NVARCHAR(255), newproduct.hard_drive)
        .input('mux_switch', sql.NVARCHAR(255), newproduct.mux_switch)
        .input('screen', sql.NVARCHAR(255), newproduct.screen)
        .input('webcam', sql.NVARCHAR(255), newproduct.webcam)
        .input('connection', sql.NVARCHAR(255), newproduct.connection)
        .input('prod_weight', sql.NVARCHAR(255), newproduct.prod_weight)
        .input('pin', sql.NVARCHAR(255), newproduct.pin)
        .input('operation_system', sql.NVARCHAR(255), newproduct.operation_system)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update product successful')
                result(null, { "message": "success", "data": data });
                sql.close();
            }
        })
};

Products.updateByIdButNotAvatar = async (id, newproduct, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        UPDATE PRODUCTS
        SET brand_id = @brand_id,
            category_id = @category_id,
            prod_name = @prod_name,
            prod_description = @prod_description,
            manufacturer = @manufacturer,
            price = @price,
            cost = @cost,
            quantity = @quantity,
            prod_percent = @prod_percent,
            cpu = @cpu,
            hard_drive = @hard_drive,
            mux_switch = @mux_switch,
            screen = @screen,
            webcam = @webcam,
            connection = @connection,
            prod_weight = @prod_weight,
            pin = @pin,
            operation_system = @operation_system
        WHERE id = @id;
    `;
    await pool.request()
        .input('id', sql.NVARCHAR(255), id)
        .input('category_id', sql.INT, newproduct.category_id)
        .input('brand_id', sql.INT, newproduct.brand_id)
        .input('prod_name', sql.NVARCHAR(255), newproduct.prod_name)
        .input('prod_description', sql.NVARCHAR(sql.MAX), newproduct.prod_description)
        .input('manufacturer', sql.NVARCHAR(255), newproduct.manufacturer)
        .input('price', sql.FLOAT, newproduct.price)
        .input('cost', sql.FLOAT, newproduct.cost)
        .input('quantity', sql.INT, newproduct.quantity)
        .input('prod_percent', sql.FLOAT, newproduct.prod_percent)
        .input('cpu', sql.NVARCHAR(255), newproduct.cpu)
        .input('hard_drive', sql.NVARCHAR(255), newproduct.hard_drive)
        .input('mux_switch', sql.NVARCHAR(255), newproduct.mux_switch)
        .input('screen', sql.NVARCHAR(255), newproduct.screen)
        .input('webcam', sql.NVARCHAR(255), newproduct.webcam)
        .input('connection', sql.NVARCHAR(255), newproduct.connection)
        .input('prod_weight', sql.NVARCHAR(255), newproduct.prod_weight)
        .input('pin', sql.NVARCHAR(255), newproduct.pin)
        .input('operation_system', sql.NVARCHAR(255), newproduct.operation_system)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('update product successful')
                result(null, { "message": "success", "data": data });
                sql.close();
            }
        })
};


Products.deleteById = async (id, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
        DELETE FROM PRODUCTS
        WHERE id = @id;
    `;
    await pool.request()
        .input('id', sql.Int, id)
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


module.exports = Products;
