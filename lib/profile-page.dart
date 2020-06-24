import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
createAlertDialog(BuildContext context){
  TextEditingController myController = TextEditingController();
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('What is your bad habit ?'),
      content: TextField(
        controller: myController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('submit'),
          onPressed: (){

          },
        ),
      ],
    );
  }
  );
}


class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  String _name;
  var kLabelStyle;
  var kHintTextStyle;

  var kBoxDecorationStyle;
  Widget _buildNameTF(){
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.red,
          ),
          hintText: "Enter your name",
          hintStyle: kHintTextStyle,

        ),
      ),
    );
  }

  Widget _buildHabitTF(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        //padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        //shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(10.0)
        //),
        //color: Colors.amber,
        //textColor: Colors.black,
        onPressed: (){
          createAlertDialog(context);
        },
        child: Text('+', style: TextStyle(fontSize: 30.0
        ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {


    return Center(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("./assets/Images/profile.png"),
                  radius: 60,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            Text(
              "Name",
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox( height: 10.0),
            _buildNameTF(),
            Text(
              " Your bad habit",
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            _buildHabitTF(),
          ],
        ),
      ),

    );

  }
}

