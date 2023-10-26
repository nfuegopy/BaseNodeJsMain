const AuthService = require('../services/AuthService');  // Asegúrate de que la ruta sea la correcta

exports.iniciarSesion = async (req, res) => {
    try {
        const { nombreUsuario, password } = req.body;
        const {resultado, UsuarioID} = await AuthService.iniciarSesion(nombreUsuario, password);
        if (resultado === 1) {
            res.json({ redirect: 'menu', UsuarioID });
        } else if (resultado === 2) {
            res.json({ redirect: 'reset', UsuarioID });
        } else {
            res.json({ success: false, message: 'Credenciales inválidas.' });
        }
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Ocurrió un error en el servidor.' });
    }
};

