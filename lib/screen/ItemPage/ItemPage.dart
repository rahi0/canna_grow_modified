import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/widgets/ItemSlide/ItemSlide.dart';



class ItemPage extends StatefulWidget {
  final item;
  ItemPage(this.item);
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool _isLoading = false;
  double rating =0.0;
    var itemId;
    var itemRating;
     var ratingData;
  var dispensaryData;
  bool _isRevLoading = true;

  bool _dispensaryIsEmpty = true;

  @override
  void initState() {
    _showSingleItem();
    
    _getitemRating();
    super.initState();
  }

  void _showSingleItem() async {
    setState(() {
      _isLoading = true;
    });

    store.dispatch(showSingleProductData(widget.item));
    print("image");
    print(store.state.data.img);

    setState(() {
      _isLoading = false;
    });
  }


  void _getitemRating() async{
     
    setState(() {
      _isLoading = true;
    });

    var res = await CallApi().getData('app/items/${widget.item.id}');
    var collection = json.decode(res.body);
    var itemRating = SingleItemModel.fromJson(collection);
   // print(allOrderRequest);
    
  if (!mounted) return;
    setState(() {
      ratingData = itemRating.item;
      _isLoading = false;
    });


if(ratingData!=null){
   if(ratingData.avgRating == null){
        rating = 0;
        return;
      } 
       if(ratingData.avgRating.averageRating is int){
      rating = ratingData.avgRating.averageRating.toDouble();
    
    
    }
    else{
       rating =ratingData.avgRating.averageRating;
    }
}


  }



  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(//"lo",
        //"Item",
        store.state.data==null ||  store.state.data.name==""?"Item":store.state.data.name,
          textAlign: TextAlign.right,
          style: TextStyle(
             color:Color(0xFF01d56a),
              fontFamily: "sourcesanspro",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),

         leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          color:Color(0xFF01d56a),
            //color:Colors.white
          ),
          onPressed: (){
               Navigator.push(
           context, new MaterialPageRoute(builder: (context) => Navigation()));

          },
        ),
      ),
        body: SafeArea(
                  child: Center(
      child: _isLoading
            ? CircularProgressIndicator(
              backgroundColor: Colors.green,
            )
            : Container(
               margin:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 60,top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                             // margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.center,
                              //color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20,top: 10),
                                    height:250,
                                        // MediaQuery.of(context).size.width /
                                        //     1.5,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                     
                                      image: DecorationImage(
                                          image:store.state.data==null ||store.state.data.img==null? AssetImage(
                                              'assets/images/medicine_icon.PNG'):
                                              NetworkImage("https://www.dynamyk.biz"+store.state.data.img),
                                          fit: BoxFit.cover),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.black38,
                                      //     offset: Offset(5.0, 2.5),
                                      //     blurRadius: 10.0,
                                      //   )
                                      // ],
                                    ),
                                  ),
                                  Container(
                                    //height: 40,

                                    //color: Colors.blue,
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ////////////////
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          //height: 20,
                                          //color: Colors.blue,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              // Container(
                                              //   margin: EdgeInsets.only(
                                              //       right: 10),
                                              //   width: 120,
                                              //   //height: 10,
                                              //   //color: Colors.yellow,
                                              //    child: Text(
                                              //     "Name:",
                                              //     textDirection:
                                              //         TextDirection.ltr,
                                              //     style: TextStyle(
                                              //       color: Colors.black,
                                              //       fontSize: 17.0,
                                              //       decoration:
                                              //           TextDecoration.none,
                                              //       fontFamily: 'MyriadPro',
                                              //       fontWeight:
                                              //           FontWeight.normal,
                                              //     ),
                                              //   ),
                                              // ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 20), 
                                                width: MediaQuery.of(context).size.width/2,
                                                //height: 10,
                                                //color: Colors.green,
                                                //alignment: Alignment.centerRight,
                                                child: Text(
                                                  // "store.state.allItemsData.name",
                                                 store.state.data==null || store.state.data.name==null?"":store.state.data.name,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'MyriadPro',
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                               Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width: 120,
                                                //height: 10,
                                                //color: Colors.green,
                                                //alignment: Alignment.centerRight,
                                                child: Text(
                                                store.state.data==null || '${store.state.data.price}'==null?"": "\$ ${(store.state.data.price).toStringAsFixed(2)}",
                                                  //"ll",
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Color(0xFF01d56a).withOpacity(0.8),
                                                    fontSize: 22.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'MyriadPro',
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

////////////////
                                        // Container(
                                        //   margin: EdgeInsets.only(bottom: 10),
                                        //   //height: 20,
                                        //   //color: Colors.blue,
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.start,
                                        //     children: <Widget>[
                                        //       // Container(
                                        //       //   margin: EdgeInsets.only(
                                        //       //       right: 10),
                                        //       //   width: 120,
                                        //       //   //height: 10,
                                        //       //   //color: Colors.yellow,
                                        //       //   child: Text(
                                        //       //     ":Price",
                                        //       //     textDirection:
                                        //       //         TextDirection.rtl,
                                        //       //     style: TextStyle(
                                        //       //       color: Colors.black,
                                        //       //       fontSize: 17.0,
                                        //       //       decoration:
                                        //       //           TextDecoration.none,
                                        //       //       fontFamily: 'MyriadPro',
                                        //       //       fontWeight:
                                        //       //           FontWeight.normal,
                                        //       //     ),
                                        //       //   ),
                                        //       // ),
                                             
                                        //     ],
                                        //   ),
                                        // ),

////////////////
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          //height: 20,
                                          //color: Colors.blue,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(left: 20,
                                                    right: 10),
                                               // width: 120,
                                                //height: 10,
                                                //color: Colors.yellow,
                                                child: Text(
                                                  "Quantity:",
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'MyriadPro',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width: 120,
                                                //height: 10,
                                                //color: Colors.green,
                                                //alignment: Alignment.centerRight,
                                                child: Text(
                                                  //"ll",
                                                 store.state.data==null || "${store.state.data.quantity}"==null?"": "${store.state.data.quantity}",
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'MyriadPro',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
////////////////
                                        // Container(
                                        //   margin: EdgeInsets.only(bottom: 20),
                                        //   //height: 20,
                                        //   //color: Colors.blue,
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.center,
                                        //     children: <Widget>[
                                        //       Container(
                                        //         margin: EdgeInsets.only(
                                        //             right: 10),
                                        //         width: 120,
                                        //         //height: 10,
                                        //         //color: Colors.yellow,
                                        //         child: Text(
                                        //           ":ETA",
                                        //           textDirection:
                                        //               TextDirection.rtl,
                                        //           style: TextStyle(
                                        //             color: Colors.black,
                                        //             fontSize: 17.0,
                                        //             decoration:
                                        //                 TextDecoration.none,
                                        //             fontFamily: 'MyriadPro',
                                        //             fontWeight:
                                        //                 FontWeight.normal,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Container(
                                        //         margin:
                                        //             EdgeInsets.only(left: 10),
                                        //         width: 120,
                                        //         //height: 10,
                                        //         //color: Colors.green,
                                        //         //alignment: Alignment.centerRight,
                                        //         child: Text(
                                        //           store.state.data.eta,
                                        //           textDirection:
                                        //               TextDirection.ltr,
                                        //           style: TextStyle(
                                        //             color: Colors.black,
                                        //             fontSize: 17.0,
                                        //             decoration:
                                        //                 TextDecoration.none,
                                        //             fontFamily: 'MyriadPro',
                                        //             fontWeight:
                                        //                 FontWeight.normal,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

////////////////
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20,left: 10),
                                          //height: 20,
                                          //color: Colors.blue,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              // Container(
                                              //   margin: EdgeInsets.only(
                                              //       right: 10,left: 20),
                                              // //  width: 120,
                                              //   //height: 10,
                                              //   //color: Colors.yellow,
                                              //   child: Text(
                                              //     "Rating:",
                                              //     textDirection:
                                              //         TextDirection.ltr,
                                              //     style: TextStyle(
                                              //       color: Colors.black,
                                              //       fontSize: 17.0,
                                              //       decoration:
                                              //           TextDecoration.none,
                                              //       fontFamily: 'MyriadPro',
                                              //       fontWeight:
                                              //           FontWeight.normal,
                                              //     ),
                                              //   ),
                                              // ),

                                               Container(
                                          margin: EdgeInsets.only(left: 10),
                                          //width: 120,
                                          //height: 10,
                                          //color: Colors.green,
                                          //alignment: Alignment.centerRight,
                                          child: Container(
                child:ratingData== null ?//? ratingData.avgRating == null:
                Row(
                  children: <Widget>[
                SmoothStarRating(
                allowHalfRating: false,
                  onRatingChanged: null,
                  starCount: 5,
                  rating: 0,
                  size: 20.0,
                  color: Colors.yellow[700],
                  borderColor: Colors.green,
                  spacing:0.0
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 3),
                  child: Text(
                    "(0)",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'MyriadPro',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                  ],
                )
                
               :
                Row(
                  children: <Widget>[
                SmoothStarRating(
                allowHalfRating: false,
                  onRatingChanged: null,
                  starCount: 5,
                  rating: rating,//widget.item.avgRating.averageRating,
                  size: 20.0,
                  color: Colors.yellow[700],
                  borderColor: Color(0xFF343434),
                  spacing:0.0
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 3),
                  child: Text(
                  ratingData==null? "(0)": '${ratingData.totalrev.total}'==null?"": "(${ratingData.totalrev.total})",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.grey,
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
                                         
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

/////////////////
                                  Container(
                                    //color: Colors.yellow,
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.only(bottom: 15, top: 15),
                                    padding:
                                        EdgeInsets.only(left: 20,),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Description",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Color(0xFF343434),
                                            fontSize: 20.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'MyriadPro',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          width: MediaQuery.of(context).size.width,
                                          //color: Colors.green,
                                          child: Text(
                                          
                                           store.state.data.description==null?"": store.state.data.description,
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.black54,
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
                            ),

                          ratingData==null ? Container():ratingData.totalrev.total==0?
                            Container():Container(
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(bottom: 15, top: 15),
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.only(bottom: 20),
                                       child: Text(
                "Reviews",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Color(0xFF343434),
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'MyriadPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
                                     ),

              Column(children: _showReview()),
                                ],
                              ),
                              //child: Column(children: _showReview()),
                            )

                            // )
                          ],
                        ),
                      ),
                    ),

                    /////////////////////////Button Stack////////////////

                    Container(
                      // color: Colors.red,
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                           // height: 200,
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ///////prev button/////
                                Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF01d56a).withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(40)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(5.0, 2.5),
                                          blurRadius: 10.0,
                                        )
                                      ],
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        int itemIndex = 0, index;
                                       
                                        for (var d in store.state.allItemsData) {
                                          if (d.id == store.state.data.id) {
                                            setState(() {
                                              index = itemIndex;
                                            });

                                            break;
                                          } else {
                                            itemIndex++;
                                          }
                                        }

                                        if (index == 0) {
                                        } else {
                                          Navigator.push(
                                              context,
                                              SlideLeftRoute(
                                                  page: 
                                                    ItemSlide(store.state.allItemsData[index-1],
                                                  store.state.allItemsData.length)
                                                  // ItemPage(store
                                                  //         .state.allItemsData[index - 1])
                                                          ));
                                        }
                                      },
                                    )),

                                ///////prev button end/////

                                /////next button/////

                                Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF01d56a).withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(40)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(2.5, 5),
                                          blurRadius: 10.0,
                                        )
                                      ],
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        int itemIndex = 0, index;
                                      
                                        for (var d in store.state.allItemsData) {
                                          itemIndex++;
                                          if (d.id == store.state.data.id) {
                                            setState(() {
                                              index = itemIndex;
                                            });
                                          }
                                        }

                                        if (index ==  store.state.allItemsData.length) {
                                        } else {
                                          Navigator.push(
                                              context,
                                              SlideRightRoute(
                                                  page: ItemSlide(store.state.allItemsData[index],
                                                  store.state.allItemsData.length)
                                                  //     .allItemsData[index])
                                                  // ItemPage(store.state
                                                  //     .allItemsData[index])
                                                      ));
                                        }
                                      },
                                    )),

                                ///////next button end/////
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: 90,
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                           
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector( 
                                  onTap: () {
                                   deleteItemAlert();
                                  },
                                  child: Container(
                                    //padding: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: <Widget>[
                                         Icon(
                                          Icons.delete,
                                            color:  Colors.red,
                                        ),
                                        Text(
                                          'Delete',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color:  Colors.red,
                                            fontSize: 20.0,
                                           // decoration: TextDecoration.underline,
                                            fontFamily: 'MyriadPro',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                       
                                      ],
                                    ),
                                    //color: Colors.red,
                                  ),
                                ),

                                    GestureDetector( 
                                  onTap: () {
                                     Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditItemPage()));
                                  },
                                  child: Container(
                                    //padding: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: <Widget>[
                                         Icon(
                                          Icons.edit,
                                            color:  Colors.black,
                                        ),
                                        Text(
                                          'Edit',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                           // decoration: TextDecoration.underline,
                                            fontFamily: 'MyriadPro',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //color: Colors.red,
                                  ),
                                ),

//                                     ///////////////// Edit Button  Start///////////////
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(50),
//                                         color: Colors.greenAccent[400]
//                                       ),
//                                       child: IconButton(
//                                        onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   new MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           EditItemPage()));
//                                             },
//                                       icon: Icon(
//                                         Icons.edit,
//                                         color:Colors.white,
                                    
//                                       ),
//                                       ),
//                                     ),


//  ///////////////// Edit Button  Start///////////////
//                                     Container(
//                                        decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(50),
//                                         color: Colors.greenAccent[400]
//                                       ),
//                                       child: IconButton(
//                                        onPressed: () {
//                                              deleteItemAlert();
//                                             },
//                                       icon: Icon(
//                                         Icons.delete,
//                                         color:Colors.white,
                                    
//                                       ),
//                                       ),
//                                     ),
                                // Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.greenAccent[400],
                                //       borderRadius: BorderRadius.all(
                                //           Radius.circular(20.0)),
                                //     ),
                                //     //width: 150,
                                //     height: 45,
                                //     child: FlatButton(
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceAround,
                                //         children: <Widget>[
                                //           // Icon(
                                //           //   Icons.edit,
                                //           //   color: Colors.white,
                                //           // ),

                                //              Container(
                                //             margin: EdgeInsets.only(left: 5),
                                //             child: Text(
                                //               'Edit /',
                                //               textDirection:
                                //                   TextDirection.ltr,
                                //               style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 17.0,
                                //                 decoration:
                                //                     TextDecoration.none,
                                //                 fontFamily: 'MyriadPro',
                                //                 fontWeight: FontWeight.normal,
                                //               ),
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(left: 5),
                                //             child: Text(
                                //               'Delete',
                                //               textDirection:
                                //                   TextDirection.ltr,
                                //               style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 17.0,
                                //                 decoration:
                                //                     TextDecoration.none,
                                //                 fontFamily: 'MyriadPro',
                                //                 fontWeight: FontWeight.normal,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       color: Colors.transparent,
                                //       // elevation: 4.0,
                                //       //splashColor: Colors.blueGrey,
                                //       shape: new RoundedRectangleBorder(
                                //           borderRadius:
                                //               new BorderRadius.circular(
                                //                   20.0)),
                                //       onPressed: () {
                                //         Navigator.push(
                                //             context,
                                //             new MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     EditItemPage()));
                                //       },
                                //     )),

                                ///////////////// Add to cart Button  End///////////////
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
    ),
        )
        );
  }

  List<Widget> _showReview() {
    //print(store.state.data.reviews);

    List<Widget> list = [];

    for (var d in store.state.data.reviews) {
      //  print(d.keyword);
      

      list.add(
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: Icon(Icons.arrow_right),
              // ),
               SmoothStarRating(
                    allowHalfRating: false,
                      onRatingChanged: null,
                      starCount: 5,
                      rating: d.rating.toDouble(),//widget.item.avgRating.averageRating,
                      size: 20.0,
                      color: Colors.yellow[700],
                      borderColor: Color(0xFF707070),
                      spacing:0.0
                    ),
                     SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  d.content==null?"":'${d.content}',
               
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
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
      );
    }

    return list;
  }

  void deleteItemAlert(){

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: 
              Text(
                                "Are you sure want to delete this product?",
                               // textAlign: TextAlign.,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "grapheinpro-black",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),

                              content:    Container(
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
                                    "Yes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    
                                    deleteItem();
                                  },
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 0.5),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0))))
                        ])),
            
        );
        //return SearchAlert(duration);
      },
    );
  }
  void deleteItem() async {
    var data = {
      'id': '${store.state.data.id}',
    };

    var res = await CallApi().postData(data, 'app/itemsDelete');
    var body = json.decode(res.body);

    if (body['success'] == true) {

     
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Navigation()));
    } 
  }
}
