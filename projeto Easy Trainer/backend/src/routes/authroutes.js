const express = require('express');
const router = express.Router();
const authController = require('../controller/authController');

// Rota de cadastro
router.post('/register', authController.register);

// Rota de login
router.post('/login', authController.login);

// Rota de recuperação de senha via SMS
router.post('/recover-password', authController.recoverPassword);

module.exports = router;
