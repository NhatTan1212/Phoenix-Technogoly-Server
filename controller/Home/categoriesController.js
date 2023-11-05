
const CATEGORIES = require('../../models/categories');
const BRANDS = require('../../models/brands');
const { v4: uuidv4 } = require('uuid');
const uuid = uuidv4();
const jwt = require('jsonwebtoken')



//multer
var multer = require('multer');
const { FALSE } = require('node-sass');

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


function categoriesList(req, res) {
    CATEGORIES.find((err, categories) => {
        if (!err) {
            // res.render("management", { data: product })
            res.json(categories)
        }
        else {
            console.log(err)

        }
    });
    // res.render("categoriesList")
}

function categoriesAddNew(req, res) {
    // USERS.findById
    // console.log(req.body)
    CATEGORIES.find((err, categories) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            // console.log(categories[0].id)
            // res.render("editcategories", { data: categories[0] })
            // res.json({data:categories.length})
            if (categories.length == 0) {
                // let category_id = 1;
                const category = new CATEGORIES({
                    category_id: 1,
                    name: req.body.name,
                    description: req.body.description
                });


                // console.log(order)
                CATEGORIES.create(category, (err, category) => {

                    if (!err) {

                        res.json({ success: true, redirectUrl: '../categories-management' });

                    }

                })
            }
        }
    })


}

function brandsList(req, res) {
    BRANDS.find((err, brands) => {
        if (!err) {
            // res.render("management", { data: product })
            res.json(brands)
        }
        else {
            console.log(err)

        }
    });
    // res.render("categoriesList")
}

function brandsAddNew(req, res) {
    // USERS.findById
    // console.log(req.body)
    BRANDS.find((err, brands) => {
        if (err) {
            res.json({ "kq": 0, "errMsg": err });
        }
        else {
            // console.log(brands[0].id)
            // res.render("editcategories", { data: brands[0] })
            // res.json({data:brands.length})
            if (brands.length == 0) {
                // let brand_id = 1;
                const brand = new BRANDS({
                    brand_id: 1,
                    name: req.body.name,
                    description: req.body.description
                });


                // console.log(order)
                BRANDS.create(brand, (err, brand) => {

                    if (!err) {

                        res.json({ success: true, redirectUrl: '../brands-management' });

                    }

                })
            }
        }
    })


}

module.exports = {
    categoriesList, categoriesAddNew,
    brandsAddNew, brandsList
}