// Configuracion para conectar a la base de datos 
// esto es un comentario para realizar prueba de subida
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'admin',
  database: 'sistemainicial',
  waitForConnections: true,
});

module.exports = pool;
