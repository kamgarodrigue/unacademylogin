import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  String icon, title, subtitle;
  List<Color> colors;
  Item({Key key, this.icon, this.subtitle, this.title, this.colors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: heigth * 0.2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
            colors: colors),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white38),
            width: widht * 0.48,
            height: heigth * 0.07,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/icon.png",
                    width: 30,
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'un',
                          style: TextStyle(
                              color: Color.fromRGBO(76, 175, 80, 1),
                              fontSize: 17),
                        ),
                        TextSpan(
                          text: 'academy',
                          style: TextStyle(
                              color: Color.fromRGBO(30, 136, 229, 1),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: heigth * 0.05,
          ),
          Image.asset(
            icon,
            width: 150,
            height: 150,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: heigth * 0.02,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 15),
          )
        ],
      ),
    );
  }
}
