const express = require('express');
const routerLogin = express.Router();
const controllerLogin = require('../controller/login/controllerLogin');
const controllerLogin3 = require('../controller/login/controllerLogin3_passport');
const controllerForgotPassword = require('../controller/login/controllerForgotPassword');
const authMiddleware = require('../middle_ware/auth.middleware');


routerLogin.get('/users', controllerLogin.selectAllUsers);
routerLogin.get('/login', controllerLogin.controllerLogin)

// routerLogin.get('/register', authMiddleware.isAuth, register.create)
routerLogin.post('/requireregister', controllerLogin3.register)
routerLogin.get('/confirm/:email', controllerLogin3.confirmRegister)
routerLogin.post('/confirm/:email', controllerLogin3.confirmRegisterPost)

routerLogin.post('/requirelogin', controllerLogin3.login)

routerLogin.get('/login/federated/facebook', controllerLogin3.loginFb_Get);
routerLogin.get('/auth/facebook/callback', controllerLogin3.loginFb_Get_Callback);
routerLogin.post('/requireloginfb', controllerLogin3.loginFb)

routerLogin.get('/logout', authMiddleware.loggedin, controllerLogin3.logout)

routerLogin.get('/password/reset', controllerForgotPassword.showForgotForm)
routerLogin.post('/password/email', controllerForgotPassword.sendResetLinkEmail)

routerLogin.get('/password/reset/:email', controllerForgotPassword.showResetForm)
routerLogin.post('/password/reset', controllerForgotPassword.reset)

// routerLogin.get('/verify', register.verify)

// routerLogin.get('/password/reset', forgotPassword.showForgotForm)
// routerLogin.post('/password/email', forgotPassword.sendResetLinkEmail)

// routerLogin.get('/password/reset/:email', forgotPassword.showResetForm)
// routerLogin.post('/password/reset', forgotPassword.reset)

module.exports.routerLogin = routerLogin