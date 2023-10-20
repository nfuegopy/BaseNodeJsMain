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
}

module.exports = new RolRepository();