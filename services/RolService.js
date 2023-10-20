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
}
module.exports = new RolService();