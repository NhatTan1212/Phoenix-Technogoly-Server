// const {sql, connect} = require('../../connect');
const Products = require('../../models/product');
//multer
var multer = require('multer');
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


function controllerAdmin(req, res) {

    Products.find((err, product) => {
        if (!err) {
            console.log(req.session)
            // res.render("management", { data: product })
            res.json(product)
        }
    });
}


function addProducts(req, res) {
    res.render('addProducts')
}

function newProduct(req, res) {
    upload(req, res, async function (err) {
        if (err instanceof multer.MulterError) {
            res.json({ "kq": 0, "errMsg": "A Multer error occurred when uploading." });

        } else if (err) {
            res.json({ "kq": 0, "errMsg": "An unknown error occurred when uploading." + err });
        } else {
            const product = new Products({
                prod_name: req.body.prod_name,
                avatar: 'http://localhost:8000/upload/' + req.file.filename,
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
            });
            Products.create(product, (err, product) => {
                if (!err) {
                    res.redirect('../management')
                }
            })
        }

    });
}



module.exports = {
    controllerAdmin, addProducts, newProduct
}