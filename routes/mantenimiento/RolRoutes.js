const express = require('express');
const router = express.Router();
const RolController = require('../../controllers/RolController');
router.get('/roles', RolController.listarRoles);
router.post('/insertar', RolController.insertarRol);
router.put('/actualizar', RolController.actualizarRol);
router.delete('/eliminar/:RoleID', RolController.eliminarRol);
//Asignar Rol Combina Usuario con Rol
router.post('/asignar', RolController.asignarRolAUsuario);

module.exports = router;