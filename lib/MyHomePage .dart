import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:unacademy/Item.dart';
import 'package:international_phone_input/international_phone_input.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List cardList = [
    Item(
      title: 'India\'s best educators',
      subtitle:
          'Get unlimited access to courses and batches\n\nfom india stop educators',
      icon: 'assets/un3.png',
      colors: [
        Colors.white,
        Color.fromRGBO(92, 107, 192, 1),
      ],
    ),
    Item(
      title: 'Daily iterative live classes',
      subtitle:
          'Chat whit your educator ,ask doubts and\n\nfom india stop educators',
      icon: "assets/un1.png",
      colors: [
        Colors.white,
        Color.fromRGBO(244, 143, 117, 1),
      ],
    ),
    Item(
      title: 'Structured courses and PDFs',
      subtitle:
          'Access study materials that are\n\nstructured for the exam sylabus completion',
      icon: 'assets/un2.png',
      colors: [
        Colors.white,
        Color.fromRGBO(165, 214, 167, 1),
      ],
    ),
    Item(
      title: 'Live test & Quizzes',
      subtitle:
          'evaluate your competence with detailed\n\n report and analysis',
      icon: 'assets/un4.png',
      colors: [
        Colors.white,
        Color.fromRGBO(255, 204, 128, 1),
      ],
    ),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<Color> color = [
    Color.fromRGBO(30, 136, 229, 1),
    Color.fromRGBO(238, 64, 122, 1),
    Color.fromRGBO(76, 175, 80, 1),
    Color.fromRGBO(255, 204, 128, 1)
  ];
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: heigth,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 0,
                    disableCenter: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: cardList.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueAccent,
                        child: card,
                      );
                    });
                  }).toList(),
                ),
              ],
            ),
            Positioned(
              top: heigth * 0.76,
              width: widht,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index ? color[index] : Colors.grey,
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: heigth * 0.2,
                width: widht,
                padding: EdgeInsets.only(
                    top: heigth * 0.02,
                    left: widht * 0.05,
                    right: widht * 0.05),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login or  Signup',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder) => _bottomSheet(context));
                      },
                      child: Image.asset("assets/un7.png"),
                    ),
                    SizedBox(
                      height: heigth * 0.01,
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          left: widht * 0.038,
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            color: Color.fromRGBO(
                                142, 142, 147, 0.12), //Colors.grey[300],

                            borderRadius: BorderRadius.circular(10)),
                        child: InternationalPhoneInput(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mobile phone',
                          ),
                          // onPhoneNumberChange: onPhoneNumberChange,
                          //initialPhoneNumber: phoneNumber,
                          // initialSelection: phoneIsoCode,
                          /* enabledCountries: [
                          '+237',
                        ],*/
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomSheet(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      height: 290,
      // padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              width: widht * 0.85,
              height: heigth * 0.05,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/un5.png",
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      'Get 200 credits by signing up!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ]),
            ),
          ),
          Container(
            width: widht,
            // height: heigth * 0.415,
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get stared',
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset("assets/un6.png"),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          //Colors.grey[300],

                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'Email address'),
                      )),
                ),
                SizedBox(
                  height: heigth * 0.05,
                ),
                Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    height: 50,
                    width: widht,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        //Colors.grey[300],

                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text('continue',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)))),
                SizedBox(
                  height: heigth * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
