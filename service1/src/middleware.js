const jwt = require('jsonwebtoken');
const crypto = require('crypto');

function getFirstPath(path) {
	return '/' + path.split('/')[1].split('/')[0];
}

exports.getDate = function() {
	let currentdate = new Date();
	let day = currentdate.getDate();
	let month = currentdate.getMonth()+1;
	let year = currentdate.getFullYear();

    let dateformat = year + '-' + month + '-' + day;
	return dateformat;
}

exports.getTime = function() {
	let currentdate = new Date();
	let second = currentdate.getSeconds();
    let minute = currentdate.getMinutes();
    let hour = currentdate.getHours();

    let timeformat = hour + ':' + minute + ':' + second;
	return timeformat;
}

exports.randomChar = function(length) {
   var result           = '';
   var characters       = 'abcdefghijklmnopqrstuvwxyz';
   var charactersLength = characters.length;
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   return result;
}

exports.randomNumber = function(length) {
   var result           = '';
   var characters       = '0123456789';
   var charactersLength = characters.length;
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   return result;
}

exports.encryptThis = function(str) {
	var mykey = crypto.createCipher('aes-128-cbc', 'UKJlA3fmeg');
	var mystr = mykey.update(str, 'utf8', 'hex');
	mystr += mykey.final('hex');

	return mystr;
}

exports.decryptThis = function(str) {
	var mykey = crypto.createDecipher('aes-128-cbc', 'UKJlA3fmeg');
	var mystr = mykey.update(str, 'hex', 'utf8');
	mystr += mykey.final('utf8');

	return mystr;
}

function logger(req, res, next) {
	console.log(req.headers.user_session)
	let path = req.path;
	let user_id = parseInt(req.headers.user_session);
	let detail = getDetail(req, res, path);

	let dateObj = getDate();
	let fulldate = dateObj.date + " " + dateObj.month + " " + dateObj.year + " @ " + dateObj.hour + ":" + dateObj.minute + ":" + dateObj.second;
}

exports.beforeEndPoint = function(req, res, next) { //JWT verification goes here
	// if( req.path.split('-')[0] != '/get' &&
	// 	req.path.split('-')[0] != '/register' &&
	// 	req.path.split('-')[0] != '/test' &&
	// 	req.path.split('-')[0] != '/login' &&
	// 	req.path != '/logout') {
	// 	const bearerHeader = req.headers['authorization'];
	// 	if(typeof bearerHeader !== 'undefined') {
	// 		const bearer = bearerHeader.split(' ');
	// 		const bearerToken = bearer[1];

	// 		req.token = bearerToken;
	// 		jwt.verify(req.token, 'ini3rH2LlkfGBX8QvHZ1', (err, authData) => {
	// 			if(err) {
	// 				res.sendStatus(403);
	// 			}
	// 			else {
	// 				// logger(req, res, next);
	// 				next();
	// 			}
	// 		});
	// 	}
	// 	else {
	// 		res.sendStatus(403);
	// 	}
	// }
	// else {
	// 	next();
	// }
	next();
}