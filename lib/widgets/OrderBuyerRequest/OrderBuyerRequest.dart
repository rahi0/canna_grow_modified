import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class OrderBuyerRequest extends StatefulWidget {
  final data;
  OrderBuyerRequest(this.data);
  @override
  _OrderBuyerRequestState createState() => _OrderBuyerRequestState();
}

class _OrderBuyerRequestState extends State<OrderBuyerRequest> {
  Color statusColor = Colors.grey;
  Color statusAcceptedColor = Colors.greenAccent[700];
  Color statusCancelColor = Colors.red[200];
  var sendorderId;
  bool _statusLoading = true;
  bool _firstShow = true;
  var statusData;
    var userData;
  var dispensaryData;

  var updatedStatus;

  @override
  void initState() {
    //print(widget.data.userId);
    //  _getStatus();

    for (var d in widget.data.orderdetails) {
      sendorderId = d.orderId;
    }

    _getAddress();
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

  var _updatedOption = [
    'Pending',
    //'Update order status',
    'Request for Driver',
    'Driver has accepted order',
    //'Order has been accepted',
    'Order is being prepared',
    'Driver is picking order',
    'Order is on the way',
    'Order has been cancelled',
    
    // 'Completed'
  ];
  var _currentupdatedOption ='Pending';// 'Update order status';
  void _getAddress() {
    if (widget.data.buyer.delLat == null || widget.data.buyer.delLong == null) {
      cancelOrder();
    }

    _getStatus();
  }

  void cancelOrder() async {
    var data = {
      'id': sendorderId,
      'status': 'Order has been cancelled',
      'title': "Order Cancelled",
      'body': '${userData['name']}'+ "has been cancelled order $sendorderId",
      'click_action': 'FLUTTER_NOTIFICATION_CLICK'
    };

    // var res = await CallApi().postData(data, 'app/update-order-status');
    var res = await CallApi().postData(data, 'app/sellerStatuschange');
    var body = json.decode(res.body);
    print(body);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
           boxShadow:[
                               BoxShadow(color:Colors.grey[200],
                               blurRadius: 16.0,
                               // offset: Offset(0.0,3.0)
                                )
                             
                             ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ////////////////Pic Name Price Slide Section Start////////////
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                widget.data.id==null?"":
                "# Order ID: "+ '${widget.data.id}',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.teal,
                    fontFamily: "DINPro",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              //color: Colors.red,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /////////// item image/////////

                  Container(
                    width: 90,
                    height: 90,
                    margin: EdgeInsets.only(right: 10),
                    decoration: new BoxDecoration( 
                      color: Colors.green,
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image:  widget.data.buyer.img==null?AssetImage('assets/images/camera.png'):
                         NetworkImage("https://www.dynamyk.biz"+widget.data.buyer.img),
                      ),
                    ),
                  ),

                  /////////// item image end/////////

                  ////////////// Details//////////////

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        /////////////   title   /////////////
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "Buyer Name",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "DINPro",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.data.buyer.name == null
                                        ? ""
                                        : ": " + widget.data.buyer.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                      color: Color(0xFF505050), 
                      fontFamily: "sourcesanspro",
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "Address",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "DINPro",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.data.buyer.delAddress == null
                                        ? ":No Address Given"
                                        : ": " + widget.data.buyer.delAddress,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                      color: Color(0xFF505050), 
                      fontFamily: "sourcesanspro",
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            )),

                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "Total Product",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "DINPro",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${widget.data.orderdetails.length}' == null
                                        ? ""
                                        : ': ${widget.data.orderdetails.length}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                      color: Color(0xFF505050), 
                      fontFamily: "sourcesanspro",
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            )),

                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "Total Price",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "DINPro",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${widget.data.price}' == null
                                        ? ""
                                        : ': \$ ${(widget.data.price).toStringAsFixed(2)}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                      color: Color(0xFF505050), 
                      fontFamily: "sourcesanspro",
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ////////////////Pic Name Price Slide Section end////////////

            ////////////////Button Section Start////////////
            Container(
              //color: Colors.yellow,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ////////////
                  widget.data.status == 'Pending' || 
                   widget.data.status == 'Request for Driver'
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                SlideLeftRoute(page: ReportPage(widget.data)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.5, color: Colors.red[300],),
                              ),
                            ),

                            ///////////////// "Report Issue"///////////////
                            child: Text(
                              "Report Issue",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.red[300],
                                  
                                  fontFamily: "sourcesanspro",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                  ///////////////// reorder Button///////////////
                  Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF01D56A).withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      height: 35,
                      // width: MediaQuery.of(context).size.width/2-20,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: FlatButton(
                        child: Text(
                          'View Order',
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
                                  builder: (context) =>
                                      OrderDetails(widget.data)));
                        },
                      )),
                ],
              ),
            ),

            ////////////////Button Section end////////////

            ////////  update///////////

            widget.data.status != 'Order has been cancelled' &&
                    widget.data.status != 'Completed' &&
                    widget.data.status !='driver map visible' 
                  //  && widget.data.status != 'Pending' //'Request for Driver'
                ? Container(
                  margin: EdgeInsets.only(top: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //widget.data.status == 'Order has been cancelled'?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Status :",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                        color: Color(0xFF343434),
                                      fontFamily: "standard-regular",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 40,
                                //width: MediaQuery.of(context).size.width/2,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    items: _updatedOption
                                        .map((String dropDownStringItem) {
                                      return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10),
                                            child: Text(
                                              dropDownStringItem,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily:
                                                      "standard-regular",
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w400),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (String newValueSelected) {
                                      _updatedOptionDropDownSelected(
                                          newValueSelected);
                                    },
                                    value: _currentupdatedOption,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  //   alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(top: 15),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.5,
                                            color: widget.data.status ==
                                                    'Order has been accepted'
                                                ? statusAcceptedColor
                                                : statusColor),
                                        top: BorderSide(
                                            width: 1.5,
                                            color: widget.data.status ==
                                                    'Order has been accepted'
                                                ? statusAcceptedColor
                                                : statusColor),
                                        left: BorderSide(
                                            width: 1.5,
                                            color: widget.data.status ==
                                                    'Order has been accepted'
                                                ? statusAcceptedColor
                                                : statusColor),
                                        right: BorderSide(
                                            width: 1.5,
                                            color: widget.data.status ==
                                                    'Order has been accepted'
                                                ? statusAcceptedColor
                                                : statusColor),
                                      ),
                                      shape: BoxShape.rectangle),
                                  child: widget.data.status ==
                                          'Order has been accepted'
                                      ? Text(
                                          widget.data.status == null
                                              ? ""
                                              : widget.data.status,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: statusAcceptedColor),
                                        )
                                      : Text(
                                          widget.data.status == null
                                              ? ""
                                              : widget.data.status,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: statusColor),
                                        )),
                            ],
                          ),
                        ]),
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                widget.data.status == 'Order has been cancelled' ||
                        widget.data.status == 'Completed' ||
                        widget.data.status == 'driver map visible'
                    ? Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.5,
                                  color: widget.data.status == 'Completed'
                                      ? statusAcceptedColor:widget.data.status == 'driver map visible'?Colors.grey
                                      : statusCancelColor),
                              top: BorderSide(
                                  width: 1.5,
                                  color: widget.data.status == 'Completed'
                                       ? statusAcceptedColor:widget.data.status == 'driver map visible'?Colors.grey
                                      : statusCancelColor),
                              left: BorderSide(
                                  width: 1.5,
                                  color: widget.data.status == 'Completed'
                                      ? statusAcceptedColor:widget.data.status == 'driver map visible'?Colors.grey
                                      : statusCancelColor),
                              right: BorderSide(
                                  width: 1.5,
                                  color: widget.data.status == 'Completed'
                                       ? statusAcceptedColor:widget.data.status == 'driver map visible'?Colors.grey
                                      : statusCancelColor),
                            ),
                            shape: BoxShape.rectangle),
                        child: Text(
                          widget.data.status == null ? "" : widget.data.status=="driver map visible"?"Order is on the way":widget.data.status,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                              color: widget.data.status == 'Completed'
                                   ? statusAcceptedColor:widget.data.status == 'driver map visible'?Colors.grey
                                  : statusCancelColor),
                        ))
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _updatedOptionDropDownSelected(String newValueSelected) async {
    if (newValueSelected == 'Order has been cancelled') {
      cancelOrderAlert(newValueSelected);
    } else {
      this._currentupdatedOption = newValueSelected;
      widget.data.status = _currentupdatedOption;
      _changeStatus();
    }
  }

  void _changeStatus() async {
    setState(() {
      _statusLoading = true;
    });

    var data = {
      'id': sendorderId,
      'status': _currentupdatedOption,
      
      'titleBuyer': "Status Changed",
      'bodyBuyer': "Order $sendorderId has been changed status to $_currentupdatedOption",

       'titleDriver': "New Order",
      'bodyDriver': "You have new order from ${userData['name']}",
      
      'click_action': 'FLUTTER_NOTIFICATION_CLICK'
    };

    // var res = await CallApi().postData(data, 'app/update-order-status');
    var res = await CallApi().postData(data, 'app/sellerStatuschange');
    var body = json.decode(res.body);
    print(data);
    print("body");
    print(body);

    if (body['success'] == true) {
      if (widget.data.status == 'Pending') {
       // widget.data.status = "No Status Updated";
        statusColor = Colors.grey;
      } else if (widget.data.status == 'Order has been accepted') {
        statusColor = statusAcceptedColor;
      } else if (widget.data.status == 'Order has been cancelled') {
        statusColor = statusCancelColor;
      } else {
        statusColor = Colors.grey;
      }
      setState(() {
        _statusLoading = false;
      });
    }
  }

  void _getStatus() {
    if (widget.data.status != 'Pending') {
      _currentupdatedOption = widget.data.status;
    }
  }

  void cancelOrderAlert(String updateStatus) {
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
                              setState(() {
                                this._currentupdatedOption = updateStatus;
                                widget.data.status = _currentupdatedOption;
                              });

                              //  print(_currentupdatedOption);
                              _changeStatus();
                              Navigator.of(context).pop();
                              // deleteItem();
                            },
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.5),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0))))
                  ])),
        );
      },
    );
  }
}
