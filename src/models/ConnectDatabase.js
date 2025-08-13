// src/models/ConnectDatabase.js
require('dotenv').config();
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

connection.connect((err) => {
  if (err) {
    console.error('❌ Erro ao conectar ao MySQL:', err);
    return;
  }
  console.log('✅ Conectado ao banco de dados MySQL no Railway!');
});

module.exports = connection;
