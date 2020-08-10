const mysql = require('mysql');

class MysqlDataContext {
    constructor() { }

    static createPool() {
        return mysql.createPool({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            database: process.env.DB_DATABASE,
        });
    }
}

module.exports = MysqlDataContext;