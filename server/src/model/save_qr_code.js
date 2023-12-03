const mongoose = require("mongoose");


const QrModel = new mongoose.Schema({
        //patient
        name: {
            type: String,
            required:true,
            unique:true
          },
    
          url: {
            type: String,
            required:true,
            unique:true
          },
        
},
{ timestamps: true }
);
module.exports = mongoose.model("QrModel", QrModel);
