const { sql, connect } = require('../../connect');
const bcrypt = require('bcrypt');
const USERS = require('../../models/user');
const jwt = require('jsonwebtoken')

function controllerLogin(req, res) {
    res.render('login')
}

async function selectAllUsers(req, res) {
    try {
        const pool = await connect;
        var sqlString = 'SELECT * FROM USERS';
        return await pool.request().query(sqlString, (err, data) => {
            res.send({ search: data.recordset });
        })
    } catch (error) {
        console.log('lỗi ở method GET /users', error);
    }
}


async function register(req, res) {
    try {
        const name = req.body.name
        const email = req.body.email
        const pass = req.body.pass
        const pool = await connect;
        let emailAlreadyExists = false;
        const hashedPass = await bcrypt.hash(pass, 10);
        // const hashedEmail = await bcrypt.hash(email, 10);

        let sqlStringSelectUsers = 'SELECT * FROM USERS';
        await pool.request().query(sqlStringSelectUsers, async (err, data) => {
            // console.log(data.recordset)
            let dataUsers = data.recordset;

            for (let i = 0; i < dataUsers.length; i++) {
                // console.log(dataUsers[i].email, email)
                if (dataUsers[i].email == email) {
                    emailAlreadyExists = true;
                    break;
                }
            }

            if (emailAlreadyExists == true) {
                res.send({ emailAlreadyExists: emailAlreadyExists })
            } else {
                const sqlStringAddSearch = `
            insert into USERS(name,password,email,role) 
            values(@name,@password,@email,'user')
            `;
                await pool.request()
                    .input('name', sql.NVARCHAR(100), name)
                    .input('password', sql.VARCHAR(255), hashedPass)
                    .input('email', sql.VARCHAR(100), email)
                    .query(sqlStringAddSearch, (err, data) => {
                        res.send({ emailAlreadyExists: emailAlreadyExists })
                    })
            }
        })







    } catch (error) {
        console.log('lỗi ở method GET /search', error);
    }
}

async function login(req, res) {
    try {
        const email = req.body.email
        const pass = req.body.pass
        USERS.findByEmail(email, async (err, data) => {
            let dataUser = data[0];
            if (dataUser === undefined) {
                return res.json({ message: 'Sai tài khoản hoặc mật khẩu!' })
            } else {
                let passIsMatch = await bcrypt.compare(pass, dataUser.password)
                if (passIsMatch == true && dataUser.email == email) {
                    let roleUser = dataUser.role;
                    login = (roleUser, redirectUrl) => {
                        let token = jwt.sign({
                            id: dataUser.id,
                            role: roleUser
                        }, 'secretId')
                        return res.json({
                            success: true,
                            message: 'Đăng nhập thành công!',
                            token: token,
                            redirectUrl: redirectUrl
                        })
                    }
                    console.log(roleUser)
                    if (roleUser === 'admin') {
                        let redirectUrl = '/management'
                        login(roleUser, redirectUrl);
                    } else if (roleUser === 'user') {
                        let redirectUrl = '/'
                        login(roleUser, redirectUrl);
                    }
                }
                else {
                    return res.json({ message: 'Sai tài khoản hoặc mật khẩu!' })

                }
            }
        })

    } catch (error) {
        console.log('lỗi ở method POST /userLogin', error);
    }
}

function logout(req, res) {
    req.session.destroy((err) => {
        if (err) res.redirect('/500');
        res.redirect('/login');
    })
}




module.exports = {
    controllerLogin, selectAllUsers, register, login, logout
}