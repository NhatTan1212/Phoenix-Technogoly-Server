const express = require('express');
// const cookieParser = require('cookie-parser');
// express.use(cookieParser());
const routerAdmin = express.Router();
const controllerAdmin = require('../controller/admin/controllerAdmin');
const fsExtra = require('fs-extra')
const authMiddleware = require('../middle_ware/auth.middleware');
const jwt = require('jsonwebtoken')

// //body-parser
// var bodyParser = require('body-parser');
// app.use(bodyParser.urlencoded({ extended: false }));



routerAdmin.get('/management', authMiddleware.isAuthAdmin, controllerAdmin.controllerAdmin)

routerAdmin.get('/addproducts', authMiddleware.isAuthAdmin, controllerAdmin.addProducts)

routerAdmin.post('/newproduct', controllerAdmin.newProduct)




module.exports.routerAdmin = routerAdmin


