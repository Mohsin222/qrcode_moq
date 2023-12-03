import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrcode/service/auth.dart';

// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
class DownloadData extends StatefulWidget {
  const DownloadData({super.key});

  @override
  State<DownloadData> createState() => _DownloadDataState();
}

class _DownloadDataState extends State<DownloadData> {
 
 
 var json =[];
 getAttendanceData()async{
 json =await Auth.getAttendance(context: context);
 }
 
 
 
 
 List data =[
    {
        "title": "How to Add .env File in Flutter?",
        "link": "https://www.geeksforgeeks.org/how-to-add-env-file-in-flutter/"
    },
    {
        "title": "Flutter - Select Single and Multiple Files From Device",
        "link": "https://www.geeksforgeeks.org/flutter-select-single-and-multiple-files-from-device/"
    },
    {
        "title": "Autofill Hints Suggestion List in Flutter",
        "link": "https://www.geeksforgeeks.org/autofill-hints-suggestion-list-in-flutter/"
    },
    {
        "title": "How to Integrate Razorpay Payment Gateway in Flutter?",
        "link": "https://www.geeksforgeeks.org/how-to-integrate-razorpay-payment-gateway-in-flutter/"
    },
    {
        "title": "How to Setup Multiple Flutter Versions on Mac?",
        "link": "https://www.geeksforgeeks.org/how-to-setup-multiple-flutter-versions-on-mac/"
    },
    {
        "title": "How to Change Package Name in Flutter?",
        "link": "https://www.geeksforgeeks.org/how-to-change-package-name-in-flutter/"
    },
    {
        "title": "Flutter - How to Change App and Launcher Title in Different Platforms",
        "link": "https://www.geeksforgeeks.org/flutter-how-to-change-app-and-launcher-title-in-different-platforms/"
    },
    {
        "title": "Custom Label Text in TextFormField in Flutter",
        "link": "https://www.geeksforgeeks.org/custom-label-text-in-textformfield-in-flutter/"
    }
   
];
  


//this function is working
  Future<void> convertAndDownloadCSV(List<dynamic> jsonData) async {
  // Convert JSON to CSV
  List<List<dynamic>> csvData =[];
  // = List<List<dynamic>>;
  csvData.add(jsonData[0].keys.toList()); // Adding headers
  for (var item in jsonData) {
    csvData.add(item.values.toList());
  }

  // Generate a unique file name
  // String fileName = 'data_${DateTime.now().toLocal()}.csv';
    String fileName = 'mohsin${DateTime.now()}.csv';


  // Get the document directory for storing the CSV file
  final directory = await getExternalStorageDirectory();
  final filePath = '${directory!.path}/$fileName';

  // Write CSV data to the file
  String csv = ListToCsvConverter().convert(csvData);
  File file = File(filePath);
  await file.writeAsString(csv);

 var snackdemo = SnackBar(
            content: Text('mohsin${DateTime.now()}.csv'),
            backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );

            ScaffoldMessenger.of(context).showSnackBar(snackdemo);
}



//this is dummy
  generateCsv() async {
    List<List<String>> data = [
      ["No.", "Name", "Roll No."],
      ["1", "aaaaaaaaa", "randomNumeric(3)"],
      ["2","333", "randomNumeric(3)"],
      ["3", "233", "112"]
    ];
    String csvData = ListToCsvConverter().convert(data);
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-${DateTime.now()}.csv";
    print(path);
    final File file = File(path);
    await file.writeAsString(csvData);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return LoadCsvDataScreen(path: path);
    //     },
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: 
          FloatingActionButtonLocation.miniCenterFloat, 
      floatingActionButton: FloatingActionButton.extended( 
        onPressed: ()async {
   await getAttendanceData();
  print(json);
        }, 
        label: const Text("load Excel sheet"), 
      ), 
      body: Center(     child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            //     MaterialButton(
            //   onPressed: () {
            //     generateCsv();
            //   },
            //   color: Colors.cyanAccent,
            //   child: Text("Load csv form phone storage"),
            // ),
              ElevatedButton(
                onPressed: () {
                  // Replace this with your JSON data.
                  List<dynamic> jsonData = [
                    {"name": "John", "age": 30, "city": "New York"},
                    {"name": "Alice", "age": 25, "city": "San Francisco"},
                    // Add more JSON data here
                  ];

                  // Call the function to convert and download.
                if(json !=[]){
                    convertAndDownloadCSV(json);
                }
                },
                child: Text('Convert and Download CSV'),
              ),
            ],
          ),
        ),
      
    );
  }
}