const sql = require('mssql');
require('dotenv').config()


const config = {
    user: process.env.AZURE_SQL_USER,
    password: process.env.AZURE_SQL_PASSWORD,
    server: process.env.AZURE_SQL_SERVER,
    port: parseInt(process.env.AZURE_SQL_PORT),
    database: process.env.AZURE_SQL_DATABASE,
    authentication: {
        type: 'default'
    },
    options: {
        // encrypt: true
        encrypt: false
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