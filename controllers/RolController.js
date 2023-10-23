const RolService = require ('../services/RolService');
const Rol = require ('../models/Role');


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


exports.actualizarRol = async(req, res) => {
    try {
        const {RoleID, RoleName, RoleDescription} = req.body;
        const rol = new Rol(RoleID, RoleName, RoleDescription);
        const result = await RolService.actualizarRol(rol);
        res.json({success: true, message: 'Rol actualizado correctamente', result});
    } catch (error) {
        console.log(error);
        res.status(500).json({success: false, message: 'Error al intentar actualizar el Rol'});
    }
};

exports.eliminarRol = async(req, res) => {
    try {
        const { RoleID } = req.params;
        const result = await RolService.eliminarRol(RoleID);
        res.json({success: true, message: 'Rol eliminado correctamente', result});
    } catch (error) {
        console.log(error);
        res.status(500).json({success: false, message: 'Error al intentar eliminar el Rol'});
    }
};


//Asignar rol a usuario
exports.asignarRolAUsuario = async (req, res) => {
    try {
        const { UsuarioID, RoleID } = req.body;
        const result = await RolService.asignarRolAUsuario(UsuarioID, RoleID);
        res.json({ success: true, message: 'Rol asignado correctamente', result });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Error al asignar el rol' });
    }
};