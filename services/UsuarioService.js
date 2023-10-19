const UsuarioRepository = require ('../repositories/UsuarioRepository');
class UsuarioService{
    //Metodo Listar usuario
    async listarusuario(){
        return await UsuarioRepository.listarusuario();
    }
    //Otros metodos
}

module.exports= new UsuarioService();
