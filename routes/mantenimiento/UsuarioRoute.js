const express = require('express');
const router = express.Router();
const UsuarioController = require('../../controllers/UsuarioController');

router.get('/usuarios', UsuarioController.listarusuario);
router.post('/insertar', UsuarioController.insertarUsuario);
router.put('/actualizarNombreUsuario/:id', UsuarioController.actualizarNombreUsuario);
router.put('/resetearPassword/:id', UsuarioController.resetearPassword);
router.delete('/eliminarUsuario/:id', UsuarioController.eliminarUsuario);

module.exports = router;