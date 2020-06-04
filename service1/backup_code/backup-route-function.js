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