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
}
module.exports= new PersonalService();