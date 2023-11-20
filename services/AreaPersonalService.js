const AreaPersonalRepository = require('../repositories/AreaPersonalRespository');
class AreaPersonalService {
    //Metodo listar personal en servicio
    async listarAreas() {
        return await AreaPersonalRepository.listarAreas();
    }
    // //metodo insertar personal en servicio
    // async insertarPersonal(personal){
    //     return await PersonalRepository.insertarPersonal(personal);
    // }

    // //Metodo actualizar Personal
    // async actualizarPersonal(personal){
    //     return await PersonalRepository.actualizarPersonal(personal);
    // }

    // //Metodo eliminar Personal
    // async eliminarPersonal(CI){
    //     return await PersonalRepository.eliminarPersonal(CI);
    // }

}
module.exports = new AreaPersonalService();