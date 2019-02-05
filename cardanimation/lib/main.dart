import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Upcoming(),
      debugShowCheckedModeBanner: false,
    ));

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    final uniWidth = MediaQuery.of(context).size.width;
    final uniHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: uniHeight / 10, left: uniWidth / 10),
                  child: Text(
                    'upcoming',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: uniWidth / 22,
                      fontFamily: 'Poppins'
                    ),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: uniHeight / 10, left: uniWidth / 10),
                  child: Text(
                    'artifacts',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: uniWidth / 22,
                        fontFamily: 'Poppins'
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: uniHeight/10)),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
