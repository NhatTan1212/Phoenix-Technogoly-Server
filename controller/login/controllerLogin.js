const { sql, connect } = require('../../connect');
const bcrypt = require('bcrypt');

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
    const pool = await connect;


    let sqlString = 'SELECT * FROM USERS';
    return await pool.request().query(sqlString, async (err, data) => {
      // console.log(data.recordset)
      let dataUsers = data.recordset;
      let authenticated = false;
      let roleUser;
      let userId;
      for (let i = 0; i < dataUsers.length; i++) {
        let passIsMatch = await bcrypt.compare(pass, dataUsers[i].password)
        if (passIsMatch == true && dataUsers[i].email == email) {
          // console.log('Đăng nhập thành công!')
          roleUser = dataUsers[i].role;
          userId = dataUsers[i].id
          authenticated = true;
          break;
          // req.session.user = user;

          // res.send({message: "Successfully!"})
        }
        else {
          authenticated = false;

        }
      }
      // console.log(roleUser)

      if (authenticated && roleUser == 'admin') {
        req.session.loggedin = true;
        req.session.role = 'admin';
        req.session.userId = userId;
        console.log(req.session)
        res.json({ success: true, redirectUrl: '../management', role: roleUser, userId: userId });
      } else if (authenticated && roleUser == 'user') {
        req.session.loggedin = true;
        req.session.role = 'user';
        req.session.userId = userId;
        console.log(req.session)
        res.json({ success: true, redirectUrl: '../', role: roleUser, userId: userId });
      }
      else {
        res.json({ success: false });
      }
    })

  } catch (error) {
    console.log('lỗi ở method GET /userLogin', error);
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