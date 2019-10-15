import 'package:flutter/material.dart';
import 'login.dart';
import 'stacked_icons.dart';

void main() => runApp(SCP());

class SCP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCP',
      debugShowCheckedModeBanner: false,
      // Set Raleway as the default app font
      // theme: ThemeData(
      //   fontFamily: 'Roboto',
      // ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Stack(
              alignment: Alignment.center,
              children: <Widget>[
                 StakedIcons(),
                
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                  child:  Text(
                    "SC Paul Jewellers",
                    style:  TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child:  Text(
                    "www.scpauljewellers.com",
                    style:  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context) => LoginPage(),
                         ));
                      },
                      child:  Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius:  BorderRadius.circular(9.0)),
                          child:  Text("Sign In with OTP",
                              style:  TextStyle(
                                  fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}