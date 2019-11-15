import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart' as prefix0;
import 'package:cannagrowdev/widgets/ItemSlide/ItemSlide.dart';

class ShowProduct extends StatefulWidget {
  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  bool _isLoading = false;
  String _showAddProduct = "";
  bool _dispensaryIsEmpty = true;
  var len;
  Color header = Colors.red;

  @override
  void initState() {
    store.dispatch(ConnectionCheck(true));
  
    _getUserInfo();
    bottomNavIndex = 1;
    super.initState();
  }

  var userData;
  var dispensaryData;

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
      _dispensaryIsEmpty = true;
      _showAddProduct = "Yes";
    } else {
      setState(() {
        dispensaryData = dispensary;
        _dispensaryIsEmpty = false;
         _showAddProduct = "No";
        //  print(dispensaryData);
      });
    //  store.state.allItemsData.length>0?null : _showAllProducts();
     store.state.isProduct==true?null : _showAllProducts();
      //    if(dispensaryData['name']=="" && dispensaryData['yearlyRevenue']==""
      //  && dispensaryData['license']=="" && dispensaryData['licenseExpiration']=="" &&
      //  dispensaryData['licenseType']=="" && dispensaryData['deliver']==""
      //  && dispensaryData['sharingInventory']=="" && dispensaryData['RecreationalOrMedicinal']=="" &&
      //  dispensaryData['address']=="" && dispensaryData['deliveryFee']==""
      //  && dispensaryData['lat']=="" && dispensaryData['lng']=="" &&
      //   dispensaryData['growerType']=="")
      //  {
      //       setState(() {
      //        _dispensaryIsEmpty = true;
      //       });
      //  }
    }
  }

  Future <void> _showAllProducts() async {
    setState(() {
      _isLoading = true;
    });

    print("object");
 //   print(store.state.isProduct);
    var res = await CallApi().getData('app/items');
    var collection = json.decode(res.body);
    var allProductItems = ShowProductJson.fromJson(collection);

    store.dispatch(ShowItem(allProductItems.allItems));
      store.dispatch(ProductCheck(true));
     // print(store.state.isProduct);
if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Products',
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Color(0xFF01d56a).withOpacity(0.8),
              fontFamily: "sourcesanspro",
             // fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child:  
              _isLoading
                  ?_dispensaryIsEmpty //&& _showAddProduct=="Yes"
              ? Center(
                child:Container(
                  width: 100,
                  height: 110,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/images/noproduct.png'),
                      ))))
              : Center(
                child:CircularProgressIndicator(
                    backgroundColor: Colors.green,
                  ))
                  : 
                 // _showAddProduct=="No"? 
                  OrientationBuilder(builder: (context, orientation) {
                          return RefreshIndicator(
                            onRefresh: _showAllProducts,
                            child: store.state.allItemsData.length <1
                      ?Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                                width: 100,
                                height: 110,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,  
                                    image: new DecorationImage(
                                      fit: BoxFit.fill, 
                                      image: new AssetImage(
                                          'assets/images/noproduct.png'),
                                    ))
                                    ),
                          ),
                                  ListView(
                     physics: const AlwaysScrollableScrollPhysics(),
                  )
                        ],
                      )
                      : CustomScrollView(


                        physics: const AlwaysScrollableScrollPhysics(),
                                primary: false,
                                
                                slivers: <Widget>[
                                  SliverPadding(
                                      padding: const EdgeInsets.all(8.0),
                                      sliver: SliverGrid.count(
                                          //   crossAxisSpacing: 10.0,
                                          childAspectRatio:
                                              (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2.5),
                                          crossAxisCount: 2,
                                          children: orientation ==
                                                  Orientation.portrait
                                              ? _showPortraitLists()
                                              : _showLandscapeLists())),
                                ]),
                          );
                        }),
                        //:Container(),
        ),




      floatingActionButton: FloatingActionButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add, color: Colors.white),
          ],
        ),

        // child: new Icon(Icons.add,
        // color: Colors.white
        // ),
        backgroundColor: Color(0xFF01d56a).withOpacity(0.8),

        onPressed: () {
          _dispensaryIsEmpty
              ? _showHintMsg()
              : Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => ShopPage()));
        },
      ),
    );
  }

  List<Widget> _showPortraitLists() {
    var totalItem;
    totalItem = store.state.allItemsData.length;

    List<Widget> list = [];

    for (var d in store.state.allItemsData) {
      list.add(GestureDetector(
        onTap: () {
          //  print(totalItem);
          Navigator.push(context, SlideLeftRoute(page: ItemPage(d)));
          // Navigator.push(
          //     context, SlideLeftRoute(page: ItemSlide(d, totalItem)));
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 0, top: 5, left: 2.5, right: 2.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              //border: Border.all(width: 0.5, color: Colors.grey),
              boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 16.0,
                  ),
                ],
            ),
            child: GridTile(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: <Widget>[
                        Center(
                          child: Container(
                          
                            margin: EdgeInsets.only(top: 40,bottom: 10),
                            child:ClipOval(
                                                          child: d.img==null? Image.asset('assets/images/medicine_icon.PNG',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                  )
                                  :Image.network("https://www.dynamyk.biz"+d.img,
                                  height: 100,
                                  width: 100,
                                   fit: BoxFit.fill,),
                            ), 
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            padding:
                                EdgeInsets.only(left: 15, bottom: 5, top: 5),
                            child: Text(
                              '${d.price}' == null
                                  ? ""
                                  : '\$ ${(d.price).toStringAsFixed(2)}',//.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Colors.greenAccent[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ))
                      ]),
                    ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(d.name == null ? "" : d.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      d.description == null ? "" : d.description,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text(
                              d.reviews == null
                                  ? ""
                                  : " (" + d.reviews.length.toString() + ")",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }

    return list;
  }

  List<Widget> _showLandscapeLists() {
    var totalItem;
    totalItem = store.state.allItemsData.length;

    List<Widget> list = [];

    for (var d in store.state.allItemsData) {
      list.add(GestureDetector(
        onTap: () {
          print(totalItem);
          // Navigator.push(context, SlideLeftRoute(page: ItemPage(d)));
          Navigator.push(
              context, SlideLeftRoute(page: ItemSlide(d, totalItem)));
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 0, top: 5, left: 2.5, right: 2.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              //border: Border.all(width: 0.5, color: Colors.grey),
               boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
            ),
            child: GridTile(
              child: Container(
                //width: 100,
                padding: EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        //height: 150,
                        child: Container(
                      child: Stack(children: <Widget>[
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            margin: EdgeInsets.only(top: 5),
                            child: ClipOval(
                                                          child: d.img==null?Image.asset(
                                'assets/images/medicine_icon.PNG',
                                height: 100,
                                width: 100,
                                 fit: BoxFit.fill,
                              ):
                              Image.network(
                                "https://www.dynamyk.biz"+d.img,
                                height: 100,
                                width: 100,
                                  fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )),
                    VerticalDivider(
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 3),
                                          child: Text(
                                              d.name == null ? "" : d.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0, left: 6),
                                child: Text(
                                  '${d.price}' == null
                                      ? ""
                                      : ' \$ ${(d.price).toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF01d56a).withOpacity(0.8),
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                
                                margin: EdgeInsets.only(top: 5, left: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 8, top: 0, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 3),
                                                child: Text(
                                                    d.description == null
                                                        ? ""
                                                        : d.description,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                //color: Colors.red,
                                padding: EdgeInsets.only(bottom: 10),
                                margin: EdgeInsets.only(
                                    right: 8, top: 0, bottom: 0, left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 3),
                                      child: Text(
                                          d.reviews == null
                                              ? ""
                                              : " (" +
                                                  d.reviews.length.toString() +
                                                  ")",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    }

    return list;
  }

  void _showHintMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: Text(
            "Please add your shop information from your profile tab to add product",
            // textAlign: TextAlign.justify,
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                            Navigator.of(context).pop();
                            //   Navigator.push(
                            //                   context,
                            //                   new MaterialPageRoute(
                            //                       builder: (context) =>
                            //                           Navigation()));
                          },
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        )),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        width: 110,
                        height: 45,
                        margin: EdgeInsets.only(top: 25, bottom: 15),
                        child: OutlineButton(
                            color: Colors.greenAccent[400],
                            child: new Text(
                              "Add Shop",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              goFirst = false;

                            Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          DispensaryRegisterPage()));
                            },
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.5),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0))))
                  ])),
        );
        //return SearchAlert(duration);
      },
    );
  }
}

