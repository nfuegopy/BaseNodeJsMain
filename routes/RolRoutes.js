const express = require('express');
const router = express.Router();
const RolController = require('../controllers/RolController');
router.get('/roles', RolController.listarRoles);
router.post('/insertar', RolController.insertarRol);

module.exports = router;