import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class DetailsArtifact extends StatefulWidget {
  final String image;
  final String type;
  final String title1;
  final String title2;
  final String existence;

  DetailsArtifact(
      {this.image, this.type, this.title1, this.title2, this.existence});

  @override
  _DetailsArtifactState createState() => _DetailsArtifactState();
}

class _DetailsArtifactState extends State<DetailsArtifact> {
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
                    size: uniWidth / 13,
                  ),
                  Padding(padding: EdgeInsets.only(left: uniWidth / 200)),
                  Text('Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: uniWidth / 22,
                          fontFamily: 'Poppins'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
