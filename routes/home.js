const express = require('express');
const routerHome = express.Router();
const controllerHome = require('../controller/Home/controllerHome')
const authMiddleware = require('../middle_ware/auth.middleware');
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


routerHome.get('/', controllerHome.home)
routerHome.get('/users', controllerHome.users)
routerHome.get('/management', controllerHome.management)
routerHome.get('/home', controllerHome.home)
routerHome.get('/list-image', controllerHome.listImage)
routerHome.get('/laptop-gaming', controllerHome.laptopGaming)
routerHome.get('/laptops/:query', controllerHome.getLaptopsByQuery);
routerHome.get('/editproduct/:id', authMiddleware.isAuthAdmin, controllerHome.editProduct)
routerHome.post('/editproduct', uploadMuti, authMiddleware.isAuthAdmin, controllerHome.editProductPost)
routerHome.post('/deleteproduct', authMiddleware.isAuthAdmin, controllerHome.deleteProduct)
routerHome.get('/product-detail/:id', controllerHome.productDetail)
routerHome.post('/cart', controllerHome.cart)
routerHome.get('/cart-server', controllerHome.cartServer)
routerHome.post('/addcart', controllerHome.addCart)
routerHome.post('/deletecart', controllerHome.deleteCart)
routerHome.post('/updatecart', controllerHome.updateCart)
routerHome.get('/checkout?', controllerHome.checkout)
routerHome.post('/dataorder', controllerHome.dataOrder)
routerHome.post('/order', controllerHome.order)
routerHome.post('/create_payment_url', controllerHome.createPaymentVNPAY);
routerHome.get('/orderdetails/:id', controllerHome.orderDetails)
routerHome.post('/order-management', authMiddleware.isAuthAdmin, controllerHome.orderManagement)
routerHome.post('/order-management/update/:id', authMiddleware.isAuthAdmin, controllerHome.updateOrder)
routerHome.get('/order-success/:id', authMiddleware.isAuthAdmin, controllerHome.orderSuccess)
routerHome.get('/order-reject/:id', authMiddleware.isAuthAdmin, controllerHome.orderReject)
routerHome.get('/order-shipping/:id', authMiddleware.isAuthAdmin, controllerHome.orderShipping)
routerHome.get('/order-shipped/:id', authMiddleware.isAuthAdmin, controllerHome.orderShipped)
routerHome.post('/deleteorder', authMiddleware.isAuthAdmin, controllerHome.deleteOrder)
routerHome.post('/get-orderdetails/:id', authMiddleware.isAuth, controllerHome.orderDetails)
routerHome.post('/reviews/:id', authMiddleware.isAuth, controllerHome.reviews)
routerHome.get('/reviews-management', authMiddleware.isAuthAdmin, controllerHome.reviewsManagement)
routerHome.get('/reviews-management-by-product/:id', authMiddleware.isAuthAdmin, controllerHome.reviewsManagementByProduct)
routerHome.get('/deletereview/:id', authMiddleware.isAuthAdmin, controllerHome.deleteReviews)
routerHome.put('/update-order-is-rated/:id', authMiddleware.isAuth, controllerHome.updateOrderIsRated)

module.exports.routerHome = routerHome