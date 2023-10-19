const pool = require('../config/database');
class UsuarioRepository{
    async listarusuario(){
        const [rows] = await pool.execute('CALL ListarUsuarios()');
        return rows;
    }
}

module.exports = new UsuarioRepository();