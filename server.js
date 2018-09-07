var express = require('express');
var app = express();
var mysql = require('mysql');
var path = require('path');
var bodyParser = require('body-parser');
//session stuff
var cookieParser = require('cookie-parser');
var session = require('express-session');
app.set('view engine','ejs');


//allow sessions
app.use(session({ secret: 'app', cookie: { maxAge: 1*1000*60*60*24*365 }}));

app.use(cookieParser());

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
	extended: true
}));

var connection = mysql.createConnection({
	host: "localhost",
	port: 8889,
	user: "root",
	password: "root",
	database: "ecomm_db"
});

app.get('/',function(req,res){
	res.render('pages/index');
});

app.get('/signup',function(req,res){
	res.render('pages/signup');
});

app.get('/signup',function(req,res){
	res.render('pages/login');
});

//registration route
app.get('/register', function(req, res) {
	res.sendFile(path.join(__dirname, './public/registration.html'));
});

app.post('/createAccount', function(req, res) {
	var query = connection.query(
	  "INSERT INTO users SET ?",
	  [req.body],
	  function(err, results) {
		console.log(err);

			var query = connection.query("SELECT * FROM USERS WHERE EMAIL = '"+req.body.email+"'",function(err,resultset){
				console.log(query);
				console.log(err);
				if (resultset.length == 0){
					res.sendFile(path.join(__dirname, './public/error.html'));
				}else {
					req.session.userid = resultset[0].id;
					req.session.email = resultset[0].email;
					res.render('pages/myaccount',req.session);
				}		
			});
		});
});

app.post('/login', function(req, res) {
	var query = connection.query("SELECT * FROM USERS WHERE EMAIL = '"+req.body.email+"' AND PASSWORD = '"+req.body.password+"'",function(err,resultset){
		console.log(query);
		console.log(err);
		if (resultset.length == 0){
			res.redirect('/user-error');
		}else {
			req.session.userid = resultset[0].id;
			req.session.ufname = resultset[0].first_name;
			req.session.email = resultset[0].email;
			res.redirect("/user-profile");
		}		
	});
});
app.get('/user-error', function(req, res) {
	res.render('pages/login',{
		error:'true',
		msg:'Invalied Email'
	});
});

// app.get('/getuserinfo', function(req, res) {
// 	var user_info = {
// 		user_id: req.session.userid,
// 		user_email: req.session.email
// 	}
// 	res.json();
// });

//login route
app.get('/login', function(req, res) {

	res.render('pages/login',{
		error:'false'
	});
});

app.get('/user-profile', function(req, res) {
	res.render('pages/myaccount',{
		error:'false',
		ufname: req.session.ufname
	});
});

//product route
app.get('/product', function(req, res) {
	res.sendFile(path.join(__dirname, './public/product.html'));
});

app.listen(3000);

