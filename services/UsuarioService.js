const UsuarioRepository = require ('../repositories/UsuarioRepository');
class UsuarioService{
    async listarusuarios(){
        return await UsuarioRepository.listarusuarios();
    }
}

module.exports= new UsuarioService();
