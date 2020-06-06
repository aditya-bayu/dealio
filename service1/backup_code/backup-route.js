router.route('/add-merchant').post(function(req, res) {rf.addMerchant(req, res)});

router.route('/edit-merchant').post(function(req, res) {rf.editMerchant(req, res)});

router.route('/add-deals').post(function(req, res) {rf.addDeals(req, res)});

router.route('/edit-deals').post(function(req, res) {rf.editDeals(req, res)});

router.route('/add-earn').post(function(req, res) {rf.addEarn(req, res)});

router.route('/edit-earn').post(function(req, res) {rf.editEarn(req, res)});

router.route('/add-win').post(function(req, res) {rf.addWin(req, res)});

router.route('/edit-win').post(function(req, res) {rf.editWin(req, res)});

router.route('/add-product-deals').post(function(req, res) {rf.addProductDeals(req, res)});

router.route('/edit-product-deals').post(function(req, res) {rf.editProductDeals(req, res)});

router.route('/add-audience').post(function(req, res) {rf.addAudience(req, res)});

router.route('/edit-audience').post(function(req, res) {rf.editAudience(req, res)});

router.route('/add-category').post(function(req, res) {rf.addCategory(req, res)});

router.route('/edit-category').post(function(req, res) {rf.editCategory(req, res)});

router.route('/add-news').post(function(req, res) {rf.addNews(req, res)});

router.route('/edit-news').post(function(req, res) {rf.editNews(req, res)});

router.route('/add-watch').post(function(req, res) {rf.addWatch(req, res)});

router.route('/edit-watch').post(function(req, res) {rf.editWatch(req, res)});

router.route('/add-event').post(function(req, res) {rf.addEvent(req, res)});

router.route('/edit-event').post(function(req, res) {rf.editEvent(req, res)});

router.route('/add-horoscope').post(function(req, res) {rf.addHoroscope(req, res)});

router.route('/edit-horoscope').post(function(req, res) {rf.editHoroscope(req, res)});

router.route('/add-voucher').post(function(req, res) {rf.addVoucher(req, res)});

router.route('/edit-voucher').post(function(req, res) {rf.editVoucher(req, res)});

router.route('/post-image').post(upload.single('image'), function(req, res) {rf.postImage(req, res)});

router.route('/post-banner').post(upload.single('banner'), function(req, res) {rf.postBanner(req, res)});

router.route('/post-merchant-image').post(upload.single('merchant'), function(req, res) {rf.postMerchantImage(req, res)});