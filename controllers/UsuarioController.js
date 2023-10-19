const Usuario = require('../models/Usuario');
const UsuarioService = require('../services/UsuarioService');

//controlador para listar personal
exports.listarUsuarios = async (req, res) =>
 {
    try{
        const usuarios = await UsuarioService.listarUsuarios();
        res.json({success: true, usuarios});
    }catch (error) {
        console.error(error);
        res.status(500).json({success: false, message: 'Ocurrio un error en el servidor al consultar Usuarios'})
    }
};

//controll para insertar usuario
exports.insertarUsuario = async(req, res) => {
try{
    const{CI} = req.body;
    const usuario = new Usuario(CI);
    const result = await UsuarioService.insertarUsuario(usuario);
    res.json({success: true, message:'Usuario insertado correctamente', result});
    }catch(error){
        console.log(error);
        if (error.message === 'Faltan campos requeridos') {
            res.status(400).json({success: false, message: error.message});
        } else {
            res.status(500).json({success: false, message: 'Ocurrio un error al intentar registrar usuario', error});
        }

    }
};