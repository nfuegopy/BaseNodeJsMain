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

    async actualizarNombreUsuario(id, nombreUsuario) {
        return await UsuarioRepository.actualizarNombreUsuario(id, nombreUsuario);
    }

    async resetearPassword(id, password) {
        return await UsuarioRepository.resetearPassword(id, password);
    }

    async eliminarUsuario(id) {
        return await UsuarioRepository.eliminarUsuario(id);
    }
}

module.exports= new UsuarioService();
