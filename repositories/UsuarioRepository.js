const pool = require('../config/database');
const Usuario = require('../models/Usuario');
class UsuarioRepository{
    async listarUsuario(){
        const [rows] = await pool.execute('CALL ListarUsuarios()');
        return rows;
    }
}

module.exports = new UsuarioRepository();