import 'package:flutter/material.dart';
import 'package:change4charity/home-screen.dart';
import 'dart:async';
import 'dart:io';
import 'globals.dart' as globals;
import 'history.dart';
import 'package:path_provider/path_provider.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }


  _buildChild(BuildContext context) => Container(
    height: 250.0,
    decoration: BoxDecoration(
      color: Colors.redAccent,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
          ),
        ),
        //SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 25.0,10.0, 10.0),
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Choose the Habit:',
              hintText: 'wicht Habit',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,7.0, 10.0,25.0),
          child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount:?',
                hintText: 'How much €?',

              ),
              onChanged: (String tex){
               // amount = double.parse(tex);
                writeData(History());
              }

          ),
        ),
        Row(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
                },
                child: Text('cancel', style: TextStyle(fontSize: 20.0)),
                textColor: Colors.white),
            SizedBox(width: 15.0),

            RaisedButton(
                onPressed: () {
                  // writeData('$amount');
                  // globals.betrag = readData() as double;
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => States()),);
                  writeData(c);
                  print(readData());
                },
                child: Text('Ok', style: TextStyle(fontSize: 20.0)),
                color: Colors.white,
                textColor: Colors.redAccent),

          ],
        ),

      ],
    ),
  );
}

History c = new History(date: '20.10.2020', amount: 2.0);




Future<String> get localPath async{
  final path = await getApplicationDocumentsDirectory();
  return path.path;
}

Future<File> get localFile  async{
  final file = await localPath;
  return new File('$file/data.txt');
}


Future<File>   writeData(History value)  async{
  final file = await localFile;
  return file.writeAsString('$value');
}

Future<String> readData() async{
  try{
    final file = await localFile;
    String data = await file.readAsString();
    return data;
  }catch(e){
    return "error";
  }
}