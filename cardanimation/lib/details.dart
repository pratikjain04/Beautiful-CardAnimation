import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class DetailsArtifact extends StatefulWidget {
  final String image;
  final String type;
  final String title1;
  final String title2;
  final String existence;
  final String details;

  DetailsArtifact(
      {this.image,
      this.type,
      this.title1,
      this.title2,
      this.existence,
      this.details});

  @override
  _DetailsArtifactState createState() => _DetailsArtifactState();
}

class _DetailsArtifactState extends State<DetailsArtifact>
    with TickerProviderStateMixin {
  AnimationController _previousDetailController;
  AnimationController _fabController;
  AnimationController _amountController;
  AnimationController _detailsController;
  Animation<double> _detailsAnimation;
  Animation<double> _previousAnimation;
  Animation<double> _fabAnimation;
  Animation<double> _amountAnimation;

  @override
  void initState() {
    super.initState();
    _previousDetailController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _amountController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _fabController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _detailsController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _previousAnimation = CurvedAnimation(
        parent: _previousDetailController, curve: Curves.easeIn);
    _amountAnimation = CurvedAnimation(
        parent: _previousDetailController, curve: Curves.easeIn);
    _fabAnimation = CurvedAnimation(
        parent: _previousDetailController, curve: Curves.bounceInOut);

    setState(() {
      _previousDetailController.forward();
        _amountController.forward();
        _detailsController.forward().whenComplete(() {
          _fabController.forward();
        });
    });

    _previousDetailController.addListener(() => setState(() {}));
    _detailsController.addListener(() => setState(() {}));
    _fabController.addListener(() => setState(() {}));
    _amountController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _detailsController?.dispose();
    _fabController?.dispose();
    _amountController?.dispose();
    _previousDetailController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    final uniHeight = MediaQuery.of(context).size.height;
    final uniWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionalTranslation(
            translation: Offset(0.5, -0.4),
            child: Hero(
              tag: widget.image,
              child: Container(
                height: uniHeight / 10,
                width: uniWidth / 1.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.contain)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: uniWidth / 10, top: uniHeight / 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    color: Colors.black54,
                    size: uniWidth / 11,
                  ),
                  Padding(padding: EdgeInsets.only(left: uniWidth / 200)),
                  Padding(
                    padding: EdgeInsets.only(top: uniHeight / 100),
                    child: Text('Home',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 23,
                            fontFamily: 'Poppins')),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: uniHeight / 3.5,
                left: uniWidth / 9 * _previousAnimation.value),
            child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _previousAnimation.value,
                curve: Curves.linear,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.type,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 28,
                            fontFamily: 'Poppins')),
                    Padding(padding: EdgeInsets.only(top: uniHeight / 100)),
                    Text(widget.title1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 13.5,
                            fontFamily: 'Poppins')),
                    Text(widget.title2,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 13.5,
                            fontFamily: 'Poppins')),
                    Padding(padding: EdgeInsets.only(top: uniHeight / 22)),
                    Text(widget.existence,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 22,
                            fontFamily: 'Poppins'))
                  ],
                )),
          ),
          FractionalTranslation(
            translation: Offset(0.11, 1.0 - _detailsController.value * 0.45),
            child: Padding(
              padding: EdgeInsets.only(right: uniWidth / 5),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _detailsController.value,
                curve: Curves.linear,
                child: Text(widget.details,
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                        fontSize: uniWidth / 26,
                        fontFamily: 'Poppins')),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: uniHeight / 1.15,
              bottom: 0.0,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.25 - _amountController.value * 0.12,
                0.75 + _amountController.value * 0.1),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: _amountController.value,
              curve: Curves.linear,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('current bid',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 32,
                            fontFamily: 'Poppins')),
                    Text('27k',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: uniWidth / 17,
                            fontFamily: 'Poppins')),
                  ],
                ),
              ),
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.45, 1.1 - _fabController.value * 0.26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: uniHeight / 11.5,
                  width: uniWidth / 6.3,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey[200],
                          blurRadius: 3.0,
                          spreadRadius: 4.0
                      ),
                      ],
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Center(
                    child: Text('bid',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: uniWidth / 21,
                            fontFamily: 'Poppins')),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: uniWidth / 7)),
                Container(
                    height: uniHeight / 11.5,
                    width: uniWidth / 6.3,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 3.0,
                              spreadRadius: 4.0
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0)),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black54,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
