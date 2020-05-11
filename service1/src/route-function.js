const express = require('express');
const app = express();
const path = require('path');
const db = require('./db-connect.js');
const middle = require('./middleware.js');
const cookieParser = require('cookie-parser');
const fs = require('fs');
const session = require('express-session');
const bodyParser = require('body-parser');
const { google } = require('googleapis');
const jwt = require('jsonwebtoken');
const md5 = require('md5');
const request = require('request');

app.use(cookieParser());

app.use(session({
	secret: '123456',
	saveUninitialized : true, 
	resave : true,
	cookie: { 
		secure: false,
		maxAge: 24 * 60 * 60 * 1000
	},
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

var sess = session;

exports.index = function(req, res) {
	res.json("Works");
}

exports.testMobilePulsa = function(req, res) {
	var path = "https://testprepaid.mobilepulsa.net/v1/legacy/index";
    var username = "08111804094";
    var apikey = "8015c4fcdb04df0e";
    var signTxt = md5(username+apikey+"pl");

	request.post(path, {
		json: {
			"commands": "pricelist",
			"username": username,
			"sign": signTxt,
		}
	},
	function(error, response, body){
			console.log(body);
			res.json(body);	
	});
}

exports.registerAdmin = function(req, res) {
	var username = req.body.username;
	var password = req.body.password;

	db.query("INSERT INTO admin (id, username, password, role_id) VALUES ('', '"+username+"', '"+password+"', 1)", function(result) {	
		res.json(1);
	});
}

exports.loginAdmin = function(req, res) {
	var username = req.body.username;
	var password = req.body.password;

	db.query("SELECT * FROM admin WHERE username = '"+username+"' AND password = '"+password+"'", function(result) {
		if(result.length) {
			sess.user = result[0];

			db.query("UPDATE admin SET date_login = '"+middle.getDate()+"', time_login = '"+middle.getTime()+"' WHERE id = "+sess.user.id, function(result) {
				console.log("Logged in at " + middle.getDate() + " " + middle.getTime());
			});
			jwt.sign({
				id: result[0].id,
				username: result[0].username,
				role: 'admin'
			},'kuda', {expiresIn: '24h'}, (err, token) => {
	    		res.json(token);
	      	});
		}
		else {
			console.log(404);
			res.json(404);
		}
	});
}

exports.loginUser = function(req, res) {
	var phone_number = req.body.phone_number;
	var password = req.body.password;

	db.query("SELECT * FROM user_manual WHERE phone_number = '"+phone_number+"' AND password = '"+password+"'", function(result) {
		if(result.length) {
			sess.user = result[0];

			db.query("SELECT id FROM user WHERE phone_number = '"+phone_number+"'", function(result) {
				db.query("INSERT INTO login_user (id, user_id, date, time) VALUES ('', "+result[0].id+", '"+middle.getDate()+"', '"+middle.getTime()+"')", function(result) {
					console.log("Logged in at " + middle.getDate() + " " + middle.getTime());
				});

				jwt.sign({
					id: result[0].id,
					username: result[0].phone_number,
					role: 'user'
				},'kuda', {expiresIn: '24h'}, (err, token) => {
		    		res.json(token);
		      	});
			});
		}
		else {
			console.log(404);
			res.json(404);
		}
	});
}

exports.guest = function(req, res) {
	jwt.sign({
		role: 'guest'
	},'kuda', {expiresIn: '24h'}, (err, token) => {
		res.json(token);
  	});
}

exports.getOneMerchant = function(req, res) {
	db.query("SELECT * FROM merchant WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getMerchant = function(req, res) {
	db.query("SELECT * FROM merchant", function(result) {
		res.json(result);
	});
}

exports.addMerchant = function(req, res) {
	var name = req.body.name;

	db.query("INSERT INTO merchant (id, name) VALUES ('', '"+name+"')", function(result) {	
		res.json(result);
	});
}

exports.editMerchant = function(req, res) {
	var name = req.body.name;
    var image = req.body.image;

	db.query("UPDATE merchant SET name = '"+name+"', image = '"+image+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM deals WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM deals", function(result) {
		res.json(result);
	});
}

exports.addDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var hot_deals = req.body.hot_deals;
    var best_deals = req.body.best_deals;
    var point = req.body.point;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO deals (id, name, audience_id, start_date, end_date, description, action, action_link, merchant_id, type, category_id, hot_deals, best_deals, point, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+action+"', '"+action_link+"', '"+merchant_id+"', '"+type+"', '"+category_id+"', "+hot_deals+", "+best_deals+", "+point+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var hot_deals = req.body.hot_deals;
    var best_deals = req.body.best_deals;
    var point = req.body.point;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE deals SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', banner = '"+banner+"', merchant_id = "+merchant_id+", type = '"+type+"', category_id = "+category_id+", hot_deals = "+hot_deals+", best_deals = "+best_deals+", point = "+point+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneEarn = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM earn WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getEarn = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM earn", function(result) {
		res.json(result);
	});
}

exports.addEarn = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var best_activities = req.body.best_activities;
    var hot_activities = req.body.hot_activities;
    var point = req.body.point;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO earn (id, name, audience_id, start_date, end_date, description, action, action_link, merchant_id, type, category_id, best_activities, hot_activities, point, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+action+"', '"+action_link+"', "+merchant_id+", '"+type+"', "+category_id+", "+best_activities+", "+hot_activities+", "+point+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editEarn = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var best_activities = req.body.best_activities;
    var hot_activities = req.body.hot_activities;
    var point = req.body.point;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE earn SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', banner = '"+banner+"', merchant_id = "+merchant_id+", type = '"+type+"', category_id = "+category_id+", best_activities = "+best_activities+", hot_activities = "+hot_activities+", point = "+point+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneWin = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM win WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getWin = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM win", function(result) {
		res.json(result);
	});
}

exports.addWin = function(req, res) {
	var name = req.body.name;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var point_redeem = req.body.point_redeem;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var hot_prize = req.body.hot_prize;
    var best_prize = req.body.best_prize;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO win (id, name, audience_id, start_date, end_date, description, point_redeem, type, category_id, hot_prize, best_prize, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', "+point_redeem+", '"+type+"', "+category_id+", "+hot_prize+", "+best_prize+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editWin = function(req, res) {
	var name = req.body.name;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var point_redeem = req.body.point_redeem;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var hot_prize = req.body.hot_prize;
    var best_prize = req.body.best_prize;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE win SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', banner = '"+banner+"', point_redeem = "+point_redeem+", type = '"+type+"', category_id = "+category_id+", hot_prize = "+hot_prize+", best_prize = "+best_prize+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneProductDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM product_deals WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getProductDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM product_deals", function(result) {
		res.json(result);
	});
}

exports.addProductDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var price = req.body.price;
    var discount = req.body.discount;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var hot_deals = req.body.hot_deals;
    var best_deals = req.body.best_deals;
    var point = req.body.point;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO product_deals (id, name, audience_id, start_date, end_date, description, price, discount, merchant_id, type, category_id, hot_deals, best_deals, point, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', "+price+", "+discount+", "+merchant_id+", '"+type+"', "+category_id+", "+hot_deals+", "+best_deals+", "+point+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editProductDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var price = req.body.price;
    var discount = req.body.discount;
    var type = req.body.type;
    var category_id = req.body.category_id;
    var hot_deals = req.body.hot_deals;
    var best_deals = req.body.best_deals;
    var point = req.body.point;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE product_deals SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', price = "+price+", discount = "+discount+", image = '"+image+"', banner = '"+banner+"', merchant_id = "+merchant_id+", type = '"+type+"', category_id = "+category_id+", hot_deals = "+hot_deals+", best_deals = "+best_deals+", point = "+point+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneAudience = function(req, res) {
	db.query("SELECT * FROM audience WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getAudience = function(req, res) {
	db.query("SELECT * FROM audience", function(result) {
		res.json(result);
	});
}

exports.addAudience = function(req, res) {
	var name = req.body.name;
    var city = req.body.city;
    var gender = req.body.gender;
    var age_start = req.body.age_start;
    var age_end = req.body.age_end;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO audience (id, name, city, gender, age_start, age_end, date, time) VALUES ('', '"+name+"', '"+city+"', '"+gender+"', '"+age_start+"', '"+age_end+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editAudience = function(req, res) {
	var name = req.body.name;
    var city = req.body.city;
    var gender = req.body.gender;
    var age_start = req.body.age_start;
    var age_end = req.body.age_end;

	db.query("UPDATE audience SET name = '"+name+"', city = '"+city+"', gender = '"+gender+"', age_start = '"+age_start+"', age_end = '"+age_end+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneCategory = function(req, res) {
	db.query("SELECT * FROM category WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getCategory = function(req, res) {
	db.query("SELECT * FROM category", function(result) {
		res.json(result);
	});
}

exports.addCategory = function(req, res) {
	var name = req.body.name;

	db.query("INSERT INTO category (id, name) VALUES ('', '"+name+"')", function(result) {	
		res.json(result);
	});
}

exports.editCategory = function(req, res) {
	var name = req.body.name;

	db.query("UPDATE category SET name = '"+name+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getLottery = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM lottery WHERE user_id ="+req.query.user_id, function(result) {
		res.json(result);
	});
}

exports.addLottery = function(req, res) {
	var lottery_code = req.body.lottery_code;
    var user_id = req.body.user_id;
    var win_id = req.body.win_id;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO lottery (id, lottery_code, user_id, win_id, date, time) VALUES ('', '"+lottery_code+"', "+user_id+", "+win_id+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.shuffleLottery = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM lottery", function(result) {
		var participants = result.length;
		var shuffle = Math.floor((Math.random() * participants));
		res.json(result[shuffle]);
	});
}

exports.getOneNews = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM news WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getNews = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM news", function(result) {
		res.json(result);
	});
}

exports.addNews = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var source = req.body.source;
    var description = req.body.description;
    var source_link = req.body.source_link;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_news = req.body.hot_news;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO news (id, title, start_date, end_date, source, description, source_link, point, hot_entertainment, hot_news, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+source+"', '"+description+"', '"+source_link+"', '"+point+"', "+hot_entertainment+", "+hot_news+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editNews = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var source = req.body.source;
    var description = req.body.description;
    var source_link = req.body.source_link;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_news = req.body.hot_news;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE news SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', source = '"+source+"', description = '"+description+"', source_link = '"+source_link+"', point = '"+point+"', hot_entertainment = "+hot_entertainment+", hot_news = "+hot_news+",  image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneWatch = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM watch WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getWatch = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM watch", function(result) {
		res.json(result);
	});
}

exports.addWatch = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var video_url = req.body.video_url;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_watch = req.body.hot_watch;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO watch (id, title, start_date, end_date, video_url, point, hot_entertainment, hot_watch, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+video_url+"', '"+point+"', "+hot_entertainment+", "+hot_watch+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editWatch = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var video_url = req.body.video_url;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_watch = req.body.hot_watch;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE watch SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', video_url = '"+video_url+"', point = '"+point+"', hot_entertainment = "+hot_entertainment+", hot_watch = "+hot_watch+", image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneEvent = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM event WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getEvent = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM event", function(result) {
		res.json(result);
	});
}

exports.addEvent = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var description = req.body.description;
    var location = req.body.location;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var audience_id = req.body.audience_id;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_event = req.body.hot_event;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO event (id, title, start_date, end_date, description, location, action, action_link, audience_id, point, hot_entertainment, hot_event, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+location+"', '"+action+"', '"+action_link+"', '"+audience_id+"','"+point+"', "+hot_entertainment+", "+hot_event+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editEvent = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var description = req.body.description;
    var location = req.body.location;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var audience_id = req.body.audience_id;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_event = req.body.hot_event;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE event SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', location = '"+location+"', action = '"+action+"', action_link = '"+action_link+"', audience_id = '"+audience_id+"', point = '"+point+"', hot_entertainment = "+hot_entertainment+", hot_event = "+hot_event+", image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneHoroscope = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM horoscope WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getHoroscope = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM horoscope", function(result) {
		res.json(result);
	});
}

exports.addHoroscope = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var zodiac_sign = req.body.zodiac_sign;
    var description = req.body.description;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_horoscope = req.body.hot_horoscope;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO horoscope (id, title, start_date, end_date, zodiac_sign, description, point, hot_entertainment, hot_horoscope, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+zodiac_sign+"', '"+description+"', '"+point+"', "+hot_entertainment+", "+hot_horoscope+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editHoroscope = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var zodiac_sign = req.body.zodiac_sign;
    var description = req.body.description;
    var point = req.body.point;
    var hot_entertainment = req.body.hot_entertainment;
    var hot_horoscope = req.body.hot_horoscope;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE horoscope SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', zodiac_sign = '"+zodiac_sign+"', description = '"+description+"', point = '"+point+"', hot_entertainment = "+hot_entertainment+", hot_horoscope = "+hot_horoscope+", image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneVoucher = function(req, res) {
	db.query("SELECT * FROM voucher WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getVoucher = function(req, res) {
	db.query("SELECT * FROM voucher", function(result) {
		res.json(result);
	});
}

exports.addVoucher = function(req, res) {
	var type = req.body.type;
    var vendor = req.body.vendor;
    var merchant = req.body.merchant;
    var product_code = req.body.product_code;
    var product_value = req.body.product_value;
    var price = req.body.price;
    var dealio_points = req.body.dealio_points;

	db.query("INSERT INTO voucher (id, type, vendor, merchant, product_code, product_value, price, dealio_points) VALUES ('', '"+type+"', '"+vendor+"', '"+merchant+"', '"+product_code+"', '"+product_value+"', "+price+", "+dealio_points+")", function(result) {	
		res.json(result);
	});
}

exports.editVoucher = function(req, res) {
	var type = req.body.type;
    var vendor = req.body.vendor;
    var merchant = req.body.merchant;
    var product_code = req.body.product_code;
    var product_value = req.body.product_value;
    var price = req.body.price;
    var dealio_points = req.body.dealio_points;
    var image = req.body.image;

	db.query("UPDATE voucher SET type = '"+type+"', vendor = '"+vendor+"', merchant = '"+merchant+"', product_code = '"+product_code+"', product_value = '"+product_value+"', price = "+price+", dealio_points = "+dealio_points+", image = '"+image+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneSurvey = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM survey WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getSurvey = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM survey", function(result) {
		res.json(result);
	});
}

exports.addSurvey = function(req, res) {
	var title = req.body.title;
	var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO survey (id, title, date, time) VALUES ('', '"+title+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editSurvey = function(req, res) {
	var title = req.body.title;

	db.query("UPDATE survey SET title = '"+title+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getSurveyQuestion = function(req, res) {
	db.query("SELECT * FROM survey_question", function(result) {
		res.json(result);
	});
}

exports.addSurveyQuestion = function(req, res) {
	var title = req.body.title;
	var type = req.body.type;
    var survey_id = req.body.survey_id;

	db.query("INSERT INTO survey_question (id, title, type, survey_id) VALUES ('', '"+title+"', '"+type+"', "+survey_id+")", function(result) {	
		res.json(result);
	});
}

exports.getSurveyQuestionChoice = function(req, res) {
	db.query("SELECT * FROM survey_question_choice", function(result) {
		res.json(result);
	});
}

exports.addSurveyQuestionChoice = function(req, res) {
	var choice = req.body.choice;
    var survey_question_id = req.body.survey_question_id;

	db.query("INSERT INTO survey_question_choice (id, choice, survey_question_id) VALUES ('', '"+choice+"', "+survey_question_id+")", function(result) {	
		res.json(result);
	});
}

exports.getSurveyResponse = function(req, res) {
	db.query("SELECT * FROM survey_response", function(result) {
		res.json(result);
	});
}

exports.addSurveyResponse = function(req, res) {
	var response = req.body.response;
	var user_id = req.body.user_id;
    var survey_question_id = req.body.survey_question_id;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO survey_response (id, response, user_id, survey_question_id, date, time) VALUES ('', '"+response+"', "+user_id+", "+survey_question_id+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.postImage = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json(404);
	}
}

exports.postBanner = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json(404);
	}
}

exports.postMerchantImage = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json(404);
	}
}

exports.userRegisterPhone = function(req, res) {
	var phone_number = req.body.phone_number;
	var status_regis = 0;
	var date = middle.getDate();
	var time = middle.getTime();

	db.query("SELECT * FROM regis_phone_number WHERE phone_number = '"+phone_number+"' AND status_regis = 1", function(result) {
		if(result.length != 0) {
			res.json(404);
		}
		else {
			db.query("SELECT * FROM regis_phone_number WHERE phone_number = '"+phone_number+"' AND status_regis = 0", function(result) {
				if(result.length >= 3) {
					res.json(403);
				}
				else {
					db.query("INSERT INTO regis_phone_number (id, phone_number, status_regis, date, time) VALUES ('', '"+phone_number+"', '"+status_regis+"', '"+date+"', '"+time+"')", function(result) {	
						res.json(result);
					});
				}
			});
		}
	});
}

exports.userRegisterOtp = function(req, res) {
	var regis_phone_number_id = req.body.regis_phone_number_id;
	var otp_code = req.body.otp_code.substr(req.body.otp_code.length-4);
	var date = middle.getDate();
	var time = middle.getTime();

	db.query("INSERT INTO otp_regis (id, regis_phone_number_id, otp_code, date, time) VALUES ('', '"+regis_phone_number_id+"', '"+otp_code+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.checkRegisterOtp = function(req, res) {
	var id = req.body.id;
	var otp_code = req.body.otp_code;
	var regis_phone_number_id = req.body.regis_phone_number_id;
	var phone_number = req.body.phone_number;

	db.query("SELECT * FROM otp_regis WHERE id = "+id, function(result) {
		if(result[0].otp_code == otp_code) {
			db.query("UPDATE regis_phone_number SET status_regis = 2 WHERE phone_number = '"+ phone_number+"' AND status_regis = 0", function(result) {	
				db.query("UPDATE regis_phone_number SET status_regis = 1 WHERE id = "+ regis_phone_number_id, function(result) {	
					res.json(200);
				});
			});
		}
		else {
			res.json(403);
		}
	});
}

exports.citcallOtp = function(req, res) {
	db.query("SELECT * FROM regis_phone_number WHERE id = "+req.query.id, function(result) {
		request.post({
			headers: {'Content-Type' : 'application/json', 'Authorization': 'Apikey 5e69e97b699f5c31dcc16c5e63568e3c'},
		  	url: 'http://104.199.196.122/gateway/v3/asynccall',
		  	json: {"msisdn": result[0].phone_number, "gateway":1}
		}, function(error, response, body){
		  console.log(body);
		  res.json({result, body});
		});
	});
}

exports.getOnePhoneRegis = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM regis_phone_number WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.registerUser = function(req, res) {
	var phone_number = req.body.phone_number;
	var name = req.body.name;
	var email = req.body.email;
	var password = req.body.password;
	var login_method = req.body.login_method;
	var email_verified = 0;
	var date = middle.getDate();
	var time = middle.getTime();

	//generate refcode
	var user_refcode = name.substring(0, 3).toLowerCase() + middle.randomNumber(2) + middle.randomChar(2);

	//generate qrcode
	var qrcode =  '8008' + phone_number.substring(phone_number.length - 4) + middle.randomNumber(8);

	if(login_method == 'manual') {
		db.query("INSERT INTO user_manual (id, phone_number, email, password, date, time) VALUES ('', '"+phone_number+"', '"+email+"', '"+password+"', '"+date+"', '"+time+"')", function(result) {	
			db.query("INSERT INTO user (id, phone_number, email, email_verified, name, login_method, date, time) VALUES ('', '"+phone_number+"', '"+email+"', "+email_verified+", '"+name+"', '"+login_method+"', '"+date+"', '"+time+"')", function(result) {	
				db.query("INSERT INTO refcode_list (id, user_id, user_refcode, date, time) VALUES ('', "+result.insertId+", '"+user_refcode+"', '"+date+"', '"+time+"')", function(result) {	
					console.log(result);
				});
				db.query("INSERT INTO user_qrcode_membership (id, user_id, qrcode, date, time) VALUES ('', "+result.insertId+", '"+qrcode+"', '"+date+"', '"+time+"')", function(result) {	
					console.log(result);
					res.json(result);
				});
			});
		});
	}
	else {
		db.query("INSERT INTO user (id, phone_number, email, email_verified, name, login_method, date, time) VALUES ('', '"+phone_number+"', '"+email+"', "+email_verified+", '"+name+"', '"+login_method+"', '"+date+"', '"+time+"')", function(result) {	
			res.json(result);
		});
	}
}

exports.userForgetPhone = function(req, res) {
	var phone_number = req.body.phone_number;
	var status_forget = 0;
	var date = middle.getDate();
	var time = middle.getTime();

	db.query("SELECT id FROM user_manual WHERE phone_number = '"+phone_number+"'", function(result) {
		if(result.length) {
			var user_manual_id = result[0].id;

			db.query("SELECT * FROM forget_phone_number WHERE user_manual_id = '"+user_manual_id+"' AND status_forget = 0", function(result) {
				if(result.length >= 3) {
					res.json(403);
				}
				else {
					db.query("INSERT INTO forget_phone_number (id, user_manual_id, status_forget, date, time) VALUES ('', '"+user_manual_id+"', '"+status_forget+"', '"+date+"', '"+time+"')", function(result) {	
						res.json(result);
					});
				}
			});
		}
		else {
			res.json(404);
		}
	});
}

exports.userForgetOtp = function(req, res) {
	var forget_phone_number_id = req.body.forget_phone_number_id;
	var otp_code = req.body.otp_code.substr(req.body.otp_code.length-4);
	var date = middle.getDate();
	var time = middle.getTime();

	console.log(forget_phone_number_id);

	db.query("INSERT INTO otp_forget_password (id, forget_phone_number_id, otp_code, date, time) VALUES ('', "+forget_phone_number_id+", '"+otp_code+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.checkForgetOtp = function(req, res) {
	var id = req.body.id;
	var otp_code = req.body.otp_code;
	var forget_phone_number_id = req.body.forget_phone_number_id;
	var user_manual_id = req.body.user_manual_id;

	db.query("SELECT * FROM otp_forget_password WHERE id = "+id, function(result) {
		if(result[0].otp_code == otp_code) {
			db.query("UPDATE forget_phone_number SET status_forget = 2 WHERE user_manual_id = '"+ user_manual_id+"' AND status_forget = 0", function(result) {	
				db.query("UPDATE forget_phone_number SET status_forget = 1 WHERE id = "+ forget_phone_number_id, function(result) {	
					res.json(200);
				});
			});
		}
		else {
			res.json(403);
		}
	});
}

exports.citcallForgetOtp = function(req, res) {
	db.query("SELECT user_manual_id FROM forget_phone_number WHERE id = "+req.query.id, function(result) {
		db.query("SELECT * FROM user_manual WHERE id = '"+result[0].user_manual_id+"'", function(result) {
			request.post({
				headers: {'Content-Type' : 'application/json', 'Authorization': 'Apikey 5e69e97b699f5c31dcc16c5e63568e3c'},
			  	url: 'http://104.199.196.122/gateway/v3/asynccall',
			  	json: {"msisdn": result[0].phone_number, "gateway":1}
			}, function(error, response, body){
			  console.log(body);
			  res.json({result, body});
			});
		});
	});
}

exports.forgetPasswordUser = function(req, res) {
	var password = req.body.password;
	db.query("SELECT user_manual_id FROM forget_phone_number WHERE id = "+req.body.id, function(result) {
		db.query("UPDATE user_manual SET password = '"+password+"' WHERE id = "+ result[0].user_manual_id, function(result) {	
			res.json(result);
		});
	});	
}

exports.authGoogle = function(req, res) {
	var access_token = req.body.access_token;
	request.get({
		url: 'https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=' + access_token
	}, 	function(error, response, body){
  			body = JSON.parse(body);
  			console.log(body);
  			var google_id = body.id;
  			var full_name = body.name;
  			var given_name = body.given_name;
  			var family_name = body.family_name;
  			var image_url = body.picture;
  			var email = body.email;
  			var date = middle.getDate();
			var time = middle.getTime();
  			db.query("INSERT INTO user_google (id, google_id, full_name, given_name, family_name, image_url, email, date, time) VALUES ('', '"+google_id+"', '"+full_name+"', '"+given_name+"', '"+family_name+"', '"+image_url+"', '"+email+"', '"+date+"', '"+time+"')", function(result) {	
				res.json(result);
			});
		}
	);
}

exports.getUserGoogle = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM user_google WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.setQrcode = function(req, res) {
	var id = 5;

	var length = 8 - id.toString().length;

	var qrcode =  '8008' + '9939' + id + middle.randomNumber(length);
	res.json(qrcode);
}

exports.logout = function(req, res) {
	sess = session;
	res.json(1);
}