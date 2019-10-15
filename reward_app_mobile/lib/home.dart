import 'package:flutter/material.dart';
import 'package:reward_app_mobile/qr_generator.dart';
import 'scanner.dart';
import 'map_location.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0XFF29D091),
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: [
           BottomNavigationBarItem(
              title:  Text(''), icon:  Icon(Icons.home)),
           BottomNavigationBarItem(
              title:  Text(''), icon:  Icon(Icons.card_membership)),
           BottomNavigationBarItem(
              title:  Text(''), icon:  Icon(Icons.add_box)),
           BottomNavigationBarItem(
            title:  Text(''),
             icon:  Icon(Icons.location_on)
          )
        ],
      ),
      appBar:  AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme:  IconThemeData(color: Color(0xFF18D191))),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:  Container(
              child:  Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                   Text(
                    "Warm welcome",
                    style:  TextStyle(
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
               SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRGenerator()));
                            },
                            child:  Container(
                              height: 100.0,
                              decoration:  BoxDecoration(
                                  borderRadius:  BorderRadius.circular(5.0),
                                  color: Colors.black),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   Icon(
                                    Icons.card_membership,
                                    color: Colors.white,
                                  ),
                                   Text("New Membership",
                                      style:  TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ))),
                   Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScannerPage()));
                            },
                            child:  Container(
                              height: 100.0,
                              decoration:  BoxDecoration(
                                  borderRadius:  BorderRadius.circular(5.0),
                                  color: Colors.black),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   Icon(
                                    Icons.add_box,
                                    color: Colors.white,
                                  ),
                                   Text("Add Rewards",
                                      style:  TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ))),
                           Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapLocation()));
                            },
                            child:  Container(
                              height: 100.0,
                              decoration:  BoxDecoration(
                                  borderRadius:  BorderRadius.circular(5.0),
                                  color: Colors.black),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                   Text("Location",
                                      style:  TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          )))
                ],
              ),
               SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                   Expanded(
                      child:  Text("Core Team",
                          style:  TextStyle(fontSize: 18.0))),
                ],
              ),
               SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/team/rameshwar_paul.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                           Text(
                            "Director",
                            style:  TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 5.0,
                  ),
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/team/debraj-paul.JPG'),
                                    fit: BoxFit.cover)),
                          ),
                           Text("Executive Management",
                              style:  TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 5.0,
                  ),
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/team/rajib-paul-.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                           Text('Executive Management',
                              style:  TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                   Expanded(
                      child:  Text("Recently Added",
                          style:  TextStyle(fontSize: 18.0))),
                   Expanded(
                      child:  Text(
                    "View All",
                    style:  TextStyle(color: Color(0XFF2BD093)),
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
               SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/banner/sc-paul-model.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 5.0,
                  ),
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/banner/sc-paul-model.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 5.0,
                  ),
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/banner/sc-paul-model.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                   Expanded(
                      child:  Text("Trending Design",
                          style:  TextStyle(fontSize: 18.0))),
                   Expanded(
                      child:  Text(
                    "View All",
                    style:  TextStyle(color: Color(0XFF2BD093)),
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
               SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/banner/sc-paul-model.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 5.0,
                  ),
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/banner/sc-paul-model.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 5.0,
                  ),
                   Expanded(
                    child: Container(
                      height: 150.0,
                      child:  Column(
                        children: <Widget>[
                           Container(
                            height: 100.0,
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(5.0),
                                image:  DecorationImage(
                                    image:  NetworkImage(
                                        'https://d3uxjh2kr4vhnj.cloudfront.net/images/banner/sc-paul-model.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        )
      ],
    );
  }
}
