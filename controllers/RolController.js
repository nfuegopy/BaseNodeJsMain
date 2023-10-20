const RolService = require ('../services/RolService');
const Rol = require ('../models/Role')
exports.listarRoles = async (req, res) => {
    try{
        const roles = await RolService.listarRoles();
        res.json({success: true, roles});
    }catch(error){
        res.status(500).json({success: false, message: 'Ocurrio un error al consultar roles'});
    }
};

exports.insertarRol = async(req, res) => {
    try{
        const {RoleName, RoleDescription} = req.body;
    
        const rol = new Rol(null, RoleName, RoleDescription);
      
        const result = await RolService.insertarRol(rol);
        res.json({success: true, message: 'Rol Ingresado correctamente', result});
    }catch(error){
        console.log(error);
        res.status(500).json({success: false, message: 'Ocurrio un error al intentar registrar el Rol'})
    }
};