const express = require('express');
const router = express.Router();
const RolController = require('../controllers/RolController');
router.get('/roles', RolController.listarRoles);

module.exports = router;