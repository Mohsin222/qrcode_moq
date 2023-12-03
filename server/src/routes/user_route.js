const router = require("express").Router();


const{
    loginController,
register,
saveQr,
getAllQr,
saveAttendance,
getAllAttendance,
getattendanceWithDate
    
} = require('../controller/user_controller')


router.post("/login",loginController);
router.post("/register",register);
router.post("/saveQr",saveQr);
router.get("/getAllQr",getAllQr);
router.post("/saveAttendance",saveAttendance);
router.get("/getAllAttendance",getAllAttendance);
router.get("/getattendanceWithDate",getattendanceWithDate);

module.exports =router