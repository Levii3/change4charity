import 'package:change4charity/dialog-helper.dart';
import 'package:change4charity/history.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class States extends StatefulWidget {
  @override
  _States createState() => _States();
}

class _States extends State<States> {
  //ich habe es wieder getan Function:
  double text = globals.betrag;

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog();
        });
  }

  List<History> historys = [
    History(date: '29.05.2020', amount: 12.54),
    History(date: '22.05.2020', amount: 2.40),
    History(date: '14.05.2020', amount: 0.54),
    History(date: '02.05.2020', amount: 2.40)
  ];

  /*
  void _onItemTapped(int index) {
    if (index == 2) {
      setState(() {
        betrag += 0.50;
      });
    }
  }
   */

  Widget historyTemplate(history) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Text(
              history.date,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 150.0),
            Text(
              history.date,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 7.0),
                color: Colors.grey[300],
                child: Text(
                  'Current amount',
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                height: 60.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 1.0, 8.0),
                      child: Text(
                        '$text',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    Icon(Icons.euro_symbol, color: Colors.grey[400]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(175.0, 5.0, 10.0, 8.0),
                      child: SizedBox(
                        width: 120.0,
                        height: 50.0,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.amber,
                          child: Text(
                            'Donate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue[900],
                              fontSize: 20.0,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 7.0),
                color: Colors.grey[300],
                child: Text(
                  'History',
                ),
              ),
              Column(
                children:
                historys.map((history) => historyTemplate(history)).toList(),
              ),
            ],
          ),
          /* onWillPop: () async {
    return await DialogHelper.exit(context);
    },*/
        ));
  }
}
