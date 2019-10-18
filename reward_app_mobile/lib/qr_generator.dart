import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'home.dart';

class QRGenerator extends StatefulWidget {
  @override
  _QRGeneratorState createState() {
    return _QRGeneratorState();
  }
}

class _QRGeneratorState extends State<QRGenerator> {
void _generateQR() {
  print("Generating QR.....");
  setState(() {
    qr_data = nameTextController.text+mobileTextController.text;
    print(qr_data);
    tapped_on_register = true;
    qr_status = "QR Code generate successfully";
  });
  
}
void _resetQR() {
  print("Reseting QR.....");
  setState(() {
    qr_data = "";
    tapped_on_register = false;
    qr_status = "";
    nameTextController.text="";
    mobileTextController.text="";

  });
  
}
var nameTextController = TextEditingController();
        var mobileTextController = TextEditingController();
  String qr_status="";
  String qr_data="";
  bool tapped_on_register = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));
    
                return Scaffold(
                  appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      iconTheme: IconThemeData(color: Color(0xFF18D191))),
                  body: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                          child: TextField(
                            controller: mobileTextController,
                    decoration: InputDecoration(labelText: 'Mobile Number'),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: TextField(
                    controller: nameTextController,
                decoration: InputDecoration(labelText: 'Name'),
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
                      onTap: () => _generateQR(),
                      child: Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(9.0)),
                          child: Text("Register Customer",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Visibility(
                
                visible: tapped_on_register,
              // child : Expanded(
              //     child: Padding(
              //   padding:
              //       const EdgeInsets.only(left: 20.0, right: 5.0, top: 10.0),
              //   child: Container(
              //       height: 250.0,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.0),
              //           image: DecorationImage(
              //               image: NetworkImage(
              //                   'https://d3uxjh2kr4vhnj.cloudfront.net/images/team/rameshwar_paul.jpg'),
              //               fit: BoxFit.cover))),
                      
              // ))
              child : Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 5.0, top: 10.0),
                child: Center(
                  child: Container(
                      width: 250,
                      height: 250,
                      child: QrImage(
                        data: qr_data,
                        // foregroundColor: Color(0xff03291c),
                        // embeddedImage: AssetImage('assets/images/logo_yakka.png'),
                      ),
                    ),
                  )      
              ))
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Visibility(
                visible: tapped_on_register,
              child : Expanded(
                  child: Text(
                            qr_status,
                            style:  TextStyle(fontSize: 20.0, color: Colors.greenAccent, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Visibility(
                
                visible: tapped_on_register,
              child : Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 5.0, top: 10.0),
                  child: GestureDetector(
                    onTap: () => _resetQR(),
                    child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(9.0)),
                        child: Text("Reset",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              )
              )
            ]),

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


