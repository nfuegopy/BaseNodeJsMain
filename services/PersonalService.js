const PersonalRepository = require('../repositories/PersonalRepository');
class PersonalService {
    //Metodo listar personal en servicio
async listarPersonales(){
    return await PersonalRepository.listarPersonales();
}
//metodo insertar personal en servicio
async insertarPersonal(personal){
    return await PersonalRepository.insertarPersonal(personal);
}

//Metodo actualizar Personal
async actualizarPersonal(personal){
    return await PersonalRepository.actualizarPersonal(personal);
}

//Metodo eliminar Personal
async eliminarPersonal(CI){
    return await PersonalRepository.eliminarPersonal(CI);
}

}
module.exports= new PersonalService();