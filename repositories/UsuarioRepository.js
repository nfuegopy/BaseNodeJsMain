const pool = require('../config/database');
class UsuarioRepository{
    async listarUsuarios(){
        const [rows] = await pool.execute('CALL ListarUsuarios()');
        return rows;
    }


    async insertarUsuario(usuario){
        const {CI} = usuario;

        const [result] = await pool.execute('CALL InsertarUsuario(?)',[CI]);
        return result;
}
}
module.exports = new UsuarioRepository();