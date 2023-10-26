const UsuarioService = require('../services/UsuarioService');
const Usuario = require('../models/Usuario');
exports.listarusuario = async (req, res) => {
    try{
        const usuarios = await UsuarioService.listarusuario();
        res.json({success: true, usuarios});
    }catch (error) {
        res.status(500).json({success: false, message: 'Ocurrio un error en el servidor al consultar Usuarios'})
    }
};

exports.insertarUsuario = async(req, res) => {
    try{
        const {CI} = req.body;
        const usuario = new Usuario(null,CI);
        const result = await UsuarioService.insertarUsuario(usuario);
        res.json({success: true, message: 'Usuario Ingresado Correctamente', result});
    }catch(error){
        console.log(error);
        res.status(500).json({success: false, message: 'Ocurrio un error gravisimo al intentar ingresar el usuario'})
    }
};


exports.actualizarNombreUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombreUsuario } = req.body;
        const result = await UsuarioService.actualizarNombreUsuario(id, nombreUsuario);
        res.json({ success: true, message: 'Nombre de usuario actualizado correctamente', result });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Ocurrió un error al intentar actualizar el nombre de usuario' });
    }
};

exports.resetearPassword = async (req, res) => {
    try {
        const { id } = req.params;
        const { password } = req.body;
        const result = await UsuarioService.resetearPassword(id, password);
        res.json({ success: true, message: 'Contraseña reseteada correctamente', result });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Ocurrió un error al intentar resetear la contraseña' });
    }
};

exports.eliminarUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const result = await UsuarioService.eliminarUsuario(id);
        res.json({ success: true, message: 'Usuario eliminado correctamente', result });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Ocurrió un error al intentar eliminar el usuario' });
    }
};
