const express = require('express');
const router = express.Router();
const PersonalController = require('../controllers/PersonalController');
router.get('/personales', PersonalController.listarPersonales);

module.exports=router;