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