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