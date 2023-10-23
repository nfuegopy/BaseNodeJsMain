const RolRepository = require('../repositories/RolRepository');
class RolService {
    //Metodo Listar rol en servicio
    async listarRoles(){
        return await RolRepository.listarRoles();
    }
    // Metodo insertar rol en servicio
    async insertarRol(rol){
        return await RolRepository.insertarRol(rol);
     }

     //Metodo actualizar Rol
     async actualizarRol(rol) {
        return await RolRepository.actualizarRol(rol);
    }

    //Metodo Eliminar Rol
    async eliminarRol(RoleID) {
        return await RolRepository.eliminarRol(RoleID);
    }


    //Metodo asignar Rol
    async asignarRolAUsuario(UsuarioID, RoleID) {
        return await RolRepository.asignarRolAUsuario(UsuarioID, RoleID);
    }
    
}
module.exports = new RolService();