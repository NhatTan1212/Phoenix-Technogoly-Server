const sql = require('mssql');

const config = {
    user: "sa",
    password: "123456tk",
    database: "QUANLYBANLAPTOP",
    server: 'localhost',
    options: {
        trustServerCertificate: true
    }
};

const connect = new sql.ConnectionPool(config).connect().then(pool => {
    return pool;
})


module.exports = {
    connect: connect,
    sql: sql
};