const express = require('express');
// const cookieParser = require('cookie-parser');
// express.use(cookieParser());
const routerAdmin = express.Router();
const controllerAdmin = require('../controller/admin/controllerAdmin');
const fsExtra = require('fs-extra')
const authMiddleware = require('../middle_ware/auth.middleware');
const jwt = require('jsonwebtoken')
const multer = require('multer');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/upload')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + "-" + file.originalname)
    }
});
const uploadMuti = multer({
    storage,
    fileFilter: (req, file, cb) => {
        if (
            (file.fieldname === 'images' && (file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg')) ||
            (file.fieldname === 'avatar' && (file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg'))
        ) {
            cb(null, true);
        } else {
            cb(null, false);
            const err = new Error('Only .png, .jpg and .jpeg format allowed for images and avatar fields!');
            err.name = 'ExtensionError';
            return cb(err);
        }
    },
    limits: {
        fileSize: 1024 * 1024 * 5, // 5MB limit for each file
    },
    fieldNameSize: 100, // Maximum field name size
    fieldSize: 1024 * 1024 * 5, // Maximum field value size (5MB)
}).fields([
    { name: 'images', maxCount: 8 },
    { name: 'avatar', maxCount: 1 },
]);


// //body-parser
// var bodyParser = require('body-parser');
// app.use(bodyParser.urlencoded({ extended: false }));



routerAdmin.get('/management', authMiddleware.isAuthAdmin, controllerAdmin.controllerAdmin)

routerAdmin.get('/addproducts', authMiddleware.isAuthAdmin, controllerAdmin.addProducts)

routerAdmin.post('/newproduct', uploadMuti, authMiddleware.isAuthAdmin, controllerAdmin.newProduct)




module.exports.routerAdmin = routerAdmin


