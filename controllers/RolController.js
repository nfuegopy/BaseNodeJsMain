const RolService = require ('../services/RoleService');
exports.listarRoles = async (req, res) => {
    try{
        const roles = await RolService.listarRoles();
        res.json({success: true, roles});
    }catch(error){
        res.status(500).json({success: false, message: 'Ocurrio un error al consultar roles'});
    }
};