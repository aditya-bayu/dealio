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
const { base64encode, base64decode } = require('nodejs-base64');
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

//mobile pulsa production api key - 2175c6e67436dbac217

//ip whitelist backup - 54.210.45.113

//-------mobilepulsa production api-------
// exports.testMobilePulsa = function(req, res) {
// 	var path = "https://api.mobilepulsa.net/v1/legacy/index";
//     var username = "08111804094";
//     var apikey = "2175c6e67436dbac217";
//     var ref_id = "test001";
//     var hp = "32126583320";
//     var signTxt = md5(username+apikey+ref_id);

// 	request.post(path, {
// 		json: {
// 			"commands": "topup",
// 			"username": username,
// 			"ref_id": ref_id,
// 			"hp": hp,
// 			"pulsa_code": "hpln20000",
// 			"sign": signTxt,
// 		}
// 	},
// 	function(error, response, body){
// 			console.log(body);
// 			res.json(body);	
// 	});
// }


//--------mobilepulsa development api-------
exports.testMobilePulsa = function(req, res) {
	var path = "https://testpostpaid.mobilepulsa.net/api/v1/bill/check";
    var username = "08111804094";
    var apikey = "8015c4fcdb04df0e";
    var ref_id = "test005";
    var hp = "08111804094";
    var signTxt = md5(username+apikey+ref_id);

	request.post(path, {
		json: {
			"commands": "inq-pasca",
			"username": username,
			"code": "HPTSEL",
			"ref_id": ref_id,
			"hp": hp,
			"sign": signTxt
		}
	},
	function(error, response, body){
			console.log(body);
			res.json(body);	
	});
}

exports.testXendit = function(req, res) {
	var path = "https://api.xendit.co/callback_virtual_accounts";

	request.post(path, {
		headers: {
			'Authorization': 'Basic eG5kX2RldmVsb3BtZW50X3VSMXAyTlM3c0VieDQwQ0x3MXdGZUplemhaQkFSN0tlV0dBbVdtM2tYWEgwNVlYOWtMWkhpSTk4cXV0eXNlSTo='
		},
		json: {
			"external_id": "dyo_test_1",
		   	"bank_code": "BCA",
		   	"name": "Hanindyo Herbowo",
		   	"expected_amount": 20000
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
			},'ini3rH2LlkfGBX8QvHZ1', {expiresIn: '24h'}, (err, token) => {
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

	if(req.params.refresher) {
		jwt.sign({
			id: result[0].id,
			username: result[0].phone_number,
			role: 'user'
		},'ini3rH2LlkfGBX8QvHZ1', {expiresIn: '24h'}, (err, token) => {
    		res.json(token);
      	});
	}

	else {
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
					},'ini3rH2LlkfGBX8QvHZ1', {expiresIn: '24h'}, (err, token) => {
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
}

exports.loginGuest = function(req, res) {
	jwt.sign({
		role: 'guest'
	},'ini3rH2LlkfGBX8QvHZ1', {expiresIn: '24h'}, (err, token) => {
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

exports.getSurveyParticipant = function(req, res) {
	db.query("SELECT * FROM survey_participant", function(result) {
		res.json(result);
	});
}

exports.addSurveyParticipant = function(req, res) {
    var survey_question_id = req.body.survey_question_id;
    var user_id = req.body.user_id;
    var duration = req.body.duration;
    var status = req.body.status;
    var checkpoint = req.body.checkpoint;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO survey_participant (id, survey_question_id, user_id, duration, status, checkpoint, date, time) VALUES ('', "+survey_question_id+", "+user_id+", "+duration+", '"+status+"', "+checkpoint+", '"+date+"', '"+time+"')", function(result) {	
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

exports.userRegisterPhone = function(req, res) {
	var phone_number = req.body.phone_number;
	var status_regis = 0;
	var date = middle.getDate();
	var time = middle.getTime();

	db.query("SELECT * FROM regis_phone_number WHERE phone_number = '"+phone_number+"' AND status_regis = 1", function(result) {
		if(result.length == 0) {
			res.json({status: 404});
		}
		else {
			db.query("SELECT * FROM regis_phone_number WHERE phone_number = '"+phone_number+"' AND status_regis = 0", function(result) {
				if(result.length >= 3) {
					res.json({status: 403});
				}
				else {
					db.query("INSERT INTO regis_phone_number (id, phone_number, status_regis, date, time) VALUES ('', '"+phone_number+"', '"+status_regis+"', '"+date+"', '"+time+"')", function(result) {
						var regis_id = result.insertId;

						//citcall misscall
						request.post({
							headers: {'Content-Type' : 'application/json', 'Authorization': 'Apikey 5e69e97b699f5c31dcc16c5e63568e3c'},
						  	url: 'http://104.199.196.122/gateway/v3/asynccall',
						  	json: {"msisdn": phone_number, "gateway":1}
						}, function(error, response, body){
							console.log(body);
							db.query("INSERT INTO otp_regis (id, regis_phone_number_id, otp_code, date, time) VALUES ('', '"+regis_id+"', '"+body.token.substr(body.token.length-4)+"', '"+date+"', '"+time+"')", function(result) {
								res.json({
									data: {
										regis_phone_number_id: middle.encryptThis(String(regis_id)),
										phone_number: phone_number,
										token: body.token.substr(0, body.token.length-4),
										otp_id: middle.encryptThis(String(result.insertId))
									}
								});
							});
						});
					});
				}
			});
		}
	});
}

exports.checkRegisterOtp = function(req, res) {
	var otp_id = parseInt(middle.decryptThis(req.body.otp_id));
	var otp_code = req.body.otp_code;
	var regis_phone_number_id = parseInt(middle.decryptThis(req.body.regis_phone_number_id));

	db.query("SELECT * FROM regis_phone_number WHERE id = '"+regis_phone_number_id+"'", function(result) {
		var phone_number = result[0].phone_number;
		db.query("SELECT * FROM otp_regis WHERE id = "+otp_id, function(result) {
			if(result[0].otp_code == otp_code) {
				db.query("UPDATE regis_phone_number SET status_regis = 2 WHERE phone_number = '"+ phone_number+"' AND status_regis = 0", function(result) {	
					db.query("UPDATE regis_phone_number SET status_regis = 1 WHERE id = "+ regis_phone_number_id, function(result) {	
						res.json({status: 200});
					});
				});
			}
			else {
				res.json({status: 403});
			}
		});
	});
}

exports.getOnePhoneRegis = function(req, res) {
	db.query("SELECT *, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM regis_phone_number WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.registerUser = function(req, res) {
	var regis_phone_number_id = parseInt(middle.decryptThis(req.body.regis_phone_number_id));
	var name = req.body.name;
	var email = req.body.email;
	var password = req.body.password;
	var login_method = req.body.login_method;
	var email_verified = 0;
	var active = 1;
	var date = middle.getDate();
	var time = middle.getTime();

	db.query("SELECT * FROM regis_phone_number WHERE id = '"+regis_phone_number_id+"'", function(result) {
		var phone_number = result[0].phone_number;
		//generate refcode
		var user_refcode = name.substring(0, 3).toLowerCase() + middle.randomNumber(2) + middle.randomChar(2);

		//generate qrcode
		var qrcode =  '8008' + phone_number.substring(phone_number.length - 4) + middle.randomNumber(8);

		if(login_method == 'manual') {
			db.query("INSERT INTO user_manual (id, phone_number, email, password, date, time) VALUES ('', '"+phone_number+"', '"+email+"', '"+password+"', '"+date+"', '"+time+"')", function(result) {	
				db.query("INSERT INTO user (id, phone_number, email, email_verified, name, login_method, active, refcode, date, time) VALUES ('', '"+phone_number+"', '"+email+"', "+email_verified+", '"+name+"', '"+login_method+"', "+active+" , '"+user_refcode+"', '"+date+"', '"+time+"')", function(result) {	
					db.query("INSERT INTO membership (id, user_id, tier, date, time) VALUES ('', "+result.insertId+", 'silver', '"+date+"', '"+time+"')", function(result) {	
						console.log(result);
					});
					db.query("INSERT INTO user_detail (id, user_id, date, time) VALUES ('', "+result.insertId+", '"+date+"', '"+time+"')", function(result) {	
						console.log(result);
					});
					db.query("INSERT INTO user_point (id, user_id, point) VALUES ('', "+result.insertId+", 0)", function(result) {	
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
			db.query("INSERT INTO user (id, phone_number, email, email_verified, name, login_method, active, refcode, date, time) VALUES ('', '"+phone_number+"', '"+email+"', "+email_verified+", '"+name+"', '"+login_method+"', "+active+", '"+user_refcode+"', '"+date+"', '"+time+"')", function(result) {	
				db.query("INSERT INTO membership (id, user_id, tier, date, time) VALUES ('', "+result.insertId+", 'silver', '"+date+"', '"+time+"')", function(result) {	
					console.log(result);
				});
				db.query("INSERT INTO user_detail (id, user_id, date, time) VALUES ('', "+result.insertId+", '"+date+"', '"+time+"')", function(result) {	
					console.log(result);
				});
				db.query("INSERT INTO user_point (id, user_id, point) VALUES ('', "+result.insertId+", 0)", function(result) {	
					console.log(result);
				});
				db.query("INSERT INTO user_qrcode_membership (id, user_id, qrcode, date, time) VALUES ('', "+result.insertId+", '"+qrcode+"', '"+date+"', '"+time+"')", function(result) {	
					console.log(result);
					res.json(result);
				});
			});
		}
	});
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

exports.getMembership = function(req, res) {
	db.query("SELECT * FROM membership", function(result) {
		res.json(result);
	});
}

exports.addMembership = function(req, res) {
	var user_id = req.body.user_id;
    var tier = req.body.tier;
    var date = middle.getDate();
    var time = middle.getTime();

	db.query("INSERT INTO membership (id, response, user_id, tier, date, time) VALUES ('', '"+response+"', "+user_id+", '"+tier+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.getStatusMembership = function(req, res) {
	db.query("SELECT * FROM status_membership", function(result) {
		res.json(result);
	});
}

exports.addStatusMembership = function(req, res) {
	var user_id = req.body.user_id;
    var tier_from = req.body.tier_from;
    var date = middle.getDate();
    var time = middle.getTime();

    
    db.query("SELECT * FROM user WHERE id = "+user_id, function(result) {
    	//silver to gold rules
    	if(tier_from == 'silver') {
	    	if(!result[0].ktp_url) {
				db.query("SELECT COUNT (id) FROM refcode_input WHERE user_id = "+user_id, function(result) {
					if(result[0]["COUNT (id)"] >= 10) {
						var changes = 'upgrade';
						var tier_to = 'gold';
						db.query("INSERT INTO status_membership (id, user_id, changes, tier_from, tier_to, date, time) VALUES ('', "+user_id+", '"+changes+"', '"+tier_from+"', '"+tier_to+"', '"+date+"', '"+time+"')", function(result) {	
							res.json(result);
						});
					}
					else {
						res.json("You haven't invited 10 friends");
					}
				});
			}
			else {
				res.json("You haven't upload your KTP");
			}
		}
	});
}

exports.verifyEmail = function(req, res) {
	var user_id = parseInt(base64decode(req.query.id));
	var dateSend = base64decode(req.query.exp);
	var dateArr = dateSend.split('-');
	dateSend = new Date(dateArr[0], dateArr[1], dateArr[2]);

	var currentdate = new Date();
	var day = currentdate.getDate();
	var month = currentdate.getMonth();
	var year = currentdate.getFullYear();

    var dateReceive = new Date(year, month, day);

    if(Math.round((dateReceive-dateSend)/(1000*60*60)) <= 72) {
    	db.query("UPDATE user SET email_verified = 1 WHERE id =" + user_id, function(result) {	
			res.json(result);
		});
    }

    else {
    	res.json(403); //link expired
    }
}

exports.logout = function(req, res) {
	sess = session;
	res.json(1);
}