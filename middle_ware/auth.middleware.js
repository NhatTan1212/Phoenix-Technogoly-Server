const jwt = require('jsonwebtoken')

exports.loggedin = (req, res, next) => {
    let token = req.cookies.token
    let verify = jwt.verify(token, 'secretId')
    if (verify) {
        next();
    } else {
        res.redirect('http://localhost:3000/auth')
    }
}

exports.isAuth = (req, res, next) => {
    try {
        let token = req.cookies.token
        let verify = jwt.verify(token, 'secretId')
        if (verify.role === 'admin') {
            next()
            // res.redirect('/admin');
        } else if (verify.role === 'user') {
            next()
        } else {
            res.redirect('http://localhost:3000/auth');
        }
    } catch (error) {
        console.log(error)
        res.redirect('http://localhost:3000/auth');

    }
}


exports.isAuthJson = (req, res, next) => {
    try {
        let token = req.cookies.token
        let verify = jwt.verify(token, 'secretId')
        if (verify.role === 'admin') {
            next()
            // res.redirect('/admin');
        } else if (verify.role === 'user') {
            next()
        } else {
            res.json({ message: "not logged in", redirectUrl: "http://localhost:3000/auth" })
        }
    } catch (error) {
        console.log(error)
        res.redirect('http://localhost:3000/auth');

    }
}

exports.isAuthAdmin = (req, res, next) => {

    try {
        console.log(req.body)
        let token = req.body.token
        let verify = jwt.verify(token, 'secretId')


        //     // console.log(verify.role === 'admin')
        if (verify.role === 'admin') {
            console.log('hi')
            next()
        } else if (verify.role === 'user') {
            res.json({ error: 'Ban khong co quyen truy cap vao duong dan nay!' })
        } else {
            res.status(401).json({ error: 'Token not found!' });
        }
    } catch (error) {
        console.log("lỗi tại middle ware isAuthAdmin: ", error)
        res.json({ message: 'Lỗi server isAuthAdmin!', error });

    }
}

