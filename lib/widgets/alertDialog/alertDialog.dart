import 'package:flutter/material.dart';


class LatLanDialog extends StatefulWidget {
  @override
  _LatLanDialogState createState() => _LatLanDialogState();
}

class _LatLanDialogState extends State<LatLanDialog> {

    TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  @override
  Widget build(BuildContext context) {

      Container dispensaryLatLongRegisterContainer(String label, String field, bool secure,
      TextInputType type, TextEditingController control) {
        
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 15),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////   textfield /////////

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(1.0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
           // height: 40,
            child: TextField(
              style: TextStyle(color: Color(0xFF000000)),
              keyboardType: type,
              obscureText: secure,
              controller: control,
              cursorColor: Color(0xFF9b9b9b),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFFFBFBFB))),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                hintText: field,
                hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                    fontFamily: "standard-regular",
                    fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.only(left: 20, bottom: 12, top: 12),
                fillColor: Color(0xFFFFFFFF),
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: Container(
           
              decoration: BoxDecoration( 
                  border: Border(
                      bottom: BorderSide(
                          width: 3, color: Colors.grey.withOpacity(0.2)))),

                   child:        Text(
                  "Would you to fill your location latitude and longitude manually? If Yes, then fill it or Turn on your device GPS",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          content:Container(
             height: 200,
             width: MediaQuery.of(context).size.width, 
            child: Column(
              children: <Widget>[

               // SizedBox(height: 10),
                 dispensaryLatLongRegisterContainer("Address Latitude", "Type here", false,
                TextInputType.number, latitudeController),
            dispensaryLatLongRegisterContainer("Address Longitude", "Type here", false,
                TextInputType.number, longitudeController),
              ],
            ),
          ),
          //  Container(
          //   margin: EdgeInsets.only(top: 5, right: 5, left: 20),
          //   height: 40,
          //   width: 300.00,
          // //  child:
               
          // ),
          actions: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.all(Radius.circular(20.0)),
                ),
                width: 110,
                height: 45,
                margin: EdgeInsets.only(bottom: 15),
                child: OutlineButton(
                    color: Colors.green,
                    child: new Text("Send", style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //         builder: (context) => MapPage()));
                    },
                    borderSide:
                        BorderSide(color: Colors.green, width: 0.5),
                    shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.circular(20.0))))
          ],
        );
  }
}