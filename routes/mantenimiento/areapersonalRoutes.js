const express = require('express');
const router = express.Router();
const AreaPersonalController = require('../../controllers/AreaPersonalController');
//Rutas para cada funcion
router.get('/areapersonales', AreaPersonalController.listarAreas);


module.exports = router;