const Usuario = require('../models/Usuario');
const UsuarioService = require('../services/PersonalService');
exports.listarusuarios = async (req, res) => {
    try{
        const usuarios = await UsuarioService.listarusuarios();
        res.json({success: true, personales});
    }catch (error) {
        res.status(500).json({success: false, message: 'Ocurrio un error en el servidor al consultar Usuarios'})
    }
};