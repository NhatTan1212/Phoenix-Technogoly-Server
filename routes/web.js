const express = require('express');
const routerWeb = express.Router();
const controllerWeb = require('../controller/web/controllerWeb')
const authMiddleware = require('../middle_ware/auth.middleware');
// const authMiddleware = require()

routerWeb.get('/', authMiddleware.isAuth, controllerWeb.controllerWeb)

module.exports.routerWeb = routerWeb