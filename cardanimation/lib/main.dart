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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black54),
              title: Text('home',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: uniWidth / 28,
                      fontFamily: 'Poppins'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black54),
              title: Text('search',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: uniWidth / 28,
                      fontFamily: 'Poppins'))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black54,
              ),
              title: Text('wish',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: uniWidth / 28,
                      fontFamily: 'Poppins'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.black54),
              title: Text(
                'profile',
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: uniWidth / 28,
                    fontFamily: 'Poppins'),
              )),
        ],
        currentIndex: 0,
        fixedColor: Colors.black45,
      ),
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
                      EdgeInsets.only(top: uniHeight / 15, left: uniWidth / 10),
                  child: Text(
                    'upcoming',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: uniWidth / 12,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: uniWidth / 10),
                  child: Text(
                    'artifacts',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: uniWidth / 12,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: uniHeight / 20)),
                Container(
                  height: uniHeight / 1.55,
                  width: uniWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(top: uniHeight / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: uniWidth / 7),
                          ),
                          ArtifactBrochure(
                            uniHeight: uniHeight,
                            uniWidth: uniWidth,
                            image: 'assets/dino.png',
                            type: 'ancient art',
                            title1: 'Francois',
                            title2: 'POMPON',
                            existence: 'AD 1855-1933',
                          ),
                          Padding(padding: EdgeInsets.only(left: uniWidth / 8)),
                          ArtifactBrochure(
                            uniHeight: uniHeight,
                            uniWidth: uniWidth,
                            image: 'assets/coin.png',
                            type: 'ancient coin',
                            title1: 'Alexander the',
                            title2: 'Molossain',
                            existence: 'BC 344-322',
                          ),
                          Padding(padding: EdgeInsets.only(left: uniWidth / 8)),
                          ArtifactBrochure(
                            uniHeight: uniHeight,
                            uniWidth: uniWidth,
                            image: 'assets/dino.png',
                            type: 'ancient art',
                            title1: 'Francois',
                            title2: 'POMPON',
                            existence: 'AD 1855-1933',
                          ),
                          Padding(padding: EdgeInsets.only(left: uniWidth / 8)),
                          ArtifactBrochure(
                            uniHeight: uniHeight,
                            uniWidth: uniWidth,
                            image: 'assets/coin.png',
                            type: 'ancient coin',
                            title1: 'Alexander the',
                            title2: 'Molossain',
                            existence: 'BC 344-322',
                          ),
                          Padding(padding: EdgeInsets.only(left: uniWidth / 8)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArtifactBrochure extends StatelessWidget {
  const ArtifactBrochure(
      {Key key,
      @required this.uniHeight,
      @required this.uniWidth,
      @required this.image,
      this.type,
      this.title1,
      this.title2,
      this.existence})
      : super(key: key);

  final double uniHeight;
  final double uniWidth;
  final String image;
  final String type;
  final String title1;
  final String title2;
  final String existence;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: uniHeight / 1.87,
      width: uniWidth / 1.7,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10.0,
                spreadRadius: 25.0),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: uniHeight / 20)),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 25),
            child: Container(
              height: uniHeight / 7,
              width: uniWidth / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.contain)),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: uniHeight / 100)),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 20),
            child: Text(type,
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                    fontSize: uniWidth / 30,
                    fontFamily: 'Poppins')),
          ),
          Padding(padding: EdgeInsets.only(top: uniHeight / 60)),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 20),
            child: Text(title1,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: uniWidth / 16,
                    fontFamily: 'Poppins')),
          ),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 20),
            child: Text(title2,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: uniWidth / 16,
                    fontFamily: 'Poppins')),
          ),
          Padding(padding: EdgeInsets.only(top: uniHeight / 60)),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 20),
            child: Text(existence,
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                    fontSize: uniWidth / 26,
                    fontFamily: 'Poppins')),
          ),
          Padding(padding: EdgeInsets.only(top: uniHeight / 20)),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 20),
            child: Text('current bid',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: uniWidth / 36,
                    fontFamily: 'Poppins')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: uniWidth / 20),
                child: Text('27k',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: uniWidth / 19,
                        fontFamily: 'Poppins')),
              ),
              Padding(padding: EdgeInsets.only(left: uniWidth / 3.2)),
              Icon(
                Icons.favorite_border,
                color: Colors.black38,
              )
            ],
          ),
        ],
      ),
    );
  }
}
