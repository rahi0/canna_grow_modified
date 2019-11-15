import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class OrderDetailsWidget extends StatefulWidget {
  final data;
  OrderDetailsWidget(this.data);
  @override
  _OrderDetailsWidgetState createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ////////////////Pic Name Price Slide Section Start////////////
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
                            image:widget.data.item==null || widget.data.item.img==null?
                                new AssetImage('assets/images/medicine_icon.PNG'):
                                NetworkImage("https://www.dynamyk.biz"+widget.data.item.img),
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
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width /
                                              3,
                                      child: Text(
                                        widget.data.item == null
                                            ? ""
                                            : "Product Name",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "DINPro",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                      widget.data.item==null ||  widget.data.item.name == null
                                            ? ""
                                            : ": " + widget.data.item.name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: "DINPro",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),

                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width /
                                              3,
                                      child: Text(
                                        widget.data.item == null
                                            ? "Product is not available now"
                                            : "Price",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "DINPro",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.data.item == null
                                            ? ""
                                            : ': \$ ${(widget.data.item.price).toStringAsFixed(2)}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: "DINPro",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),

                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width /
                                              3,
                                      child: Text(
                                        widget.data.item == null
                                            ? ""
                                            : "Ordered Quantity",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "DINPro",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.data.item == null
                                            ? ""
                                            : ': ${widget.data.quantity}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: "DINPro",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),
                            /////////////   title   /////////////
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   margin: EdgeInsets.only(top:10),
                            //   child: Text(
                            //     widget.data.item==null ?"Product is not available now":
                            //     "Product Name : "+ widget.data.item.name,
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         color: Colors.grey[600],
                            //         fontFamily: "DINPro",
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),

                            ////////////   price    ///////////////

                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   //color: Colors.green,
                            //   margin: EdgeInsets.only(top: 5),
                            //   child: Text(
                            //       widget.data.item==null ?"":
                            //     "Price : "+  '${widget.data.item.price}',
                            //  //   "Price : "+'${widget.data.item.price}',
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         color: Colors.grey[600],
                            //         fontFamily: "DINPro",
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),

                            ////////////   Quantity   ///////////////

                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   //color: Colors.green,
                            //   margin: EdgeInsets.only(top: 5),
                            //   child: Text(
                            //      widget.data.item==null ?"":
                            //     "Ordered Quantity : "+  '${widget.data.quantity}',
                            //    // "Ordered Quantity : "+'${widget.data.quantity}',
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         color: Colors.grey[600],
                            //         fontFamily: "DINPro",
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),

                            ////////////   Total Price    ///////////////
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ////////////////Pic Name Price Slide Section end////////////

                ////////////////Button Section end////////////
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 70),
          child: Divider(
  color: Colors.grey,
),
        )
       
      ],
    );
  }
}
