const sql = require('mssql');
require('dotenv').config()

const config = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    database: process.env.DB_NAME,
    authentication: {
        type: 'default'
    },
    options: {
        encrypt: true
    }
}
console.log(config)

const connect = new sql.ConnectionPool(config).connect().then(pool => {
    return pool;
})


module.exports = {
    connect: connect,
    sql: sql
};