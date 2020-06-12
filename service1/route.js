const express = require('express');
const app = express();
const rf = require('./src/route-function');
const db = require('./src/db-connect.js');
const multer = require('multer');
const request = require('request');

const router = express.Router();

const basepath = '/api/camden/v1';

router.route(basepath + '/').get(function(req, res) {rf.index(req, res)});

router.route(basepath + '/test-mobile-pulsa').get(function(req, res) {rf.testMobilePulsa(req, res)});

router.route(basepath + '/test-ultra-voucher').get(function(req, res) {rf.testUltraVoucher(req, res)});

router.route(basepath + '/get-snap-token').get(function(req, res) {rf.getSnapToken(req, res)});

router.route(basepath + '/register-admin').post(function(req, res) {rf.registerAdmin(req, res)});

router.route(basepath + '/login-admin').post(function(req, res) {rf.loginAdmin(req, res)});

router.route(basepath + '/login-user').post(function(req, res) {rf.loginUser(req, res)});

router.route(basepath + '/login-guest').post(function(req, res) {rf.loginGuest(req, res)});

router.route(basepath + '/get-one-merchant').get(function(req, res) {rf.getOneMerchant(req, res)});

router.route(basepath + '/get-merchant').get(function(req, res) {rf.getMerchant(req, res)});

router.route(basepath + '/get-one-deals').get(function(req, res) {rf.getOneDeals(req, res)});

router.route(basepath + '/get-deals').get(function(req, res) {rf.getDeals(req, res)});

router.route(basepath + '/get-one-earn').get(function(req, res) {rf.getOneEarn(req, res)});

router.route(basepath + '/get-earn').get(function(req, res) {rf.getEarn(req, res)});

router.route(basepath + '/get-one-win').get(function(req, res) {rf.getOneWin(req, res)});

router.route(basepath + '/get-win').get(function(req, res) {rf.getWin(req, res)});

router.route(basepath + '/get-one-product-deals').get(function(req, res) {rf.getOneProductDeals(req, res)});

router.route(basepath + '/get-product-deals').get(function(req, res) {rf.getProductDeals(req, res)});

router.route(basepath + '/get-one-audience').get(function(req, res) {rf.getOneAudience(req, res)});

router.route(basepath + '/get-audience').get(function(req, res) {rf.getAudience(req, res)});

router.route(basepath + '/get-one-category').get(function(req, res) {rf.getOneCategory(req, res)});

router.route(basepath + '/get-category').get(function(req, res) {rf.getCategory(req, res)});

router.route(basepath + '/get-lottery').get(function(req, res) {rf.getLottery(req, res)});

router.route(basepath + '/add-lottery').post(function(req, res) {rf.addLottery(req, res)});

router.route(basepath + '/shuffle-lottery').get(function(req, res) {rf.shuffleLottery(req, res)});

router.route(basepath + '/get-one-news').get(function(req, res) {rf.getOneNews(req, res)});

router.route(basepath + '/get-news').get(function(req, res) {rf.getNews(req, res)});

router.route(basepath + '/get-one-watch').get(function(req, res) {rf.getOneWatch(req, res)});

router.route(basepath + '/get-watch').get(function(req, res) {rf.getWatch(req, res)});

router.route(basepath + '/get-one-event').get(function(req, res) {rf.getOneEvent(req, res)});

router.route(basepath + '/get-event').get(function(req, res) {rf.getEvent(req, res)});

router.route(basepath + '/get-one-horoscope').get(function(req, res) {rf.getOneHoroscope(req, res)});

router.route(basepath + '/get-horoscope').get(function(req, res) {rf.getHoroscope(req, res)});

router.route(basepath + '/get-one-voucher').get(function(req, res) {rf.getOneVoucher(req, res)});

router.route(basepath + '/get-voucher').get(function(req, res) {rf.getVoucher(req, res)});

router.route(basepath + '/get-one-survey').get(function(req, res) {rf.getOneSurvey(req, res)});

router.route(basepath + '/get-survey').get(function(req, res) {rf.getSurvey(req, res)});

router.route(basepath + '/add-survey').post(function(req, res) {rf.addSurvey(req, res)});

router.route(basepath + '/edit-survey').post(function(req, res) {rf.editSurvey(req, res)});

router.route(basepath + '/get-survey-question').get(function(req, res) {rf.getSurveyQuestion(req, res)});

router.route(basepath + '/add-survey-question').post(function(req, res) {rf.addSurveyQuestion(req, res)});

router.route(basepath + '/get-survey-question-choice').get(function(req, res) {rf.getSurveyQuestionChoice(req, res)});

router.route(basepath + '/add-survey-question-choice').post(function(req, res) {rf.addSurveyQuestionChoice(req, res)});

router.route(basepath + '/get-survey-participant').get(function(req, res) {rf.getSurveyParticipant(req, res)});

router.route(basepath + '/add-survey-participant').post(function(req, res) {rf.addSurveyParticipant(req, res)});

router.route(basepath + '/get-survey-response').get(function(req, res) {rf.getSurveyResponse(req, res)});

router.route(basepath + '/add-survey-response').post(function(req, res) {rf.addSurveyResponse(req, res)});

router.route(basepath + '/user-register-phone').post(function(req, res) {rf.userRegisterPhone(req, res)});

router.route(basepath + '/check-register-otp').post(function(req, res) {rf.checkRegisterOtp(req, res)});

router.route(basepath + '/get-one-phone-regis').get(function(req, res) {rf.getOnePhoneRegis(req, res)});

router.route(basepath + '/register-user').post(function(req, res) {rf.registerUser(req, res)});

router.route(basepath + '/user-forget-phone').post(function(req, res) {rf.userForgetPhone(req, res)});

router.route(basepath + '/user-forget-otp').post(function(req, res) {rf.userForgetOtp(req, res)});

router.route(basepath + '/check-forget-otp').post(function(req, res) {rf.checkForgetOtp(req, res)});

router.route(basepath + '/citcall-forget-otp').get(function(req, res) {rf.citcallForgetOtp(req, res)});

router.route(basepath + '/forget-password-user').post(function(req, res) {rf.forgetPasswordUser(req, res)})

router.route(basepath + '/auth/google').post(function(req, res) {rf.authGoogle(req, res)});

router.route(basepath + '/get-user-google').get(function(req, res) {rf.getUserGoogle(req, res)});

router.route(basepath + '/auth/facebook').post(function(req, res) {rf.authFacebook(req, res)});

router.route(basepath + '/get-user-facebook').get(function(req, res) {rf.getUserFacebook(req, res)});

router.route(basepath + '/get-membership').get(function(req, res) {rf.getMembership(req, res)});

router.route(basepath + '/add-membership').get(function(req, res) {rf.addMembership(req, res)});

router.route(basepath + '/get-status-membership').get(function(req, res) {rf.getStatusMembership(req, res)});

router.route(basepath + '/add-status-membership').post(function(req, res) {rf.addStatusMembership(req, res)});

router.route(basepath + '/verify-email').get(function(req, res) {rf.verifyEmail(req, res)});

router.route(basepath + '/logout').get(function(req, res) {rf.logout(req, res)});

module.exports = router;