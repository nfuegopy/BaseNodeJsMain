const express = require('express');
const router = express.Router();
const AuthController = require('../../controllers/AuthController');  // Asegúrate de que la ruta sea la correcta

router.post('/login', AuthController.iniciarSesion);

module.exports = router;