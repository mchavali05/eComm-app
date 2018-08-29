var express = require('express');
var app = express();
var mysql = require('mysql');
var path = require('path');
var bodyParser = require('body-parser');

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
	extended: true
}));

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,
	user: "root",
	password: "",
	database: "ecomm_db"
});

//registration route
//login route
app.get('/register', function(req, res) {
	res.sendFile(path.join(__dirname, './public/registration.html'));
});

//login route
app.get('/login', function(req, res) {
	res.sendFile(path.join(__dirname, './public/login.html'));
});

//myAccount route
app.get('/myAccount', function(req, res) {
	res.sendFile(path.join(__dirname, './public/myaccount.html'));
});

//product route
//login route
app.get('/product', function(req, res) {
	res.sendFile(path.join(__dirname, './public/product.html'));
});

app.listen(3000);