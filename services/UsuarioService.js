const UsuarioRepository = require ('../repositories/UsuarioRepository');
class UsuarioService{
    //Metodo Listar usuario
    async listarusuario(){
        return await UsuarioRepository.listarusuario();
    }
    //Otros metodos
    async insertarUsuario(usuario){
        return await UsuarioRepository.insertarUsuario(usuario);
    }
}

module.exports= new UsuarioService();
