const express = require('express');
const router = express.Router();
const UsuarioController = require('../controllers/UsuarioController');

router.get('/usuarios', UsuarioController.listarusuario);
router.post('/insertar', UsuarioController.insertarUsuario);

module.exports=router;