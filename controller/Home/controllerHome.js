const Products = require('../../models/product');
const CART = require('../../models/cart');
const USERS = require('../../models/user');
const ORDERS = require('../../models/order');
const ORDER_DETAILS = require('../../models/orderDetails');
const REVIEWS = require('../../models/reviews');
const CATEGORIES = require('../../models/categories');
const { v4: uuidv4 } = require('uuid');
const uuid = uuidv4();
const jwt = require('jsonwebtoken')



//multer
var multer = require('multer');
const { FALSE } = require('node-sass');
const session = require('express-session');
const IMAGES = require('../../models/images');
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/upload')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + "-" + file.originalname)
    }
});
var upload = multer({
    storage: storage,
    fileFilter: function (req, file, cb) {
        console.log(file);
        if (file.mimetype == "image/bmp" || file.mimetype == "image/png" || file.mimetype == "image/jpeg" || file.mimetype == "image/jpg" || file.mimetype == "image/gif") {
            cb(null, true)
        } else {
            return cb(new Error('Only image are allowed!'))
        }
    }
}).single("avatar");

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

function home(req, res) {
    Products.find((err, product) => {
        if (!err) {
            console.log(req.session)
            // res.render("home", { data: product })
            res.json(product)
        }
    });
}

function laptopGaming(req, res) {
    Products.findByCategoryId(1, (err, product) => {
        if (!err) {
            // console.log(req.session)
            // res.render("home", { data: product })
            res.json(product)
        }
    });
}


function getLaptopsByQuery(req, res) {
    const { query } = req.params;
    console.log(query)
    let categories;
    let brands;
    let sort;

    const tableSortConvert = {
        "gia-thap-den-cao": "price asc",
        "gia-cao-den-thap": "price desc"
    }

    const splitQuery = (qr) => {
        const arrParams = qr.split('=')[1];
        console.log(arrParams);
        if (arrParams.includes(',')) {
            return "'" + arrParams.split(',').join("','") + "'"
        } else {
            return "'" + arrParams + "'"
        }
    }

    const saveValue = (qr) => {
        if (qr.includes('brand')) {
            brands = splitQuery(qr)
        }
        if (qr.includes('category')) {
            categories = splitQuery(qr)
        }
        if (qr.includes('sort')) {
            sort = qr.split('=')[1];
            sort = tableSortConvert[sort]
        }
    }

    if (query.includes('&')) {
        const arrQuery = query.split('&')
        console.log(arrQuery);
        arrQuery.forEach(qr => {
            saveValue(qr)
        });


        Products.findByQuery(brands, categories, sort).then((data) => {
            res.json(data)
        })
    } else {
        if (query === 'allproduct') {
            Products.find((err, data) => {
                if (err) console.log(err);
                else {
                    res.json(data)
                }
            })
        } else {
            saveValue(query)
            Products.findByQuery(brands, categories, sort).then((data) => {
                res.json(data)
            })

        }
    }
}

function users(req, res) {
    USERS.find((err, user) => {
        if (!err) {
            console.log(req.session)
            res.json(user)
            // res.json(product)    
        }
    });
}

function listImage(req, res) {
    IMAGES.find((err, img) => {
        if (!err) {
            res.json(img)
            // res.json(product)    
        }
    });
}

function management(req, res) {
    Products.find((err, product) => {
        if (!err) {
            console.log(req.session)
            // res.render("management", { data: product })
            res.json(product)
        }
    });
}

async function editProduct(req, res) {
    const productId = req.params.id;
    console.log(productId)
    const product = await Products.findById(productId);
    if (product.length === 0) {
        return res.json({ "kq": 0, "errMsg": "Product not found" });
    }
    else {
        console.log(product[0].id)
        res.render("editProduct", { data: product[0] })
        // res.json(product[0])
    }
    // res.render('editProduct')
}

async function editProductPost(req, res) {
    // uploadMuti(req, res, async function (err) {
    //     if (err instanceof multer.MulterError) {
    //         return res.json({ "kq": 0, "errMsg": "A Multer error occurred when uploading.", errDetail: err });
    //     } else if (err) {
    //         console.log(err)
    //         return res.json({ "kq": 0, "errMsg": "An unknown error occurred when uploading: ", errDetail: err });
    //     }
    // console.log('file', req.file)
    console.log('body', req.body)
    console.log('files', req.files)

    const productId = String(req.body.IDProduct);

    let numCreate = 0;
    let createFinish = false;
    let dem = 0;
    let numDeleted = 0;
    let updateProductFinish = false;
    let updateImagesFinish = false;
    let deleteFinish = false;

    const updateProductData = {
        brand_id: req.body.brand_id,
        category_id: req.body.category_id,
        prod_name: req.body.prod_name,
        prod_description: req.body.prod_description,
        manufacturer: req.body.manufacturer,
        price: req.body.price,
        cost: req.body.cost,
        quantity: req.body.quantity,
        prod_percent: req.body.prod_percent,
        cpu: req.body.cpu,
        hard_drive: req.body.hard_drive,
        mux_switch: req.body.mux_switch,
        screen: req.body.screen,
        webcam: req.body.webcam,
        connection: req.body.connection,
        prod_weight: req.body.prod_weight,
        pin: req.body.pin,
        operation_system: req.body.operation_system
    };

    //Update Avata
    if (req.files.avatar) {
        updateProductData.avatar = 'https://phoenixlt.azurewebsites.net/upload/' + req.files.avatar[0].filename;
    } else {
        updateProductData.avatar = req.body.avatar;
    }

    if (req.body.images) {
        let listImages = Array.isArray(req.body.images) ? req.body.images : [req.body.images];
        let listImagesID = req.body.image_id
        console.log(listImagesID)
        IMAGES.find((err, images) => {
            // console.log(images)
            //Delete Images thừa
            if (images.length > listImages.length) {
                images.forEach(image => {
                    if (!listImagesID.includes(String(image.image_id))) {
                        console.log(image.image_id);
                        IMAGES.deleteById(productId, String(image.image_id), (err, result) => {
                            numDeleted++; // Tăng biến đếm sau mỗi lần xóa

                            // Kiểm tra nếu đã xóa đủ số lượng cần xóa
                            if (numDeleted === images.length - listImages.length) {
                                deleteFinish = true;
                                // Kiểm tra điều kiện để thực hiện hành động kết thúc
                                if (updateImagesFinish && updateProductFinish
                                    && deleteFinish && createFinish) {
                                    return res.json({ success: true });
                                }
                            }
                        })
                    }
                });

            } else {
                deleteFinish = true;
                // Kiểm tra điều kiện để thực hiện hành động kết thúc
                if (updateImagesFinish && updateProductFinish
                    && deleteFinish && createFinish) {
                    return res.json({ success: true });
                }
            }
        })
        listImages.forEach(async (image, index) => {
            await IMAGES.updateById(productId, index + 1, image, (err, product) => {
                if (err) {
                    return res.json({ "kq": 0, "errMsg": err });
                }
                dem++;
                // console.log(dem, listImages.length)
                if (dem == listImages.length) {
                    updateImagesFinish = true;
                    if (updateImagesFinish && updateProductFinish
                        && deleteFinish && createFinish) {
                        return res.json({ success: true });
                    }
                }
                // return res.json({ success: true });
            });
        });
    } else {
        deleteFinish = true;
        updateImagesFinish = true;
        if (updateImagesFinish && updateProductFinish
            && deleteFinish && createFinish) {
            return res.json({ success: true });
        }
    }

    //Add New Images
    if (req.files.images) {
        let listImage = req.files.images;
        listImage.forEach(image => {
            const newImage = new IMAGES({
                product_id: productId,
                url: 'https://phoenixlt.azurewebsites.net/upload/' + image.filename
            });
            IMAGES.create(newImage, (err, result) => {
                numCreate++;
                console.log(numCreate, req.files.images.length)
                if (numCreate === req.files.images.length) {
                    createFinish = true;
                    // Kiểm tra điều kiện để thực hiện hành động kết thúc
                    if (updateImagesFinish && updateProductFinish
                        && deleteFinish && createFinish) {
                        return res.json({ success: true });
                    }
                }
            })
        });
    } else {
        createFinish = true;
        if (updateImagesFinish && updateProductFinish
            && deleteFinish && createFinish) {
            return res.json({ success: true });
        }
    }

    await Products.updateById(productId, updateProductData, (err, product) => {
        if (err) {
            return res.json({ "kq": 0, "errMsg": err });
        }
        // return res.json({ success: true });
        updateProductFinish = true;
        if (updateImagesFinish && updateProductFinish
            && deleteFinish && createFinish) {
            return res.json({ success: true });
        }
    });


    // });
}




function deleteProduct(req, res) {
    Products.deleteById(req.params.id, (err, product) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            res.redirect('../management')
        }
    })
    // res.render('editProduct')
}

const getUsersFromReviews = async (reviews) => {
    const userIds = reviews.map(review => review.user_id);

    try {
        const users = await Promise.all(userIds.map(userId => USERS.findById(userId)));
        return users;
    } catch (error) {
        throw error;
    }
};

async function productDetail(req, res) {
    try {
        const productId = req.params.id;

        const product = await Products.findById(productId);
        if (product.length === 0) {
            return res.json({ "kq": 0, "errMsg": "Product not found" });
        }
        const category = await CATEGORIES.findById(product[0].category_id);
        // console.log(category[0].name)

        const images = await IMAGES.findByProductId(productId);

        const reviews = await REVIEWS.findByProductId(productId);
        const users = await getUsersFromReviews(reviews);
        // console.log(users)
        const nameUsersRated = users.map(user => user[0].name);
        // console.log(nameUsersRated)

        const responseData = {
            data: product[0],
            category: category[0].name,
            images: images,
            reviews: reviews,
            nameUsersRated: nameUsersRated
        };

        res.json(responseData);
    } catch (error) {
        console.error(error);
        res.status(500).json({ "kq": 0, "errMsg": "Server error" });
    }
}


function cart(req, res) {
    let token = req.body.token
    let tokenGID = req.body.tokenGID
    console.log(token, tokenGID)
    if (token) {
        let verify = jwt.verify(token, 'secretId')
        // res.render('cart')
        CART.findById(verify.id, (err, cart) => {
            if (!err) {
                // console.log(cart)
                // res.render("cart", { data: cart })
                res.json(cart)
            }
        });

    } else if (tokenGID) {
        CART.findByGID(tokenGID, (err, cart) => {
            if (!err) {
                // console.log(cart)
                // res.render("cart", { data: cart })
                res.json(cart)
            }
        });
    }

}

function cartServer(req, res) {
    CART.findById(2015, (err, cart) => {
        if (!err) {
            // console.log(cart)
            res.render("cart", { data: cart })
            // res.json(cart)
        }
    });
}

let isAlreadyInCart = false;

function addCart(req, res) {
    console.log(req.body)
    let token = req.body.token
    let tokenGID = req.body.tokenGID
    // console.log(token, tokenGID)
    if (token !== undefined) {
        let verify = jwt.verify(token, 'secretId')
        console.log(verify)
        CART.findById(verify.id, (err, cart) => {
            if (!err) {
                let foundInCart = false;

                cart.forEach(cartItem => {
                    if (cartItem.user_id == verify.id && cartItem.product_id == req.body.product_id) {
                        // console.log(cartItem);
                        foundInCart = true;

                        CART.updateById(verify.id, req.body.product_id, req.body.count, req.body.quantity, (err, cart) => {
                            if (!err) {
                                res.json({ success: true, redirectUrl: '../cart' });
                            }
                        });
                    }
                });

                console.log(foundInCart);
                if (foundInCart === false) {
                    const newCartItem = new CART({
                        user_id: verify.id,
                        product_id: req.body.product_id,
                        guest_id: null,
                        product_name: req.body.product_name,
                        avatar: req.body.avatar,
                        prod_description: req.body.prod_description,
                        price: req.body.price,
                        quantity: req.body.quantity,
                        count: req.body.count
                    });
                    console.log(newCartItem)

                    CART.create(newCartItem, (err, Cart) => {
                        if (!err) {
                            res.json({ success: true, redirectUrl: '../cart' });
                        }
                    });
                }

                isAlreadyInCart = false; // Đặt lại giá trị của isAlreadyInCart thành false sau khi xử lý mỗi sản phẩm
            }
        });
    } else if (tokenGID !== undefined) {
        console.log(tokenGID)
        CART.findByGID(tokenGID, (err, cart) => {
            if (!err) {
                let foundInCart = false;

                cart.forEach(cartItem => {
                    if (cartItem.guest_id == tokenGID && cartItem.product_id == req.body.product_id) {
                        // console.log(cartItem);
                        foundInCart = true;

                        CART.updateByGID(tokenGID, req.body.product_id, req.body.count, req.body.quantity, (err, cart) => {
                            if (!err) {
                                res.json({ success: true, redirectUrl: '../cart' });
                            }
                        });
                    }
                });

                console.log(foundInCart);
                if (foundInCart === false) {
                    const newCartItem = new CART({
                        user_id: null,
                        product_id: req.body.product_id,
                        guest_id: tokenGID,
                        count: req.body.count
                    });
                    console.log(newCartItem)

                    CART.create(newCartItem, (err, Cart) => {
                        if (!err) {
                            res.json({ success: true, redirectUrl: '../cart' });
                        }
                    });
                }

                isAlreadyInCart = false; // Đặt lại giá trị của isAlreadyInCart thành false sau khi xử lý mỗi sản phẩm
            }
        });
    }
}


function deleteCart(req, res) {
    let token = req.body.token;
    let tokenGID = req.body.tokenGID;

    const handleDelete = (user_id, guest_id, product_id) => {
        CART.deleteCart(user_id, guest_id, product_id, (err, product) => {
            if (err) {
                res.json({ "kq": 0, "errMsg": err });
            } else {
                res.json({ "success": true });
            }
        });
    };

    if (token !== undefined) {
        try {
            let verify = jwt.verify(token, 'secretId');
            let user_id = verify.id;
            handleDelete(user_id, null, req.body.product_id);
        } catch (err) {
            res.json({ "kq": 0, "errMsg": err.message });
        }
    } else if (tokenGID !== undefined) {
        handleDelete(null, tokenGID, req.body.product_id);
    }
}

function updateCart(req, res) {
    let token = req.body.token;
    let tokenGID = req.body.tokenGID;
    let cart = req.body.cart;

    const updateCartByUser = (userId, product) => {
        CART.updateByIdFromCart(userId, product.product_id, product.count, product.is_possible_to_order, (err, cart) => {
            if (err) {
                console.log(err)
            }
        });
    };

    const updateCartByGuest = (guestId, product) => {
        CART.updateByGIDFromCart(guestId, product.product_id, product.count, product.is_possible_to_order, (err, cart) => {
            if (err) {
                console.log(err)
            }
        });
    };

    if (token !== undefined) {
        try {
            let verify = jwt.verify(token, 'secretId');
            const userId = verify.id;
            cart.forEach(item => {
                updateCartByUser(userId, item);
            });

            res.json({ success: true });
        } catch (err) {
            res.json({ "kq": 0, "errMsg": err.message });
        }
    } else if (tokenGID !== undefined) {
        cart.forEach(item => {
            updateCartByGuest(tokenGID, item);
        });
        res.json({ success: true });

    }
}




function checkout(req, res) {
    let token = req.cookies.token
    let verify = jwt.verify(token, 'secretId')
    let productIds = req.query.product_id
    let dataUser
    let dataCart = []
    let totalMoney = 0;
    if (!Array.isArray(productIds)) {
        // Chuyển đổi thành mảng nếu không phải là mảng
        productIds = [productIds];
    }
    // console.log(productIds)
    // res.json(productIds)
    USERS.findById(verify.id, (err, user) => {
        if (!err) {
            dataUser = user
            let completedRequests = 0
            productIds.forEach(productId => {
                CART.findByProductId(productId, (err, cart) => {
                    if (!err) {
                        if (!dataCart.includes(cart[0])) {
                            dataCart.push(cart[0])
                            totalMoney += cart[0].product_total
                        }
                    }
                    completedRequests++
                    if (completedRequests === productIds.length) {
                        console.log(dataUser, dataCart)
                        res.render('checkout', { dataUser: dataUser[0], dataCart: dataCart, totalMoney: totalMoney })
                        res.json({ dataUser: dataUser[0], dataCart: dataCart, totalMoney: totalMoney })
                    }
                })
            })
        } else {
            console.error(err)
            res.render('error')
        }
    })
    // res.render('checkout')
}


function dataOrder(req, res) {
    const token = req.body.token;
    const tokenGID = req.body.tokenGID;

    // Tạo một đối tượng order để sử dụng chung
    const newOrder = new ORDERS({
        user_id: null,
        guest_id: null,
        avatar: req.body.avatar,
        note: req.body.note,
        paymentMethods: req.body.paymentMethod,
        total: req.body.total,
        name: req.body.name,
        email: req.body.email,
        user_address: req.body.userAddress,
        phone: req.body.phone,
        trading_code: '0',
        is_payment: 0,
        is_approved: 0,
        is_being_shipped: 0,
        is_transported: 0,
        is_success: 0
    });

    if (token !== undefined) {
        const verify = jwt.verify(token, 'secretId');
        newOrder.user_id = verify.id;
    } else if (tokenGID !== undefined) {
        newOrder.guest_id = tokenGID;
    }

    console.log(newOrder)

    ORDERS.create(newOrder, (err, order) => {
        if (err) {
            return res.json({ success: false, error: err });
        }
        console.log(order)

        const completedRequests = req.body.listProduct.length;
        let requestsCompleted = 0;

        req.body.listProduct.forEach(product => {
            const orderDetails = new ORDER_DETAILS({
                product_id: product.product_id,
                order_id: order.id,
                quantity: product.count,
                price: product.price
            });

            ORDER_DETAILS.create(orderDetails, (err) => {
                requestsCompleted++;

                if (requestsCompleted === completedRequests) {
                    res.json({ success: true, redirectUrl: '../order' });
                }
            });
        });
    });
}


function order(req, res) {
    const token = req.body.token;
    const tokenGID = req.body.tokenGID;
    let verify;
    let userId;
    if (token) {
        verify = jwt.verify(token, 'secretId')
        userId = verify.id
    }
    // console.log(typeof userId)
    ORDERS.findById(userId, tokenGID, (err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            // res.render("order", { data: order })
            // console.log(order)
            res.json(order)
        }
    })
}


function orderDetails(req, res) {
    let dataProduct = []
    let completedRequests = 0
    console.log(req.params.id)
    ORDER_DETAILS.findById(req.params.id, (err, orderDetails) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            orderDetails.forEach(async orderDetail => {
                const product = await Products.findById(orderDetail.product_id);
                if (product.length === 0) {
                    return res.json({ "kq": 0, "errMsg": "Product not found" });
                }

                dataProduct.push(product[0])


                // console.log(product[0].id)
                // res.render("productDetail", { data: product[0] })
                // res.json(product[0])

                completedRequests++
                if (completedRequests === orderDetails.length) {
                    console.log('xong')
                    res.json({ orderDetails: orderDetails, dataProduct: dataProduct })

                }
            })
            // res.render("editorderDetails", { data: orderDetails[0] })

        }
    });
}

function orderManagement(req, res) {
    ORDERS.find((err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            // console.log(order)
            res.json(order)
        }
    })
}

function updateOrder(req, res) {
    console.log(req.body)
    console.log(req.params.id)
    let order_id = req.params.id
    let is_payment = req.body.is_payment
    let is_approved = req.body.is_approved
    let is_being_shipped = req.body.is_being_shipped
    let is_transported = req.body.is_transported
    let is_success = req.body.is_success
    let countSuccessfulUpdate = 0
    if (is_payment === 1) {
        ORDERS.UpdatePaymentById(order_id, is_payment, (err, result) => {
            if (err) {
                console.log(err)
                res.json({ mess: "Cập nhật trạng thái thanh toán thất bại", errDetail: err })
            }
            console.log("Cập nhật trạng thái thanh toán thành công")
        })
    }
    if (is_approved === 1) {
        ORDERS.UpdateApprovedById(order_id, is_approved, (err, result) => {
            if (err) {
                console.log(err)
                res.json({ mess: "Cập nhật trạng thái đơn hàng thất bại", errDetail: err })
            }
            console.log("Cập nhật trạng thái đơn hàng thành công")
        })
    }
    if (is_being_shipped === 1) {
        ORDERS.UpdateShippingById(order_id, is_being_shipped, (err, result) => {
            if (err) {
                console.log(err)
                res.json({ mess: "Cập nhật trạng thái đơn hàng thất bại", errDetail: err })
            }
            console.log("Cập nhật trạng thái đơn hàng thành công")
        })
    }
    if (is_transported === 1) {
        ORDERS.UpdateShippedById(order_id, is_transported, (err, result) => {
            if (err) {
                console.log(err)
                res.json({ mess: "Cập nhật trạng thái đơn hàng thất bại", errDetail: err })
            }
            console.log("Cập nhật trạng thái đơn hàng thành công")
        })
    }
    if (is_success === 1) {
        ORDERS.UpdateSuccessById(order_id, is_success, (err, result) => {
            if (err) {
                console.log(err)
                res.json({ mess: "Cập nhật trạng thái đơn hàng thất bại", errDetail: err })
            }
            console.log("Cập nhật trạng thái đơn hàng thành công")
        })
    }
    res.json({ success: true })
    // res.render('editorder')
}

function orderShipped(req, res) {
    ORDERS.UpdateShippedById(req.params.id, (err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            res.redirect('../order-management')
        }
    })
    // res.render('editorder')
}

function orderSuccess(req, res) {
    ORDERS.UpdateSuccessById(req.params.id, (err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            res.redirect('../order-management')
        }
    })
    // res.render('editorder')
}

function orderReject(req, res) {
    ORDERS.UpdateRejectById(req.params.id, (err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            res.redirect('../order-management')
        }
    })
    // res.render('editorder')
}

function orderShipping(req, res) {
    ORDERS.UpdateShippingById(req.params.id, (err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            res.redirect('../order-management')
        }
    })
    // res.render('editorder')
}

function reviews(req, res) {
    let token = req.cookies.token
    let verify = jwt.verify(token, 'secretId')
    console.log(req.body)
    let completedRequests = 0
    req.body.product_id.forEach((productId, i) => {
        const review = new REVIEWS({
            user_id: verify.id,
            product_id: productId,
            rating: req.body.ratings[i],
            comment: req.body.comments[i]
        });


        // console.log(review)
        REVIEWS.create(review, (err, review) => {

            if (!err) {
                completedRequests++
            }
            if (completedRequests === req.body.product_id.length) {
                res.json({ success: true, redirectUrl: '../order' });


            }
        })

    });


}

function reviewsManagement(req, res) {
    let token = req.cookies.token
    let verify = jwt.verify(token, 'secretId')
    // let userId = verify.id
    // console.log(typeof userId)
    Products.find((err, products) => {
        if (!err) {
            res.render("reviewsManagement", { products: products })

        }
    });
}

function reviewsManagementByProduct(req, res) {
    REVIEWS.findByProductId(req.params.id, (err, reviews) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            // res.render("reviewsManagementByProduct", { reviews: reviews })
            // console.log(reviews)
            res.json(reviews)
        }
    })

}

function deleteReviews(req, res) {
    REVIEWS.deleteById(req.params.id, (err, review) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            res.redirect('../reviews-management')
        }
    })
    // res.render('editProduct')
}

function updateOrderIsRated(req, res) {
    ORDERS.updateOrderIsRatedById(req.params.id, (err, order) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            // console.log(order[0].id)
            // res.render("editorder", { data: order[0] })
            res.json({ success: true, redirectUrl: '../order' });
        }
    })
    // res.render('editProduct')
}

module.exports = {
    home, laptopGaming, getLaptopsByQuery, listImage, management, editProduct, editProductPost, deleteProduct, productDetail,
    cart, cartServer, addCart, deleteCart, updateCart, checkout, dataOrder, order, orderDetails, orderManagement,
    updateOrder, orderSuccess, orderReject, orderShipping, orderShipped, reviews, reviewsManagement,
    reviewsManagementByProduct, deleteReviews, updateOrderIsRated, users
}