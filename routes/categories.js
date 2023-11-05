const express = require('express');
const routerCategories = express.Router();
const controllerCategories = require('../controller/Home/categoriesController')
const authMiddleware = require('../middle_ware/auth.middleware');



routerCategories.get('/categories-list', controllerCategories.categoriesList)
routerCategories.get('/categories/addnew', authMiddleware.isAuthAdmin, controllerCategories.categoriesAddNew)
routerCategories.get('/brands-list', controllerCategories.brandsList)
routerCategories.get('/brands/addnew', authMiddleware.isAuthAdmin, controllerCategories.brandsAddNew)

module.exports.routerCategories = routerCategories