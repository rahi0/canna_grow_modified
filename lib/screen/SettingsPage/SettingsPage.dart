import 'package:cannagrowdev/ImportFile/ImportPages.dart';

 

class Settings extends StatefulWidget {

  
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


 bool _dispensaryIsEmpty = true;

 

 var userData;
  var dispensaryData;

    @override
  void initState() {
    _getProfileInfo();
    visitSettings = true;
    super.initState();
  }

  void _getProfileInfo() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');
 
    var user = json.decode(userJson);   
    var dispensary;
    if(dispensaryJson!=null){
       dispensary = json.decode(dispensaryJson);
    }
    else{
       dispensary = null;
    }
     setState(() {
      userData = user;
    });
     if(dispensary == null){
        _dispensaryIsEmpty = true;
    }
    else{
 
    setState(() {
  
      dispensaryData = dispensary;
       _dispensaryIsEmpty = false;
    });
   
    
    } 
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
         appBar: AppBar(
        //elevation: 0,
        automaticallyImplyLeading: false,
              leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back_ios,color:Color(0xFF01d56a),),
        onPressed: () { 
          Navigator.of(context).pop();
        },
       
      );
    },
  ), 
        title: Text(
          'Settings',
          style: TextStyle(
          color:Color(0xFF01d56a),
           // fontSize: 21.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
       // centerTitle: true,
      ),
      body: Container(
        //color: Colors.red,
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            ///////////Edit Profile Button//////////
            GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: EditProfilePage()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 10),
                    //margin: EdgeInsets.only(bottom: 40),
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                Icons.settings,
                color: Colors.black,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                'Edit Profile',
                textDirection: TextDirection.ltr,
                 style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                color: Colors.black,
                               
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                 fontWeight: FontWeight.w500,
                                ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),

            ///////////Edit Profile Button//////////
            

            
         //   Container(width: MediaQuery.of(context).size.width, height: 0.5),

            ///////////Change mail Button//////////

            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(context, SlideLeftRoute(page: ChangeMailPage()));
            //     },
            //     child: Card(
            //       color: Colors.teal,
            //       shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //         width: MediaQuery.of(context).size.width,
            //         padding:
            //             EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             Container(
            //               child: Row(
            //                 children: <Widget>[
            //                   Container(
            //                     margin: EdgeInsets.only(right: 10),
            //                     child: Icon(
            //                       Icons.mail_outline,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   Container(
            //                     alignment: Alignment.centerLeft,
            //                     child: Text(
            //                       'Change Email',
            //                       textDirection: TextDirection.ltr,
            //                       style: TextStyle(
            //                         letterSpacing: 0.5,
            //                         wordSpacing: 1,
            //                         color: Colors.white,
            //                         fontSize: 17.0,
            //                         decoration: TextDecoration.none,
            //                         fontFamily: 'BebasNeue',
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             Container(
            //               child: Icon(
            //                 Icons.keyboard_arrow_right,
            //                 color: Colors.white,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     )),

            ///////////Change Email Button end//////////

            Padding(
              padding:EdgeInsets.only(left: 50),
              child: Divider(
                color: Colors.grey[400],
              ),
            ),


            ///////////Reset Password Button//////////

            GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: ChangePassword()));
                },
                child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 7),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.vpn_key,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Change Password',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                color: Colors.black,
                               
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                 fontWeight: FontWeight.w500,
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                  )),

            ///////////Reset Password Button end//////////
            


            Padding(
              padding:EdgeInsets.only(left: 50),
              child: Divider(
                color: Colors.grey[400],
              ),
            ),


         
            

             /////////// add shop Button//////////

            _dispensaryIsEmpty?
            GestureDetector(
                onTap: () {
                  

               
                   setState(() {
                     goFirst = false;
                   });
                 
                 Navigator.push(context, SlideLeftRoute(page: DispensaryRegisterPage()));
               

               
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 7),
                
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.shop,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Add Shop',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                color: Colors.black,
                               
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                 fontWeight: FontWeight.w500,
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                  ))
                  :
 

                   ///////////Reset Cannbie Button//////////

            GestureDetector(
                onTap: () {
                 Navigator.push(context, SlideLeftRoute(page: EditShopPage()));
                },
                child: Container(
                width: MediaQuery.of(context).size.width,
              //   margin: EdgeInsets.only(top: 10),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 7),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.mode_edit,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Edit Shop',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                color: Colors.black,
                               
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                 fontWeight: FontWeight.w500,
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                  )),
 Padding(
              padding:EdgeInsets.only(left: 50),
              child: Divider(
                color: Colors.grey[400],
              ),
            ),

            ///////////Reset Cannabi Button end//////////

            ///////////add shop end//////////
          ],
        ),
      ),
    ));
  }

  // logout the user 
  // _logout() async{
  //     var res = await CallApi().getData('logout');
  //     var body = json.decode(res.body);
  //     if(body['success']){
  //        _showMsg(body['message']);
  //         SharedPreferences localStorage = await SharedPreferences.getInstance();
  //         localStorage.remove('token');
  //         localStorage.remove('user');
        
  //       Navigator.push(
  //         context, SlideRightRoute(page: Login())
  //       );
       
  //     }else{
  //       _showMsg(body['message']);
  //     }
  // }
}
