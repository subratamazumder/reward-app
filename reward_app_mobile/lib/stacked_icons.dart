import 'package:flutter/material.dart';

class StakedIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
              alignment: Alignment.center,
              children: <Widget>[
                 Container(
                  height: 60.0,
                  width: 60.0,
                  decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(50.0),
                      color: Colors.black),
                  child:  Icon(
                    Icons.local_offer,
                    color: Colors.white,
                  ),
                ),
                 Container(
                  margin:  EdgeInsets.only(right: 50.0, top: 50.0),
                  height: 60.0,
                  width: 60.0,
                  decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(50.0),
                      color: Colors.black),
                  child:  Icon(
                    Icons.card_membership,
                    color: Colors.white,
                  ),
                ),
                 Container(
                  margin:  EdgeInsets.only(left: 90.0, top: 40.0),
                  height: 60.0,
                  width: 60.0,
                  decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(50.0),
                      color: Colors.black),
                  child:  Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                )
              ],
            );
  }
}