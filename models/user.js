const { sql, connect } = require('../connect');

const USERS = function (user) {
    this.name = user.name;
    this.password = user.password;
    this.email = user.email;
    this.role = user.role;
    this.registrationToken = user.registrationToken;
};

USERS.find = async (result) => {
    const pool = await connect;
    const sqlStringAdduser = `
        select * FROM USERS
    `;
    await pool.request()
        .query(sqlStringAdduser, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset);
        })
}

USERS.findLast = async (result) => {
    const pool = await connect;
    const sqlStringAdduser = `
        SELECT TOP 1 * FROM USERS ORDER BY id DESC;
    `;
    await pool.request()
        .query(sqlStringAdduser, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                // console.log(data)
            }
            result(null, data.recordset[0]);
        })
}



USERS.findById = async (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            const pool = await connect;
            const sqlStringAddProduct = `
            select * FROM USERS where id = @id
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

USERS.findByEmail = async (email, result) => {

    const pool = await connect;
    const sqlStringAdduser = `
        select * FROM USERS where email = @email
    `;
    await pool.request()
        .input('email', sql.NVARCHAR(100), email)
        .query(sqlStringAdduser, (err, data) => {
            if (err) {
                console.log(err)
            }
            //  else if (data.recordset.length) {
            //     result(null, data.recordset[0])
            //     return;
            // }
            else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}

USERS.findByIdProvider = async (id, provider, result) => {

    const pool = await connect;
    const sqlStringAdduser = `
        select * FROM USERS where id = @id and provider = @provider
    `;
    await pool.request()
        .input('id', sql.NVARCHAR(100), id)
        .input('provider', sql.NVARCHAR(255), provider)
        .query(sqlStringAdduser, (err, data) => {
            if (err) {
                console.log(err)
            }
            //  else if (data.recordset.length) {
            //     result(null, data.recordset[0])
            //     return;
            // }
            else {
                // console.log(data)
                result(null, data.recordset);
            }
        })
}

USERS.resetPassword = async (email, password, result) => {
    const pool = await connect;
    const sqlStringAdduser = `
        UPDATE USERS SET password = @password WHERE email = @email
    `;
    await pool.request()
        .input('email', sql.NVARCHAR(100), email)
        .input('password', sql.VARCHAR(255), password)
        .query(sqlStringAdduser, (err, data) => {
            if (err) {
                console.log(err)
            }
            //  else if (data.recordset.length) {
            //     result(null, data.recordset[0])
            //     return;
            // }
            else {
                // console.log(data)
                result(null, { email: email });
            }
        })
};


module.exports = USERS;