var express = require('express');
var expressJwt = require('express-jwt');
var router = express.Router();
var db = require('../db');
router.post('/login', function(req, res){
    email = req.body.email;
    password = req.body.password;
    console.log(email)
    console.log(password)
    con.query("select * from contact where email = ?", [email], function (err, result) {
        if(result.length>0){
            if(result[0].password == password){
                res.status(200).json(result);
            }else{
                res.status(200).json('pwd wrong');
            }
        } else {
            res.status(200).json('user not found');
        }
    }) 
});
module.exports = router;