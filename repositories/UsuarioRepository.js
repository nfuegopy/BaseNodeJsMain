const pool = require('../config/database');
class UsuarioRepository{
    // Metodo listar Usuarios
    async listarusuario(){
        const [rows] = await pool.execute('CALL ListarUsuarios()');
        return rows;
    }
    // Metodo insertar Usuarios
    async insertarUsuario(usuario){
        console.log(usuario); 
        const{CI} = usuario;
        console.log("Se inserto correctamente el usuario con CI N º: ", CI);
        if( !CI){
          // Uno o más campos están faltando o son undefined.
         // Responde con un error antes de llamar a UsuarioRepository.
         res.status(400).json({ success: false, message: 'Faltan campos requeridos' });
         return; 
     }
     const [result] = await pool.execute('CALL InsertarUsuario(?)',[CI]);
     return result;
    }

    async actualizarNombreUsuario(id, nombreUsuario) {
        const [result] = await pool.execute('CALL ActualizarNombreUsuario(?, ?)', [id, nombreUsuario]);
        return result;
    }

    async resetearPassword(id, password) {
        const [result] = await pool.execute('CALL ResetearPassword(?, ?)', [id, password]);
        return result;
    }

    async eliminarUsuario(id) {
        const [result] = await pool.execute('CALL EliminarUsuario(?)', [id]);
        return result;
    }

    
}

module.exports = new UsuarioRepository();