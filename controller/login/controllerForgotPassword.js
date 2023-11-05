const { sql, connect } = require('../../connect');
const bcrypt = require('bcrypt');
const mailer = require('../../utils/mailer.js');
const USERS = require('../../models/user');

function showForgotForm(req, res) {
    res.render('auth/passwords/email');
}

function sendResetLinkEmail(req, res) {
    // console.log(req.body)
    if (!req.body.email) {
        // console.log("hi2")
        res.redirect("http://localhost:3000/password/reset")
    } else {
        // console.log("hi")
        USERS.findByEmail(req.body.email, (err, user) => {
            if (!user) {
                res.json({ status: false, message: 'Email này chưa được đăng ký tài khoản!' })
            } else {
                // console.log()
                bcrypt.hash(user[0].email, 10).then((hashedEmail) => {
                    mailer.sendMail(user[0].email, "Reset password website bán laptop",
                        `
                    <p>Nhấn vào link bên dưới để reset password:</p>
                    <a href="http://localhost:3000/password/update/${user[0].email}?token=${hashedEmail}"> Reset Password </a>
                    `)
                    // console.log(`http://localhost:8000/password/reset/${user[0].email}?token=${hashedEmail}`);
                })
                res.redirect('/password/reset?status=success')
            }
        })
    }
}

function showResetForm(req, res) {
    if (!req.params.email || !req.query.token) {
        res.redirect('/password/reset')
    } else {
        res.render('auth/passwords/reset', { email: req.params.email, token: req.query.token })
    }
}

function reset(req, res) {
    const { email, token, password } = req.body;
    console.log(email, token, password);
    if (!email || !token || !password) {
        res.redirect('http://localhost:3000/password/reset');
    } else {
        bcrypt.compare(email, token, (err, result) => {
            console.log('compare', result);
            if (result == true) {
                bcrypt.hash(password, 10).then((hashedPassword) => {
                    USERS.resetPassword(email, hashedPassword, (err, result) => {
                        if (!err) {
                            res.json({ status: true, message: 'Thay đổi mật khẩu thành công' })
                        } else {
                            res.json({ status: false, message: 'Thay đổi mật khẩu không thành công vui lòng thử lại!' })
                        }
                    })
                })
            } else {
                res.redirect('http://localhost:3000/password/reset');
            }
        })
    }
}

module.exports = {
    showForgotForm, sendResetLinkEmail, showResetForm, reset
}