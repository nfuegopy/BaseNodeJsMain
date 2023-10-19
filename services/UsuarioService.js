const Usuario = require('../models/Usuario');
const UsuarioRepository = require ('../repositories/UsuarioRepository');
class UsuarioService{
    //Metodo listar usuario
    async listarUsuarios(){
        return await UsuarioRepository.listarUsuarios();
    }
    // metodo insertar usuario en servicio
    async insertarUsuario(usuario){
        return await UsuarioRepository.insertarUsuario(usuario);
    }
}

module.exports= new UsuarioService();
