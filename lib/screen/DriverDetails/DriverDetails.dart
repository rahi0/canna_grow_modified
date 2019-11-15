import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class DriverDetails extends StatefulWidget {

  var data;
  DriverDetails(this.data);

  @override
  _DriverDetailsState createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  bool _isLoading = false;
 
    String ratingText="";

    @override 
  void initState() {
    super.initState();

   // print(widget.data.status);
      _showtext();
  }


  void _showtext(){
      if( widget.data.driver.avgRating==null){
        ratingText = "No Rating Yet";
      }
     
      else if( widget.data.driver.avgRating.averageRating<=2.00){
        ratingText = "Poor";
      }
      else if( widget.data.driver.avgRating.averageRating<=3.00){
        ratingText = "Average";
      }
      else if(widget.data.driver.avgRating.averageRating<=4.00){
        ratingText = "Good";
      }
      else if( widget.data.driver.avgRating.averageRating<=5.00){
        ratingText = "Excellent";
      }
  }
  Container driverContainer(String label, String text) {
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
              textAlign: TextAlign.left,
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
        backgroundColor: Colors.grey[300],
        body: Center(
          child:

         _isLoading?
                  CircularProgressIndicator()
                  :
              Stack(
            children: <Widget>[
              Container(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        // iconTheme: IconThemeData(
                        //     color:
                        //         Colors.white //Color(0xFF01D56A)
                        //     ),
                        backgroundColor: Colors.greenAccent,
                        expandedHeight: 180.0,
                        automaticallyImplyLeading: false,
                        centerTitle: false,
                        //floating: false,
                        pinned: true,
                        leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Navigation()));
                            }),
                       
                        flexibleSpace: new FlexibleSpaceBar(

                           centerTitle: true,
                      title:  Container(
                        //color: Colors.red,
                      //  width: 200, 
                       // alignment: Alignment.center,
                        child: Text(
                        widget.data.driver.user.name==null?"": widget.data.driver.user.name,
                       //  widget.data.user.name==null?"":widget.data.user.name,
                                     overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'sourcesanspro',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                      ),
 
                            ////////////////////Collapsed Bar/////////////////
                               background: Container(
          child: Stack(
            children: <Widget>[
              Container(
                //constraints: new BoxConstraints.expand(height: 256.0, ),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                   image: AssetImage('assets/images/car.jpg'),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  //color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ///////// Shop Name //////////
                     
                      //////// Shop Name end/////////
                      

                      ///////// Open Close start //////////
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.white
                          )
                        ),
                        child: Text(
                                     ratingText,
                                     //overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'sourcesanspro',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                      ),
                      //////// Open Close  end/////////
                      

                      ///////// rating start //////////
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: <Widget>[
                            Icon(Icons.star,size: 15, color:Color(0xFF01D56A),),

                            Container(
                              margin: EdgeInsets.only(left: 3, right: 3),
                        child: Text(
                                    widget.data.driver.avgRating==null?"0":"${ widget.data.driver.avgRating.averageRating}",
                                     //overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'sourcesanspro',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                      ),



                          ],
                        ),
                      ),
                      //////// rating end/////////////
                    ],
                  ),
                ),
              )
            ],
          ),
        )

                            ////////////////////Collapsed Bar  End/////////////////

                            ),
                      )
                    ];
                  },
                   body: _isLoading?CircularProgressIndicator():
                  SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          ////////// Address /////////
                          Card(
                            elevation: 2,
                            margin: EdgeInsets.only(
                                bottom: 5, left: 10, right: 10, top: 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(12, 15, 15, 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                
                                  driverContainer("Car License: ", 
                                  "${widget.data.driver.license}"==null?"": "${widget.data.driver.license}",
                                
                                   ),

                                   Divider(color: Colors.grey),
                                  driverContainer("Car Model: ", 
                                   widget.data.driver.carModel==null?"": widget.data.driver.carModel,
                                
                                   ),
                                    Divider(color: Colors.grey),
                                  driverContainer("Car Brand: ", 
                                    widget.data.driver.carBrand==null?"": widget.data.driver.carBrand,
                                 
                                    ),
                               
                                  Divider(color: Colors.grey),
                                  driverContainer("Car Color: ", 
                                   widget.data.driver.carColor==null?"": widget.data.driver.carColor,
                                
                                   ),
                                  Divider(color: Colors.grey),
                                  driverContainer(
                                      "Car Plate No: ",
                                        "${widget.data.driver.carPlateNumber}"==null?"": "${widget.data.driver.carPlateNumber}",
                                      //carNumber==null?"":carNumber.toString()),
                                       //widget.data[0].carPlateNumber==null?"":widget.data[0].carPlateNumber.toString()
                                       ),

                                  // Divider(color: Colors.grey),
                                  //  driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  //  driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  //  driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  //   driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  //   driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  // driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  //   driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                  //   Divider(color: Colors.grey),
                                  //   driverContainer(
                                  //       "User Name: ","Name"
                                  //       ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 50, right: 50, top: 30),
                            padding: EdgeInsets.only(left: 5, right: 5),
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
                          //    width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: FlatButton(
                                child: Text(
                                  widget.data.status=="Completed"?'Back to Order':'Update Order Status',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'MyriadPro',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                color: Colors.transparent,
                                //elevation: 4.0,
                                //splashColor: Colors.blueGrey,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                                onPressed: () {
                                  Navigator.push(context,
                                      SlideLeftRoute(page: Navigation()));
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////
