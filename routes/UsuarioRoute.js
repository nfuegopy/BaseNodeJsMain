const express = require('express');
const router = express.Router();
const UsuarioController = require('../controllers/UsuarioController');

// Ruta para listar usuarios
router.get('/usuarios', UsuarioController.listarUsuarios);
router.post('/insertar', UsuarioController.insertarUsuario);

module.exports = router;
