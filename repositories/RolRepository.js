const pool = require ('../config/database');

class RolRepository {
    //Metodo Listar Roles
    async listarRoles(){
        const [rows] = await pool.execute('CALL ListarRoles()');
        return rows;
    }
    //Metodo insertar Roles
    async insertarRol(rol){
        const {RoleName, RoleDescription} = rol;
        console.log("Se insertaron correctamente los siguientes datos",RoleName, RoleDescription);
        if( !RoleName || !RoleDescription){
            // Uno o más campos están faltando o son undefined.
         // Responde con un error antes de llamar a RolRespository.
         res.status(400).json({ success: false, message: 'Faltan campos requeridos' });
         return; 
     }
         const [result] = await pool.execute('CALL InsertarRol(?, ?)', [RoleName, RoleDescription]);
        return result;
    }


//Metodo actualizar rol
async actualizarRol(rol) {
    const {RoleID, RoleName, RoleDescription} = rol;
    const [result] = await pool.execute('CALL ActualizarRol(?, ?, ?)', [RoleID, RoleName, RoleDescription]);
    return result;
}
//Metodo eliminar Rol
async eliminarRol(RoleID) {
    const [result] = await pool.execute('CALL EliminarRol(?)', [RoleID]);
    return result;
}

//Metodo asignar Rol a usuario
async asignarRolAUsuario(UsuarioID, RoleID) {
    const [result] = await pool.execute('CALL AsignarRolUsuario(?, ?)', [UsuarioID, RoleID]);
    return result;
}



}

module.exports = new RolRepository();