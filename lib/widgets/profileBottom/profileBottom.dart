import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class ProfileBottom extends StatefulWidget {
  @override
  _ProfileBottomState createState() => _ProfileBottomState();
}

class _ProfileBottomState extends State<ProfileBottom> {
  var userData;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  SharedPreferences localStorage;

  void _getUserInfo() async {
    localStorage = await SharedPreferences.getInstance();

    var userJson = localStorage.getString('user');

    var user = json.decode(userJson);

    setState(() {
      userData = user;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Center(
child:  Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 30,left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      //height: 90,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                 color:Color(0xFF01d56a).withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              //width: 150,
                              height: 45,
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Settings',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'MyriadPro',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                color: Colors.transparent,
                                // elevation: 4.0,
                                //splashColor: Colors.blueGrey,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                                onPressed: () {
                                Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Settings()));
                                },
                              )),
                          ///////////////// Add to cart Button  Start///////////////

                          Container(
                              decoration: BoxDecoration(
                                 color: Colors.redAccent,
                              
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              //width: 150,
                              height: 45,
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.exit_to_app,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Logout',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'MyriadPro',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                color: Colors.transparent,
                                // elevation: 4.0,
                                //splashColor: Colors.blueGrey,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                                onPressed: () {
                                  logout();
                                },
                              )),
                        ],
                      ),
                    ),

      // child: Card(
      //   elevation: 0.2,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      //   margin: EdgeInsets.only(top: 30, bottom: 30, left: 40, right: 40),
      //   child: Container(
        
      //     padding: EdgeInsets.only(bottom: 10, top: 5),
      //     decoration: BoxDecoration(
      //       color: Color(0xFFFFFFFF),
      //       borderRadius: BorderRadius.circular(50),
      //          boxShadow:[
      //                          BoxShadow(color:Colors.grey[200],
      //                          blurRadius: 16.0,
      //                          // offset: Offset(0.0,3.0)
      //                           )
                             
      //                        ],
      //     ),

      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 new MaterialPageRoute(
      //                     builder: (context) => Settings()));
      //           },
      //           child: Container(
      //           //  margin: EdgeInsets.only(left: 20),
      //             child: Column(
      //               children: <Widget>[
      //                 Container(
      //                   child: Text(
      //                     "Settings",
      //                     textAlign: TextAlign.left,
      //                     style: TextStyle(
      //                         color: Color(0xFF000000),
      //                         fontFamily: "grapheinpro-black",
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.w400),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 20,
      //                   height: 20,
      //                   child: Icon(
      //                     Icons.settings,
      //                     color: Color(0xFF01D56A),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           width: 3,
      //           height: 30,
      //           color: Colors.grey[300],
      //           margin: EdgeInsets.only(left: 15),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             // Navigator.push(
      //             //     context,
      //             //     new MaterialPageRoute(
      //             //         builder: (context) => Report()));
      //           },
      //           child: GestureDetector(
      //             onTap: () {
      //               logout();
      //             },
      //             child: Container(
      //              // alignment: Alignment.center,
      //               margin: EdgeInsets.only( top: 5,left: 50),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: <Widget>[
      //                   Container(
      //                     child: Text(
      //                       "Log out",
      //                       textAlign: TextAlign.left,
      //                       style: TextStyle(
      //                           color: Color(0xFF000000),
      //                           fontFamily: "grapheinpro-black",
      //                           fontSize: 14,
      //                           fontWeight: FontWeight.w400),
      //                     ),
      //                   ),
      //                   Container(
      //                     width: 20,
      //                     height: 20,
      //                     child: Icon(
      //                       Icons.exit_to_app,
      //                       color: Color(0xFF01D56A),
      //                     ),
      //                   )
      //                   // Container(
      //                   //     width: 20,
      //                   //     height: 20,
      //                   //     margin: EdgeInsets.only(top: 5),
      //                   //     decoration: new BoxDecoration(
      //                   //         image: new DecorationImage(
      //                   //       fit: BoxFit.fill,
      //                   //       image: new AssetImage(
      //                   //           'assets/images/logout.png'),
      //                   //     )))
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         // Container(
      //         //   width: 3,
      //         //   height: 30,
      //         //   color: Colors.grey[300],
      //         //   margin: EdgeInsets.only(left: 15),
      //         // ),
      //         // GestureDetector(
      //         //   onTap: () {
      //         //     // Navigator.push(context,
      //         //     //     new MaterialPageRoute(builder: (context) => EditProfilePage()));
      //         //   },
      //         //   child: Container(
      //         //     margin: EdgeInsets.only(left: 10, top: 5),
      //         //     padding: EdgeInsets.only(right: 10),
      //         //     child: Column(
      //         //       children: <Widget>[
      //         //         Container(
      //         //           child: Text(
      //         //             "Share Code",
      //         //             textAlign: TextAlign.left,
      //         //             style: TextStyle(
      //         //                 color: Color(0xFF000000),
      //         //                 fontFamily: "grapheinpro-black",
      //         //                 fontSize: 14,
      //         //                 fontWeight: FontWeight.w400),
      //         //           ),
      //         //         ),
      //         //         Container(
      //         //           width: 20,
      //         //           height: 20,
      //         //           child: Icon(
      //         //             Icons.share,
      //         //             color: Color(0xFF01D56A),
      //         //           ),
      //         //         )
      //         //       ],
      //         //     ),
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  void logout() async {
    var data = {
      'userId': '${userData['id']}',
    };
    // logout from the server ...
    var res = await CallApi().postData(data, 'auth/logout');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      localStorage.remove('user');
      localStorage.remove('dispensary');
      localStorage.remove('token');
      store.state.allItemsData= [];
     store.state.data= {};
     store.state.notificationCount=0;
     store.state.connection= true;
    store.state.reviewList= [];
    store.state.avgReview=0.0;
    store.state.orderList= [];
    store.state.orderDetails=[];
    store.state.notifiCheck=true;
    store.state.notiList= [];
    store.state.isOrder = false;
    store.state.isProduct = false;
    store.state.isHome = false;
    store.state.isShop = false;
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LogIn()));
    }
  }
}
