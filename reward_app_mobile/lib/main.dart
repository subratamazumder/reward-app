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
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new StakedIcons(),
                
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                  child: new Text(
                    "SC Paul Jewellers",
                    style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: new Text(
                    "www.scpauljewellers.com",
                    style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            new Row(
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
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Colors.black,
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Sign In with OTP",
                              style: new TextStyle(
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