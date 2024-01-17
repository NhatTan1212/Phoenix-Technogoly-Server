// const {sql, connect} = require('../../connect');
const IMAGES = require('../../models/images');
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
    console.log(req.body);
    console.log(req.files.avatar[0]);
    console.log(req.files.images);
    let numCreate = 0;
    let addImagesSuccessful = false;
    const product = new Products({
        avatar: 'http://localhost:8000/upload/' + req.files.avatar[0].filename,
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
        ram: req.body.ram,
        mux_switch: req.body.mux_switch,
        screen: req.body.screen,
        webcam: req.body.webcam,
        connection: req.body.connection,
        prod_weight: req.body.prod_weight,
        pin: req.body.pin,
        operation_system: req.body.operation_system,
        graphics: req.body.graphics
    });
    Products.createWithPromise(product).then(() => {
        if (req.files.images) {
            Products.selectLast((err, id) => {
                console.log(id);
                let listImage = req.files.images;
                listImage.forEach(image => {
                    const newImage = new IMAGES({
                        product_id: id,
                        url: 'http://localhost:8000/upload/' + image.filename
                    });
                    IMAGES.create(newImage, (err, result) => {
                        numCreate++;
                        console.log(numCreate, req.files.images.length)
                        if (numCreate === req.files.images.length) {
                            addImagesSuccessful = true;
                        }
                        if (addImagesSuccessful) {
                            return res.json({ success: true });
                        }
                    })
                });
            })
        } else {
            res.json({ success: false, message: "Can not find list images of product" })
        }
    })
        .catch((err) => {
            console.log(err);
            res.json({ success: false })
        })
}



module.exports = {
    controllerAdmin, addProducts, newProduct
}