const express = require('express');
const app = express();
const rf = require('./src/route-function');
const db = require('./src/db-connect.js');
const multer = require('multer');
const request = require('request');

const router = express.Router();

router.route('/').get(function(req, res) {rf.index(req, res)});

router.route('/test-mobile-pulsa').get(function(req, res) {rf.testMobilePulsa(req, res)});

router.route('/test-xendit').get(function(req, res) {rf.testXendit(req, res)});

router.route('/register-admin').post(function(req, res) {rf.registerAdmin(req, res)});

router.route('/login-admin').post(function(req, res) {rf.loginAdmin(req, res)});

router.route('/login-user').post(function(req, res) {rf.loginUser(req, res)});

router.route('/login-guest').post(function(req, res) {rf.loginGuest(req, res)});

router.route('/get-one-merchant').get(function(req, res) {rf.getOneMerchant(req, res)});

router.route('/get-merchant').get(function(req, res) {rf.getMerchant(req, res)});

router.route('/get-one-deals').get(function(req, res) {rf.getOneDeals(req, res)});

router.route('/get-deals').get(function(req, res) {rf.getDeals(req, res)});

router.route('/get-one-earn').get(function(req, res) {rf.getOneEarn(req, res)});

router.route('/get-earn').get(function(req, res) {rf.getEarn(req, res)});

router.route('/get-one-win').get(function(req, res) {rf.getOneWin(req, res)});

router.route('/get-win').get(function(req, res) {rf.getWin(req, res)});

router.route('/get-one-product-deals').get(function(req, res) {rf.getOneProductDeals(req, res)});

router.route('/get-product-deals').get(function(req, res) {rf.getProductDeals(req, res)});

router.route('/get-one-audience').get(function(req, res) {rf.getOneAudience(req, res)});

router.route('/get-audience').get(function(req, res) {rf.getAudience(req, res)});

router.route('/get-one-category').get(function(req, res) {rf.getOneCategory(req, res)});

router.route('/get-category').get(function(req, res) {rf.getCategory(req, res)});

router.route('/get-lottery').get(function(req, res) {rf.getLottery(req, res)});

router.route('/add-lottery').post(function(req, res) {rf.addLottery(req, res)});

router.route('/shuffle-lottery').get(function(req, res) {rf.shuffleLottery(req, res)});

router.route('/get-one-news').get(function(req, res) {rf.getOneNews(req, res)});

router.route('/get-news').get(function(req, res) {rf.getNews(req, res)});

router.route('/get-one-watch').get(function(req, res) {rf.getOneWatch(req, res)});

router.route('/get-watch').get(function(req, res) {rf.getWatch(req, res)});

router.route('/get-one-event').get(function(req, res) {rf.getOneEvent(req, res)});

router.route('/get-event').get(function(req, res) {rf.getEvent(req, res)});

router.route('/get-one-horoscope').get(function(req, res) {rf.getOneHoroscope(req, res)});

router.route('/get-horoscope').get(function(req, res) {rf.getHoroscope(req, res)});

router.route('/get-one-voucher').get(function(req, res) {rf.getOneVoucher(req, res)});

router.route('/get-voucher').get(function(req, res) {rf.getVoucher(req, res)});

router.route('/get-one-survey').get(function(req, res) {rf.getOneSurvey(req, res)});

router.route('/get-survey').get(function(req, res) {rf.getSurvey(req, res)});

router.route('/add-survey').post(function(req, res) {rf.addSurvey(req, res)});

router.route('/edit-survey').post(function(req, res) {rf.editSurvey(req, res)});

router.route('/get-survey-question').get(function(req, res) {rf.getSurveyQuestion(req, res)});

router.route('/add-survey-question').post(function(req, res) {rf.addSurveyQuestion(req, res)});

router.route('/get-survey-question-choice').get(function(req, res) {rf.getSurveyQuestionChoice(req, res)});

router.route('/add-survey-question-choice').post(function(req, res) {rf.addSurveyQuestionChoice(req, res)});

router.route('/get-survey-participant').get(function(req, res) {rf.getSurveyParticipant(req, res)});

router.route('/add-survey-participant').post(function(req, res) {rf.addSurveyParticipant(req, res)});

router.route('/get-survey-response').get(function(req, res) {rf.getSurveyResponse(req, res)});

router.route('/add-survey-response').post(function(req, res) {rf.addSurveyResponse(req, res)});

router.route('/user-register-phone').post(function(req, res) {rf.userRegisterPhone(req, res)});

router.route('/check-register-otp').post(function(req, res) {rf.checkRegisterOtp(req, res)});

router.route('/citcall-otp').get(function(req, res) {rf.citcallOtp(req, res)});

router.route('/get-one-phone-regis').get(function(req, res) {rf.getOnePhoneRegis(req, res)});

router.route('/register-user').post(function(req, res) {rf.registerUser(req, res)});

router.route('/user-forget-phone').post(function(req, res) {rf.userForgetPhone(req, res)});

router.route('/user-forget-otp').post(function(req, res) {rf.userForgetOtp(req, res)});

router.route('/check-forget-otp').post(function(req, res) {rf.checkForgetOtp(req, res)});

router.route('/citcall-forget-otp').get(function(req, res) {rf.citcallForgetOtp(req, res)});

router.route('/forget-password-user').post(function(req, res) {rf.forgetPasswordUser(req, res)})

router.route('/auth/google').post(function(req, res) {rf.authGoogle(req, res)});

router.route('/get-user-google').get(function(req, res) {rf.getUserGoogle(req, res)});

router.route('/get-membership').get(function(req, res) {rf.getMembership(req, res)});

router.route('/add-membership').get(function(req, res) {rf.addMembership(req, res)});

router.route('/get-status-membership').get(function(req, res) {rf.getStatusMembership(req, res)});

router.route('/add-status-membership').post(function(req, res) {rf.addStatusMembership(req, res)});

router.route('/verify-email').get(function(req, res) {rf.verifyEmail(req, res)});

router.route('/logout').get(function(req, res) {rf.logout(req, res)});

module.exports = router;