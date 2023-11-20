const express = require('express');
const router = express.Router();
const PersonalController = require('../../controllers/PersonalController');
//Rutas para cada funcion
router.get('/personales', PersonalController.listarPersonales);
router.post('/insertar', PersonalController.insertarPersonal);
router.put('/actualizar', PersonalController.actualizarPersonal);
router.delete('/eliminar/:CI', PersonalController.eliminarPersonal);

module.exports = router;