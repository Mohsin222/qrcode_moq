import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qrcode/download_data.dart';
import 'package:qrcode/model/user_model.dart';
import 'package:qrcode/qr_code.dart';

class HomeScreen extends StatelessWidget {
   final UserModel userModel;
  const HomeScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){

                  Navigator.push(context,MaterialPageRoute(builder: (context){
          return QRViewExample(userModel:userModel);
         }));
            }, child: Text('QR CODE SCREEN')),


            SizedBox(height: 59,),
                  ElevatedButton(onPressed: (){

                  Navigator.push(context,MaterialPageRoute(builder: (context){
          return DownloadData();
         }));
            }, child: Text('File download Screen'))
          ],
        ),
      ),
    );
  }
}