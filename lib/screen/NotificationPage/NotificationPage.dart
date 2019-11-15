import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/JsonModel/NotificationDetailsModel/NotificationDetailsModel.dart';
import 'package:cannagrowdev/JsonModel/TotalNotificationModel/TotalNotificationModel.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

   var notificationData;
  bool _isLoading = false;

  @override
  void initState() {
  //  _updateNotification();
  //  print(store.state.notifiCheck);
   store.state.notifiCheck==true? _showNotification():null;
   print(store.state.notiList);
 // _showNotification();
    super.initState(); 
  }
void _updateNotification() async {
    var data = {};

    var res = await CallApi().postData(data, 'app/updateNoti');
    var body = json.decode(res.body);

    print(body);
   
  }
    Future <void> _showNotification() async {
   

   print("aiche");
   setState(() {
    _isLoading = true; 
   });

  var res = await CallApi().getData('app/getUnseenNotiDetails');
    var collection = json.decode(res.body);
    var notification = NotificationDetailsModel.fromJson(collection);
if (!mounted) return;
    setState(() {
       notificationData = notification.notification;
      
    });
     store.dispatch(NotificationCheck(false));
     store.dispatch(NotificationList(notificationData));
     
   //  print(store.state.notiList.length);
  
setState(() {
      _isLoading = false;
    });
 
  }

//   var notificationData;
//   bool _isLoading = true;
//    var totalNotifi;

//   @override
//   void initState() {
//     _updateNotification();
//     _showNotification();
//     _showNotificationNumber();
//     super.initState();
//   }


//     void _showNotificationNumber() async {
//     var res = await CallApi().getData('app/getUnseenNoti');
//     var collection = json.decode(res.body);
//     var totalOrder = TotalNotificationModel.fromJson(collection);
//     if (!mounted) return;

//     if (totalOrder.notification == null) {
//       setState(() {
//         totalNotifi = 0;
//       });
//     } else {
//       setState(() {
//         totalNotifi = totalOrder.notification.count;
//       });
//     }

//     if (totalNotifi > 0) {
//       _updateNotification();
//     }
//   }

//   void _updateNotification() async {
//     var data = {};

//     var res = await CallApi().postData(data, 'app/updateNoti');
//     var body = json.decode(res.body);

//     print(body);
    
//   }

//   void _showNotification() async {
    

//     var res = await CallApi().getData('app/getUnseenNotiDetails');
//     var collection = json.decode(res.body);
//     var notification = NotificationDetailsModel.fromJson(collection);

// if (!mounted) return;
//     setState(() {
//       notificationData = notification.notification;
//     });

//     setState(() {
//       _isLoading = false;
//     });
//     // print(notificationData.length);
//   }

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
        //  print("object");
          Navigator.of(context).pop();
         bottomNavIndex = 0;
                                        // Navigator.push(
                                        //     context,
                                        //     new MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Navigation()));
        },
       
      );
    },
  ), 
        title: Text(
          'Notification',
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
        top: false,
        child:  _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                  ),
                ):RefreshIndicator(
          onRefresh: _showNotification,
          child:Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          child:
                store.state.notiList==null || store.state.notiList.length<1
                  ? Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                        child: Text("You have no new notification"),
                        // decoration: new BoxDecoration(
                        //     shape: BoxShape.rectangle,
                        //     image: new DecorationImage(
                        //       fit: BoxFit.fill,
                        //       image:
                        //           new AssetImage('assets/images/noproduct.png'),
                        //     ))
                    ),
                      ),
                       ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                 )
                    ],
                  )
                  : SingleChildScrollView(
                     physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 10, bottom: 20),
                        child: // _isLoading?CircularProgressIndicator():

                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: _showOrder()),
                      ),
                    ),
        
        ),
        ),
      ),
    );
  }

  List<Widget> _showOrder() {
    List<Widget> list = [];
    // int checkIndex=0;
    for (var d in store.state.notiList) {
      // checkIndex = checkIndex+1;

      //print("seeen") ;
      //print(d.seen);
      //   print(d.status);

      list.add(NotificationCard(d));
    }

    return list;
  }
}

// RaisedButton(
//               onPressed: (){
//                 Navigator.push( context, SlideLeftRoute(page: ShopItemsPage()));
//               },
//               child: Text('Items'),
//             ),

class NotificationCard extends StatefulWidget {
  var data;
  NotificationCard(this.data);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool open = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

            widget.data.title =='Review Created'? bottomNavIndex = 4: bottomNavIndex = 2;

       print(widget.data.title);
       print(bottomNavIndex);
        Navigator.push(context, SlideLeftRoute(page: Navigation()));
       
      },
      child: Card(
        elevation: 0.2,
        margin: EdgeInsets.only(bottom: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
       decoration: BoxDecoration(
                                           boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[300],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),

          padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10.0),
                      child: ClipOval(
                        child: Image.asset(
                          widget.data.title =='Review Created'?'assets/images/review.jpg' :
                           widget.data.title =='Driver found'?'assets/images/driver_found.jpg':
                           widget.data.title =='Order Completed'?'assets/images/completed.jpg':
                            widget.data.title =='New Order'?'assets/images/new_order.jpg':
                          'assets/images/sign_in_cannagrow.png',
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                widget.data.title == null
                                    ? ""
                                    : widget.data.title,

                                //'Your Order Has been recived',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "sourcesanspro",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                widget.data.msg == null ? "" : widget.data.msg,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontFamily: "sourcesanspro",
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

