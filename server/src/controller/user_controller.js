
const User = require('../model/user_mode')
const Qr =require('../model/save_qr_code')
const Attendace = require('../model/attendance')
const loginController = async (req, res, next) => {
    const { email, password } = req.body;
  
    try {
      const user = await User.findOne({ email });
  
  
  

  
      if (!user) {
        return res.status(500).json({ success: false, error: 'Not found' })
      }
  
  
  
      return res.status(200).json({
        success: true,
data:user
      })
  
  
  
  
  
  
    } catch (error) {
      return res.status(500).json({ success: false, error: error })
    }
}


const register =async(req,res)=>{
    try {
      

        const u = await User.findOne({ email:req.body.email });

        if(u){
            return res.status(200).json({ success: true, data:"already registered" })    
        }
    const data = await User({
        email: req.body.email,
        password: req.body.password,
     
  
      })
  
    var dd =  await data.save()
      return res.status(200).json({ success: true, data: dd })
    } catch (error) {
        return res.status(500).json({ success: false, error: error }) 
    }
}



const saveQr =async(req,res)=>{
    try {
      

        const u = await User.findOne({ name:req.body.url });

        if(u){
            return res.status(200).json({ success: true, data:"already registered" })    
        }
    const data = await Qr({
        name: req.body.name,
        url: req.body.url,
     
  
      })
  
    var dd =  await data.save()
      return res.status(200).json({ success: true, data: dd })
    } catch (error) {
        return res.status(500).json({ success: false, error: error }) 
    }
}


const getAllQr=async(req,res)=>{
    try {
        
        const data = await Qr.find();

        if(!data){
            return res.status(200).json({ success: true, data:[] })    
        }
        return res.status(200).json({ success: true, data:data })    
    } catch (error) {
        return res.status(500).json({ success: false, error: error }) 
    }
}

const saveAttendance=async(req,res)=>{
    try {
        
   const      {url ,userId,Date} =req.body;
   
        const qrData = await Qr.findOne({url:url});
console.log(qrData)
        if(!qrData){
            return res.status(400).json({ success: false, data:'not valid qr modelId'})    
        }

    
        const checkUserId = await User.findOne({_id:userId});
        

        if(!checkUserId){
            return res.status(200).json({ success: true, data:'not valid user'})    
        }

        var Atten =await Attendace({
            user:userId,
            qrDetails:qrData._id,
            // date:new Date().toISOString()
            Date:Date

        })

   var saved = await     Atten.save();


        return res.status(200).json({ success: true, data:'saved'})    
    } catch (error) {
        return res.status(500).json({ success: false, error: error }) 
    }
}



const getAllAttendance =async(req,res)=>{
   try {
   const data = await Attendace.find().populate('user').populate('qrDetails')

    // const data =await Attendace.aggregate([{$match:{user:'6532dea2d5a3ea5251722f91'}},{$project:{$dayOfMonth:"$Date"}}])

    if(!data){
        return res.json({data:[]})
    }


    var finalData=[]
    // if(data){
        for (var item in data) {
            var map ={
                "name":  data[item].user.email,
                "Qrurl":data[item].qrDetails.url
            };
            finalData.push(map)

          }
        //   console.log(data[item].user)
    return res.status(200).json({ success: true, data:finalData})    
   } catch (error) {
    return res.status(500).json({ success: false, error: error }) 
   }
}


//find with date

const getattendanceWithDate =async(req,res)=>{
    try {
     const data = await Attendace.find({createdAt:"2023-10-20T21:04:14.213Z"})
 
     if(!data){
         return res.json({data:[]})
     }
 
     return res.status(200).json({ success: true, data:data})    
    } catch (error) {
     return res.status(500).json({ success: false, error: error }) 
    }
 }




module.exports={
    loginController,
    register,
    saveQr,
    getAllQr,
    saveAttendance,
    getAllAttendance,
    getattendanceWithDate
}