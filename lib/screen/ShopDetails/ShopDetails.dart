import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/JsonModel/ShopReviewModel/ShopReviewModel.dart';


class ShopDetails extends StatefulWidget {
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  var userData;
  var dispensaryData;
  bool _dispensaryIsEmpty = true;
  bool _isLoading = false;
  String _showAddshop = "";
  var shopReview;
  var rating;
  var proImage;
  var avgRate;
  @override
  void initState() {
     store.dispatch(ConnectionCheck(true));
    _getUserInfo();

    visitSettings = false;
    bottomNavIndex = 4;
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');

    var user = json.decode(userJson);
    var dispensary;
    if (dispensaryJson != null) {
      dispensary = json.decode(dispensaryJson);
    } else {
      dispensary = null;
    }
    setState(() {
      userData = user;
      
    });

    if (dispensary == null) {
      _isLoading = false;
      _dispensaryIsEmpty = true;
      _showAddshop = "Yes";
    } else {
      setState(() {
        dispensaryData = dispensary;
        _isLoading = false;
        _dispensaryIsEmpty = false;
         _showAddshop = "No";
      });

    //  store.state.reviewList.length>0?null :
    //   _showshopReview();

      store.state.isShop==true?null : _showshopReview();
    }

    //
  }

 Future <void> _showshopReview() async {
    // print('${dispensaryData['id']}');

    setState(() {
      _isLoading = true;
    });

    var res = await CallApi()
        .getData('app/itemreviewsbygrow/${dispensaryData['id']}');
    var collection = json.decode(res.body);
    var showShopReview = ShopReviewModel.fromJson(collection);


    // proImage =assets/images/banner.jpg// "https://dynamyk.biz"+'${userData['img']}';
   // proImage = "http://localhost:3333"+'${userData['img']}';
    //   print(showShopReview);
  if (!mounted) return;
    setState(() {
      shopReview = showShopReview.itemReview;
      avgRate = showShopReview.averageReview;
      _isLoading = false;
    });


    store.dispatch(ReviewList(shopReview));
    store.dispatch(ShopCheck(true));

     avgRate==null? "0": avgRate[0].avgRating ==null?"":
     store.dispatch(AvgReview(avgRate[0].avgRating));

    print(avgRate);
  }

  Container shopContainer(String label, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "DINPro",
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            //color: Colors.red,
            width: 150,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10),
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "DINPro",
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _dispensaryIsEmpty && _showAddshop=="Yes"
                  ? AlertDialog( 
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Please add your shop information from your profile tab",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "grapheinpro-black",
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      content: Container(
                          height: 70,
                          width: 250,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    width: 110,
                                    height: 45,
                                    margin: EdgeInsets.only(
                                      top: 25,
                                      bottom: 15,
                                    ),
                                    child: OutlineButton(
                                      child: new Text(
                                        "Close",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      onPressed: () {
                                        //    Navigator.of(context).pop();
                                        bottomNavIndex = 0;
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    Navigation()));
                                      },
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 0.5),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0)),
                                    )),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent[400],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    width: 110,
                                    height: 45,
                                    margin:
                                        EdgeInsets.only(top: 25, bottom: 15),
                                    child: OutlineButton(
                                        color: Colors.greenAccent[400],
                                        child: new Text(
                                          "Add Shop",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          goFirst = false;

                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      DispensaryRegisterPage()));
                                        },
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 0.5),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0))))
                              ])),
                    )
                  :_isLoading 
                      ? Center(
                        child:CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ))
                      : _showAddshop=="No"?
                            NestedScrollView(
                             physics: const AlwaysScrollableScrollPhysics(),
                              headerSliverBuilder: (BuildContext context,
                                  bool innerBoxIsScrolled) {
                                return <Widget>[
                                  Container(
                                    child: SliverAppBar(
                                      iconTheme: IconThemeData(
                                          color: Colors.white //Color(0xFF01D56A)
                                          ),
                                      backgroundColor: Colors.white,
                                      expandedHeight: 200.0,
                                      automaticallyImplyLeading: false,
                                      centerTitle: true,
                                      //floating: false,
                                      pinned: true,
                                      flexibleSpace: new FlexibleSpaceBar(
                                          centerTitle: true,
                                          title: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                           //     crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  //alignment: Alignment.bottomCenter,
                                               //   padding: EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    dispensaryData != null
                                                        ? '${dispensaryData['name']}'
                                                        : 'Shop Name',
                                                    //  '${widget.orderedItem.seller.name}',
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color:Color(0xFF01D56A),
                                                      fontSize: 19.0,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'sourcesanspro',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          ////////////////////Collapsed Bar/////////////////
                                          background: Container(
                                            //constraints: new BoxConstraints.expand(height: 256.0, ),
                                            alignment: Alignment.bottomLeft,
                                            padding: EdgeInsets.only(
                                                left: 16.0, bottom: 8.0),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                 //userData['img']==null? 
                                                 AssetImage(
                                                    'assets/images/shopBanner.jpg'),
                                                    //NetworkImage(proImage),
                                                colorFilter: new ColorFilter.mode(
                                                    Colors.black.withOpacity(0.5),
                                                    BlendMode.darken),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )

                                          ////////////////////Collapsed Bar  End/////////////////

                                          ),
                                    ),
                                  )
                                ];
                              },
                              body: RefreshIndicator(
                            onRefresh: _showshopReview,
                            child:SingleChildScrollView(
   physics: const AlwaysScrollableScrollPhysics(),

                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  //color: Colors.red,
                                  child: Column(
                                    children: <Widget>[
                                      ////////// Address /////////
                                      Card(
                                        elevation: 0.5,
                                        margin: EdgeInsets.only(
                                            bottom: 5,
                                            left: 10,
                                            right: 10,
                                            top: 25),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding:
                                              EdgeInsets.fromLTRB(12, 15, 15, 15),
                                          decoration: BoxDecoration(
                                             boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey[200],
                            // offset: Offset(1.0, 2.0),
                            blurRadius: 14.0,
                          ),
                        ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              shopContainer(
                                                  "User Name: ",
                                                  dispensaryData != null
                                                      ? '${userData['name']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Owner First Name: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['ownerNameFirst']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Owner Last Name: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['ownerNameLast']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                               shopContainer(
                                                  "Store's Hour: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['openingTime']}'+" to " + '${dispensaryData['closingTime']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "License Type: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['licenseType']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "License Number: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['license']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "License Expiration Date: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['licenseExpiration']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Delivery Fee: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['deliveryFee']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Yearly Revenue: ",
                                                  dispensaryData != null
                                                      ? '\$${dispensaryData['yearlyRevenue']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Store's Address: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['address']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Store's Latitude: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['lat']}'
                                                      : ''),
                                              Divider(color: Colors.grey),
                                              shopContainer(
                                                  "Store's Longitude: ",
                                                  dispensaryData != null
                                                      ? '${dispensaryData['lng']}'
                                                      : ''),
                                            ],
                                          ),
                                        ),
                                      ),

                                      store.state.reviewList.length > 0
                                          ? Card(
                                              elevation: 0.2,
                                              margin: EdgeInsets.only(
                                                  bottom: 5,
                                                  left: 10,
                                                  right: 10,
                                                  top: 10),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.fromLTRB(
                                                    12, 15, 15, 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                   boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey[200],
                            // offset: Offset(1.0, 2.0),
                            blurRadius: 14.0,
                          ),
                        ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5, top: 5),
                                                      child: Text(
                                                        "Reviews (${  store.state.reviewList.length})",
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: TextStyle(
                                                          color: Color(0xFF343434),
                                                          fontSize: 17.0,
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontFamily: 'MyriadPro',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                                                        Container(
                                             
                                               
                                                child: Container(
                        child:
                        
                      //   avgRate== null ?//? ratingData.avgRating == null:
                      //   Row(
                      //     children: <Widget>[
                      //       SmoothStarRating(
                      //       allowHalfRating: false,
                      //         onRatingChanged: null,
                      //         starCount: 5,
                      //         rating: 0,
                      //         size: 20.0,
                      //         color: Colors.yellow[700],
                      //         borderColor: Color(0xFF343434),
                      //         spacing:0.0
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.only(left: 10, top: 3),
                      //         child: Text(
                      //           "(0)",
                      //           textDirection: TextDirection.ltr,
                      //           style: TextStyle(
                      //             color: Colors.grey,
                      //             fontSize: 15.0,
                      //             decoration: TextDecoration.none,
                      //             fontFamily: 'MyriadPro',
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   )
                        
                      //  :
                        Row(
                          children: <Widget>[
                          //  SmoothStarRating(
                            // allowHalfRating: false,
                            //   onRatingChanged: null,
                            //   starCount: 5,
                            //   rating: avgRate[0].avgRating,//widget.item.avgRating.averageRating,
                            //   size: 20.0,
                            //   color: Colors.yellow[700],
                            //   borderColor:  Color(0xFF343434),
                            //   spacing:0.0
                            // ),
                            Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            ),
                            Container(
                            padding: EdgeInsets.only(left: 10, top: 3),
                            child: Text(
                             store.state.avgReview!=0?
                             store.state.avgReview.toStringAsFixed(2):
                            avgRate==null? "0": '${avgRate[0].avgRating}'==null?"": store.state.avgReview.toStringAsFixed(2),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                            color: Color(0xFF343434),
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'MyriadPro',
                            fontWeight: FontWeight.normal,
                            ),
                            ),
                            ),
                          ],
                        ),
                      ),),
                                                    Divider(color: Colors.grey),
                                                    Column(
                                                        children:
                                                            _showShopReview()),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ),):Container(),
        floatingActionButton: _dispensaryIsEmpty
            ? Container()
            : FloatingActionButton(
                child: Icon(Icons.edit, color: Colors.white),
                backgroundColor: Color(0xFF01d56a).withOpacity(0.8),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => EditShopPage()));
                },
              ),
      ),
    );
  }

  List<Widget> _showShopReview() {
    //print(store.state.data.reviews);

    List<Widget> list = [];

    for (var d in store.state.reviewList) {
      //  print(d.keyword);
      rating = d.rating;
      list.add(
        Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 3,top: 0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child:  Container(
                      width: 60,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10.0,top: 15),
                      child: ClipOval(
                        child: d.user.img==null?Image.asset(
                          'assets/images/camera.png',
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ):Image.network(
                          // "http://localhost:3333"+d.user.img,
                          "https://www.dynamyk.biz"+d.user.img,
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                   width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Text(
                      
                      '${d.user.name}' == null ? "" : '${d.user.name}',
               
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ), 

                    
                ],
              ),
            ), 
               Container(
                     
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      // d.content,
                      d.item==null || '${d.item.name}' == null ? " Product is not avaible now" : ' ${d.item.name}',
                      //"Welcome to www.lorem-ipsum.com. This site is provide as a service to our visitiors and may be used for informational legal obligations, please read them carefully",
                      textDirection: TextDirection.ltr,
                     
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 17.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   Container(
                   width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 8,bottom: 10,left: 5),
                    child: Text(
                      // d.content,
                      '${d.content}' == null ? "" : '${d.content}',
                      //"Welcome to www.lorem-ipsum.com. This site is provide as a service to our visitiors and may be used for informational legal obligations, please read them carefully",
                      textDirection: TextDirection.ltr,
                      
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
            Container(
                padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _showRating()),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                    child: Text(
                      // d.content,
                      '$rating' == null ? "" : '${rating * 20}%',
                      //"Welcome to www.lorem-ipsum.com. This site is provide as a service to our visitiors and may be used for informational legal obligations, please read them carefully",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color:Color(0xFF01d56a).withOpacity(0.8),
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return list;
  }

  List<Widget> _showRating() {
    //print(store.state.data.reviews);

    List<Widget> list = [];

    for (var i = 0; i < rating; i++) {
      // print(s);

      list.add(Row(
        children: <Widget>[
          Container(
            color: Color(0xFF01d56a).withOpacity(0.8),
            height: 10,
           
            width: MediaQuery.of(context).size.width / 5 - 25,
          ),
        ],
      ));
    }

    return list;
  }
}

//////
