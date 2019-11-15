


import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class ShowShopInMap extends StatefulWidget {
  @override
  _ShowShopInMapState createState() => _ShowShopInMapState();
}

class _ShowShopInMapState extends State<ShowShopInMap> {


  double latitude;
  double longitude;
  
  double searchLat = 0;
  double searchLong = 0;
 

  var addresses;
  var first;
  String myAddress;
  String newAddress;

  String searchAddr;

  TextEditingController serchController = TextEditingController();

  Set<Marker> _markers = Set();
  Set<Polyline> _polylines = Set();
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();
 
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller); 
  }

  var allSeller;

  void initState() {
    _myLocation();
    _showAllSeller();
    
   

    
    super.initState();
  }

   void _showAllSeller() async {
    

  
    var res = await CallApi().getData('app/cannagrowAllSearch');
    var collection = json.decode(res.body);
    var allSellerDetails = ShopInfoModel.fromJson(collection);


  setState(() {
   allSeller  = allSellerDetails.shop;
  });

 


   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                markers: _markers,
                polylines: _polylines,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _initialPosition,
                // onCameraMove: ((_position) => _updatePosition(_position)),
              ),

              // RaisedButton(
              //   child: Text("data"),
              //   onPressed:() {
              //      _showpin();
              //   },
              // ),
                //  Container(
                // margin: EdgeInsets.only(top: 8.0),
                //    // height: 50.0,
                //     width:MediaQuery.of(context).size.width-60,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10.0),
                //         color: Colors.white),
                //     child: TextField(
                //       controller: serchController,
                //       decoration: InputDecoration( 
                //           hintText: 'Enter Address',

                          
                //           border: InputBorder.none,
                //           contentPadding:
                //               EdgeInsets.only(left: 15.0, top: 15.0),
                //           suffixIcon: IconButton(
                //               icon: Icon(Icons.search),
                //               color: Colors.deepOrangeAccent,
                //               onPressed: (){
                //                         _searchLocation();

                //               },
                //               iconSize: 30.0)),
                //       onChanged: (val) {
                //         setState(() {
                //           searchAddr = val;
                         
                //         });
                //       },
                //     ),
                //   ),


                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         Container( 
                          
                           height: 45,
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.only(left: 20, bottom: 10, right: 20),
                           child: FlatButton(
                           
                            color: Color(0xFF01D56A),
                            disabledColor: Colors.grey,
                                                onPressed: (){
                                                  _showpin();
                                                },

                            child: Text("Find Shop",
                            style: TextStyle(
                              color: Colors.white
                            ),),
                    ),
                         ),
                       ],
                     ),

           
             
            ],
          ),
        ),
      
    );
  }

  void _myLocation() async {
    GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;

    var coordinates = new Coordinates(latitude, longitude);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;

    controller.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 17));
    //setState(() {
      myAddress = first.addressLine;
      //_markers.clear();
      _markers.add(
        Marker(
         
          markerId: MarkerId('locationId'),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(title: "$myAddress"),
        ),
      );
    //});
  }


  Future<void> _searchLocation() async {
    try {
      addresses = await Geocoder.local.findAddressesFromQuery(searchAddr);
    } on Exception {
      addresses = null;
    }
    try {
      first = addresses.first;
    } on Exception {
      first = null;
    }

    searchLat = first.coordinates.latitude;
    searchLong = first.coordinates.longitude;

   
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(searchLat, searchLong),
        zoom: 17.0,
      ),
    ));
    setState(() {
      //_markers.clear();
      _polylines.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('searchId'),
          position: LatLng(searchLat, searchLong),
          infoWindow: InfoWindow(
              title: '$searchAddr',),
        ),
      );
    });

    serchController.text = "";
  }


  void _updatePosition(CameraPosition _position) async{

  
    Marker marker = _markers.firstWhere(
        (p) => p.markerId == MarkerId('marker_2'),
        orElse: () => null);
    _markers.remove(marker);
    _markers.add(
      Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
         infoWindow: InfoWindow(
              title: '${_position.target.latitude}', snippet: '${_position.target.longitude}'),
        draggable: true,
        //icon: _searchMarkerIcon,
      ),
    );
   setState(() {
     pickLatitude = _position.target.latitude;
     pickLongitude = _position.target.longitude;
   });
  }

  void _showpin() async {

    for(var d in allSeller){

     // var shopAddress;
    

       var coordinates = new Coordinates(d.lat, d.lng);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;

   
    
     var shopAddress = first.addressLine;
  //  GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(
  //       target: LatLng(24.9112692, 91.8499668),
  //       zoom: 17.0,
  //     ),
  //   ));

     var idd;

        setState(() {

      idd = d.lat.toString();
      });
      
      _markers.add(
        Marker(
          markerId: MarkerId(idd),
          position: LatLng(d.lat, d.lng),
          onTap: (){
             dialog(d.name,shopAddress);
          }
          // infoWindow: InfoWindow(
          //   title: '$shopAddress'
          //     ),
        ),
      );
   
    }


    

      
  }

  
    void dialog(String name, String shop) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: Column(
            children: <Widget>[
              Container(
                  width: 100,
                  height: 110,
                  decoration: new BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 5, color: Colors.blue[100]),
                        top: BorderSide(width: 5, color: Colors.blue[100]),
                        left: BorderSide(width: 5, color: Colors.blue[100]),
                        right: BorderSide(width: 5, color: Colors.blue[100]),
                      ),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/images/nen.jpg'),
                      ))),
            ],
          ),
          content: Container(
            padding: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
             height: 100,
            margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
          
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Shop Name : "+name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "grapheinpro-black",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Address : "+ shop,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "grapheinpro-black",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                          
                             
                            ],
                          ),
          
          ),
     
        );
        //return SearchAlert(duration);
      },
    );
  }


}
