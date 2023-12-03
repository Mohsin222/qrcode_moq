import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qrcode/home_screen.dart';
import 'package:qrcode/model/user_model.dart';
import 'package:qrcode/qr_code.dart';
import 'package:qrcode/service/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
      final _formKey = GlobalKey<FormState>();



      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCrud();
  }


  setCrud(){
    emailController.text ='mohsin@gamil.com';
    passwordController.text='123';
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(title: Text('LOGIN'),),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                         SizedBox(height: 20,),
                TextFormField(
                controller: emailController,
                 decoration: InputDecoration(hintText: 'email'),
          
           validator: (value) {
          
                                    if (value!.isEmpty) {
          
                                      return "Email cannot be empty";
          
                                    } 
                                    
          
                                    return null;
          
                                  },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                 decoration: InputDecoration(hintText: 'password'),
          
           validator: (value) {
          
                                    if (value!.isEmpty) {
          
                                      return "password cannot be empty";
          
                                    } 
                                    
          
                                    return null;
          
                                  },
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: ()async{

        UserModel userModel=       await Auth.signIn(context: context, email: emailController.text.trim(), password: passwordController.text.trim());
         
         
         // ignore: use_build_context_synchronously
         Navigator.push(context,MaterialPageRoute(builder: (context){
          return HomeScreen(userModel:userModel);
         }));
              }, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}