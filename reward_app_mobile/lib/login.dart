import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'stacked_icons.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.orange, //or set color with: Color(0xFF0000FF)
    ));
    return  Scaffold(
      appBar:  AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme:  IconThemeData(color: Color(0xFF18D191))),
      body: Container(
        width: double.infinity,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //  StakedIcons(),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
            //       child:  Text(
            //         "Quick Bee",
            //         style:  TextStyle(fontSize: 30.0),
            //       ),
            //     )
            //   ],
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child:  TextField(
                decoration:  InputDecoration(labelText: 'Mobile Number'),
              ),
            ),
             SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child:  TextField(
                obscureText: true,
                decoration:  InputDecoration(labelText: 'OTP'),
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 5.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child:  Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius:  BorderRadius.circular(9.0)),
                          child:  Text("Login",
                              style:  TextStyle(
                                  fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 10.0, right: 20.0, top: 10.0),
                //     child:  Container(
                //         alignment: Alignment.center,
                //         height: 60.0,
                //         child:  Text("Forgot Password?",
                //             style:  TextStyle(
                //                 fontSize: 17.0, color: Color(0xFF18D191)))),
                //   ),
                // )
              ],
            ),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.only(bottom:18.0),
            //         child:  Text("Create A  Account ",style:  TextStyle(
            //                     fontSize: 17.0, color: Color(0xFF18D191),fontWeight: FontWeight.bold)),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
