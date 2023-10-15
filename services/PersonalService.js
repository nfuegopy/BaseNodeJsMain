const PersonalRepository = require('../repositories/PersonalRepository');
class PersonalService {
async listarPersonales(){
    return await PersonalRepository.listarPersonales();
}
}
module.exports= new PersonalService();