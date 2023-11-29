const express = require('express');
const router = express();
// const authMiddleware = require('../middle_ware/auth.middleware');


router.use(express.json());
router.use('/', require('./admin').routerAdmin);
router.use('/', require('./login').routerLogin);
router.use('/', require('./home').routerHome);
router.use('/', require('./categories').routerCategories);


module.exports.router = router