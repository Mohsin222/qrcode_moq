const mongoose = require("mongoose");


const AttendanceSchema = new mongoose.Schema({
        //patient
    user:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    },
    qrDetails:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "QrModel",
    },
    Date:{
        type:Date,
        // default: new Date
    }
    
        
},
// { timestamps: true }
);
module.exports = mongoose.model("Attendace", AttendanceSchema);
