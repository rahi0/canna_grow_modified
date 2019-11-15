import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class OrderDetails extends StatefulWidget {
  final data;

  OrderDetails(this.data);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool _isLoading = false;
  var driverData;
  var userData;
  var dispensaryData;
  // var orderData;
  var id;

  @override
  void initState() {
    _getUserInfo();

    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');

    var user = json.decode(userJson);
    var dispensary = json.decode(dispensaryJson);
    setState(() {
      userData = user;
      dispensaryData = dispensary;
    });
    print(dispensaryData['id']);
  }

  // void _showDeliveryRequest() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   var res = await CallApi().getData('app/indexSingleDriver/1');
  //   var collection = json.decode(res.body);
  //   var allDriver = DriverModel.fromJson(collection);

  //   setState(() {
  //     driverData = allDriver.driver;
  //     _isLoading = false;
  //   });

  //   // for(var d in driverData){
  //   //     print(d.user.name);
  //   // }

  // }

  bool _searchDriver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
         "Order Details",
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
      
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  //color: Colors.grey[300],
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _showOrderDetails()),
                ),
               widget.data.orderdetails.length>0? Container(
                     margin: EdgeInsets.only(bottom: 50, left: 10, right: 10),
                  padding: EdgeInsets.only(bottom: 12, left: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.data.commend == null
                        ? "No Special Message"
                        : ' Special Message: ${widget.data.commend}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF606060),
                        fontFamily: "DINPro",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ):Container(
                  alignment: Alignment.center,
                     margin: EdgeInsets.only(bottom: 50,right: 10),
                  padding: EdgeInsets.only(bottom: 12,),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                   "Product is not available now",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF606060),
                        fontFamily: "DINPro",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          //   isAccepted || isCancelled
          //   ? Container()
          //   :

          widget.data.status != "Pending"
              ? //'Order has been cancelled' ||  widget.data.status=='Order has been accepted'?
              Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.white,

                      width: MediaQuery.of(context).size.width,
                      //height: 90,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
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
                                      Icons.delete_sweep,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Deny',
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
                                  //cancelOrder();
                                  cancelOrderAlert();
                                },
                              )),
                          ///////////////// Add to cart Button  Start///////////////

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
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Accept',
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
                                  // isAccepted = true;
                                  acceptOrder();
                                  // _showDialog();
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => Navigation()));
                                },
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      )),
      floatingActionButton: widget.data.status == "Pending" ||
              widget.data.status == "Request for Driver" ||
              widget.data.status == "Order has been cancelled"
          ? Container()
          : Container(
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
              color: Color(0xFF01d56a).withOpacity(0.8),
            ),
             
              height: 35,
              margin: EdgeInsets.only(bottom: 20, right: 15),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: FlatButton(
                child: Text(
                  'View Driver',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontFamily: 'MyriadPro',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DriverDetails(widget.data)));
                },
              )),
    );
  }

  List<Widget> _showOrderDetails() {
    List<Widget> list = [];
    var len;

    for (var d in widget.data.orderdetails) {
      id = d.orderId;

      list.add(OrderDetailsWidget(d));
    }

    return list;
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          content: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
                height: 40,
                child: Text('Notify Driver for Delivery...',
                    style: TextStyle(color: Colors.black87, fontSize: 16))),
          ),
          actions: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  // width: 50,
                  // height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.greenAccent[400],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.done, size: 40, color: Colors.white),
                  ),
                  // decoration: new BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: new DecorationImage(
                  //       fit: BoxFit.fill,
                  //       image: new AssetImage('assets/images/checked.png'),
                  //     ))
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                      height: 40,
                      child: Text('Success! Driver Found',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                    height: 70,
                    width: 250,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
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
                                },
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.greenAccent[400],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              width: 110,
                              height: 45,
                              margin: EdgeInsets.only(top: 25, bottom: 15),
                              child: OutlineButton(
                                  color: Colors.greenAccent[400],
                                  child: new Text(
                                    "Confirm",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     new MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DriverDetails()));
                                  },
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 0.5),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0))))
                        ])),
              ],
            )
            ////////   driver available ////////////
          ],
        );
      },
    );
  }

  void cancelOrderAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: Text(
            "Are you sure want to cancel this order?",
            // textAlign: TextAlign.,
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
                            "No",
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
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
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              cancelOrder();
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Navigation()
                                      //  OrderRequest()
                                      ));
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

  void cancelOrder() async {
    var data = {
      'id': id,
      'status': 'Order has been cancelled', 

    

      'titleDriver': "New Order",
      'bodyDriver': "You have new order from ${userData['name']}",

      'titleBuyer': "Order Cancelled",
      'bodyBuyer': '${userData['name']}'+ "has cancelled order $id",
      
      'click_action': 'FLUTTER_NOTIFICATION_CLICK'
    };

    // var res = await CallApi().postData(data, 'app/update-order-status');
    var res = await CallApi().postData(data, 'app/sellerStatuschange');
    var body = json.decode(res.body);
    print(body);
  }

  void acceptOrder() async {
    var data = {
      'id': id,
      'status': 'Request for Driver',

      'titleBuyer': "Status Changed",
      'bodyBuyer': "Order $id is searching for driver",

      'titleDriver': "New Order",
      'bodyDriver': "You have new order from ${userData['name']}",

      'click_action': 'FLUTTER_NOTIFICATION_CLICK' //'''Order has been accepted', //'Request for Driver',
    };

    // var res = await CallApi().postData(data, 'app/update-order-status');
    var res = await CallApi().postData(data, 'app/sellerStatuschange');
    var body = json.decode(res.body);
    print(body);
  }
}
