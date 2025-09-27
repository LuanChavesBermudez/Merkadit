const mysql = require('mysql2');

const database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'Merkadit',
});

database.connect();

module.exports = database;