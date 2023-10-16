const RolRepository = require('../repositories/RolRepository');
class RolService {
    async listarRoles(){
        return await RolRepository.listarRoles();
    }
}
module.exports = new RolService();