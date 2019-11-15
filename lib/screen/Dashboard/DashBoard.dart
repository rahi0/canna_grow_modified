import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/JsonModel/TotalNotificationModel/TotalNotificationModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cannagrowdev/JsonModel/ShowOrderModel/ShowOrderModel.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Container dataContainer(String label, String data) {
      return Container(
          margin: EdgeInsets.only(bottom: 5,right: 5),
             decoration: BoxDecoration(
         // color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
          color:Colors.white,
         // color: Colors.red,
                     
                      
                          boxShadow:[
                         BoxShadow(color:Colors.grey[300],
                         blurRadius: 17,
                          //offset: Offset(0.0,3.0)
                          )
                       
                       ], 
                   
        ),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2-15,
        //color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      label,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          
                          fontFamily: "sourcesanspro",
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF00bb5d),
                    fontFamily: "DINPro",
                    fontSize: 22 ,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
  }

  @override
  void initState() {
    bottomNavIndex = 0;
    store.dispatch(ConnectionCheck(true));
      _getUserInfo();
  
  
    _showNewOrderNumber();
    
    super.initState();
  }

  bool _dispensaryIsEmpty = true;
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
    if (!mounted) return;
    setState(() {
      userData = user;
    });

    if (dispensary == null) {
      _dispensaryIsEmpty = true;
         _isLoading = true;
    } else {
      if (!mounted) return;
      setState(() {
        dispensaryData = dispensary;
        _dispensaryIsEmpty = false;

        // print(dispensaryData);
      });
      //  Timer.periodic(Duration(seconds: 5), (timer) {
   
      //    });
    //  store.state.orderDetails.length>0?null : _showOrderRequest();
     store.state.isHome ==true? null : _showOrderRequest();
  _showNumberOrder();
    }
 
  }

  bool _isLoading = false;
  var orderDetails;
  var processingOrder = 0;
  var pendingOrder = 0;
  var deliveredOrder = 0;
  var completedOrder = 0;
  var cancelledOrder = 0;
  var totalNotifi;
  double netPrice = 0.0;

  Future <void> _showOrderRequest() async {
   
    setState(() {
      _isLoading = true;
    });

    var res = await CallApi().getData('app/ordersSeller');
    var collection = json.decode(res.body);
    var allOrderRequest = ShowOrderModel.fromJson(collection);
     print(allOrderRequest);
    if (!mounted) return;
    setState(() {
      orderDetails = allOrderRequest.order;
      _isLoading = false;
    });

    store.dispatch(OrderDetailsInfo(orderDetails));
    store.dispatch(HomeCheck(true));
 _showNumberOrder();
  
  }


void _showNumberOrder(){
   processingOrder = 0;
    pendingOrder = 0;
   deliveredOrder = 0;
   completedOrder = 0;
   cancelledOrder = 0;
   netPrice = 0.0;



    if (store.state.orderDetails.length>0) {
      print("object");
      for (var d in store.state.orderDetails) {
        // print(d.price);
        if (d.status == 'Pending') {
         // setState(() {
            pendingOrder = pendingOrder + 1;
        //  });
        } else if (d.status == 'Order has been cancelled') {
        //  setState(() {
            cancelledOrder = cancelledOrder + 1;
         // });
        } else if (d.status == 'Completed') {
          if (!mounted) return;
        //  setState(() {
            netPrice += double.parse('${d.price}');
            completedOrder = completedOrder + 1;
         // });
        } else if (d.status == 'Order has been delivered') {
         // setState(() {
            deliveredOrder = deliveredOrder + 1;
         // });
        } else {
         // setState(() {
            processingOrder = processingOrder + 1;
        //  });
        }
      }
    }
}
  void _showNewOrderNumber() {
    if (!mounted) return;

    Timer.periodic(Duration(seconds: 5), (timer) {
    _showNotificationNumber();

     });

    setState(() {
      _isLoading = false;
    });
  }

  void _showNotificationNumber() async {
    var res = await CallApi().getData('app/getUnseenNoti');
    var collection = json.decode(res.body);
    var totalOrder = TotalNotificationModel.fromJson(collection);
   // if (!mounted) return;

    if (totalOrder.notification == null) {
       if (!mounted) return;
      setState(() {
        totalNotifi = 0;
      });
    } else {
      if (!mounted) return;
       setState(() {
        totalNotifi = totalOrder.notification.count;
      });
    }

   // if (totalNotifi > 0) {}

      if(totalOrder.notification.count>store.state.notificationCount){

          store.dispatch(NotificationCheck(true));

          print("HomePage soman na");
      }
     
     store.dispatch(NotificationCountAction(totalOrder.notification.count)); 


 
    print(totalNotifi);
    print(store.state.notificationCount);
  }

  void _updateNotification() async {


    
    //  if(totalNotifi>store.state.notificationCount){

          var data = {};

    var res = await CallApi().postData(data, 'app/updateNoti');
    var body = json.decode(res.body);

    print(body);
    print("update hpmepage body");
   // setState(() {
      _showNotificationNumber();
       
    //  }
   
   // });
  
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => NotificationPage()));
  
  }
  @override
  Widget build(BuildContext context) {
   // if (_dispensaryIsEmpty) {
      return Scaffold(
                backgroundColor: Color(0xFFFFFFFF),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                 // elevation: 0,
                  //centerTitle: false,
                
           //
              title: Text("CannaGrow",
        style: TextStyle(
          color:Color(0xFF01d56a),
          fontWeight: FontWeight.bold,
          fontSize: 25),),
                  actions: <Widget>[
                   _dispensaryIsEmpty?Container(): Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              //print(totalNotifi);
                              _updateNotification();
                              // Navigator.push(
                              //     context, SlideLeftRoute(page: NotificationPage()));
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                          totalNotifi == 0 || totalNotifi == null
                              ? Container()
                             :
                               Positioned(
                                  right: 3,
                                  top: 5,
                                  child: Container(
                                    alignment: Alignment.center,
                                    // height: 21,
                                    // width: 21,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFd20000),
                                      // shape: BoxShape.circle
                                        borderRadius:

                                            BorderRadius.circular(15)
                                            ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                          totalNotifi == 0 ? "" :totalNotifi>9?"9+": '$totalNotifi',
                                          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),
                                          ),
                                    ),
                                    //count
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: _isLoading ?_dispensaryIsEmpty?
                      Center(
            
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Please add your shop information from your profile tab to add product",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: "grapheinpro-black",
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.topLeft,
                        stops: [0.1, 0.4, 0.6, 0.9],
                        colors: [
                          Colors.greenAccent[400],
                          Colors.greenAccent[400],
                          Colors.tealAccent[400],
                          Colors.tealAccent[700],
                        ],
                      ),
                    ),
                    height: 35,
                    margin: EdgeInsets.only(top: 25, bottom: 15),
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
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0))))
              ],
            )):Center(child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ))
                      : RefreshIndicator(
                        onRefresh: _showOrderRequest,
                        child:SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(

                                // height: 700,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                          //height: 30,
                                          child: Text(
                                            'Net Balance',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontFamily: 'FontSpring',
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      Container(
                                       // width: 250,
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('\$ ',
                                                style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                               color: Color(0xFF00bb5d),)),
                                            Text(
                                                '${(netPrice).toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                 color: Color(0xFF00bb5d),)
                                                )
                                          ],
                                        ),
                                      ),
                                    ])),
                          Container(
                                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                                          child: Text(
                                            "Orders Overview",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "DINPro",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),

                           // Divider(color: Colors.grey),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      dataContainer('Processing Orders',
                                          processingOrder.toString()),
                                      dataContainer(
                                          'Pending Orders', pendingOrder.toString())
                                    ],
                                  ),
                                  
                            Row(
                              children: <Widget>[
                                dataContainer('Completed Orders',
                                    completedOrder.toString()),
                                dataContainer('Cancelled Orders',
                                    cancelledOrder.toString()),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                dataContainer(
                                    'Total Orders',
                                  store.state.orderDetails==null || store.state.orderDetails.length==0 ||  orderDetails == null
                                        ? "0"
                                        : '${store.state.orderDetails.length}')
                              ],
                            ),
                                ],
                              ),
                            ),


                          

                            Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.topLeft,
                                    stops: [0.1, 0.4, 0.6, 0.9],
                                    colors: [
                                      Colors.greenAccent[400],
                                      Colors.greenAccent[400],
                                      Colors.tealAccent[400],
                                      Colors.tealAccent[700],
                                    ],
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: FlatButton(
                                  disabledColor: Colors.grey,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                GraphPage(completedOrder)));
                                  },

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                      ),
                                      Container(
                                        //width: 150,
                                        //color: Colors.grey,
                                        child: Text(
                                          'Statistics',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'MyriadPro',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 90),
                                      // ),

                                      Container(
                                          //width: 80,
                                          // color: Colors.red,
                                          child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                        size: 30,
                                      ))
                                    ],
                                  ),
                                  color: Colors.transparent,
                                  //elevation: 4.0,
                                  //splashColor: Colors.blueGrey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0)),
                                )),
                          ],
                        )),
                ),
                ),
              );
    
  }
}
