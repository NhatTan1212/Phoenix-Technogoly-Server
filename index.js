const express = require('express');
const session = require('express-session');
const { sql, connect } = require('./connect');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
var passport = require('passport');
const cors = require('cors');

const app = express();

app.use(cors());
const path = require('path');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(session({
  secret: '123456tk',
  resave: false,
  saveUninitialized: true
}));
app.use(require('./routes/router').router)

app.set('view engine', 'ejs')
app.set('views', 'views')


// Set up a route to serve the login.html file
// app.use(express.static(path.join(__dirname, 'public')))

app.get('/', function (req, res) {
  res.json({ message: "hi" })
});






app.use(express.json());
app.use(passport.authenticate('session'));

// Start the browser and run the scraper

app.use(express.static('public'));
const port = process.env.PORT || 8000
// Start the server
app.listen(port, function () {
  console.log('Server is listening on port 8000');
});
