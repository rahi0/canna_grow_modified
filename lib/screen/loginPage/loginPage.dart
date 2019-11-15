


import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:flutter/services.dart';



class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  //   @override
  // void dispose() {
  //   print("Logout");
  //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                //padding: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                height: 90,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'CannaGrow',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 31.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'sourcesanspro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/sign_in_cannagrow.png",
                            height: 85,
                            width: 85,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                ),
              ),


              LogInForm(),


                 ///////////////// Sign Up Button  Start///////////////
//DispensaryCommonRegisterPage()
                GestureDetector(
                    onTap: () {
                       Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => DispensaryCommonRegisterPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(
                        'Have not account? Sign Up',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.greenAccent[400],
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'sourcesanspro',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                ),

                ///////////////// Sign Up Button  End///////////////

                // ///////////////// Buyer Button  Start///////////////

                // Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //     ),
                //     width: 160,
                //     height: 35,
                //     margin: EdgeInsets.only(top: 15, bottom: 15),
                //     child: OutlineButton(
                //       child: Text(
                //         'buyer',
                //         textDirection: TextDirection.ltr,
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 17.0,
                //           decoration: TextDecoration.none,
                //           fontFamily: 'MyriadPro',
                //           fontWeight: FontWeight.normal,
                //         ),
                //       ),
                //       borderSide: BorderSide(color: Colors.black, width: 0.5),
                //       shape: new RoundedRectangleBorder(
                //           borderRadius: new BorderRadius.circular(20.0)),
                //       onPressed: () {
                //       //  Navigator.push(
                //       //       context,
                //       //       new MaterialPageRoute(
                //       //           builder: (context) => DispensaryCommonRegisterPage()));
                //       },
                //     )),

                // ///////////////// Buyer Button  End///////////////

                // Text(
                //   'OR',
                //   textDirection: TextDirection.ltr,
                //   style: TextStyle(
                //     color: Colors.grey[700],
                //     fontSize: 11.0,
                //     decoration: TextDecoration.none,
                //     fontFamily: 'sourcesanspro',
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),

                // ///////////////// Seller Button///////////////

                // Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //     ),
                //     width: 160,
                //     height: 35,
                //     margin: EdgeInsets.only(top: 15, bottom: 15),
                //     child: OutlineButton(
                //       child: Text(
                //         'seller',
                //         textDirection: TextDirection.ltr,
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 17.0,
                //           decoration: TextDecoration.none,
                //           fontFamily: 'MyriadPro',
                //           fontWeight: FontWeight.normal,
                //         ),
                //       ),
                //       borderSide: BorderSide(color: Colors.black, width: 0.5),
                //       shape: new RoundedRectangleBorder(
                //           borderRadius: new BorderRadius.circular(20.0)),
                //       onPressed: () {
                //       //  Navigator.push( 
                //       //       context,
                //       //       new MaterialPageRoute(
                //       //           builder: (context) => GrowCommonRegisterPage()));
                //       },
                //     )),

                // ///////////////// Seller Button  End///////////////

                       
            ],
          ),
      ),
    ),
                  ),
        ));
  }
}
