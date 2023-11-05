const { sql, connect } = require('../connect');

const PROVIDED_USERS = function (user) {
    this.user_id = user.user_id;
    this.name = user.name;
    // this.email = user.email;
    this.provider = user.provider;
    this.subject = user.subject;

};

PROVIDED_USERS.create = async (user, result) => {
    const pool = await connect;
    const sqlStringAddProduct = `
    insert into PROVIDED_USERS(user_id,name,provider,subject) 
    values( @user_id,@name,@provider,@subject)
    `;
    await pool.request()
        .input('user_id', sql.Int, user.user_id)
        .input('name', sql.NVARCHAR(100), user.name)
        // .input('email', sql.VARCHAR(100), user.email)
        .input('provider', sql.VARCHAR(255), user.provider)
        .input('subject', sql.VARCHAR(255), user.subject)
        .query(sqlStringAddProduct, (err, data) => {
            if (err) {
                console.log(err)
            } else {
                console.log('success')
            }
            result(null, data.recordset);
            sql.close();
        })
};

PROVIDED_USERS.findByIdProvider = async (subject, provider, result) => {

    const pool = await connect;
    const sqlStringAdduser = `
        select * FROM PROVIDED_USERS where subject = @subject and provider = @provider
    `;
    await pool.request()
        .input('subject', sql.VARCHAR(255), subject)
        .input('provider', sql.NVARCHAR(255), provider)
        .query(sqlStringAdduser, (err, data) => {
            if (err) {
                console.log(err)
            }
            //  else if (data.recordset.length) {
            //     result(null, data.recordset[0])
            //     return;
            // }

            // console.log(data.recordset)
            result(null, data.recordset);

        })
}




module.exports = PROVIDED_USERS;