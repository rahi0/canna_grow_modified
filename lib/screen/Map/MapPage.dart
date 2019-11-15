import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:http/http.dart' as http;
import 'package:cannagrowdev/JsonModel/SearchAddressModel/SearchAddressModel.dart';

double pickLatitude;
double pickLongitude;



class MapPage extends StatefulWidget {


 
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

 
  double latitude;
  double longitude;

  double searchLat=0;
  double searchLong=0;
  var searchStatus;
  var addresses;
  var first;
  String myAddress = '';
  String newAddress;

  String searchAddr;
  bool _isData= false;
  TextEditingController serchController = TextEditingController();

  Set<Marker> _markers = Set();
  Set<Polyline> _polylines = Set();
  CameraPosition _initialPosition=
      CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void initState() {
   
    _myLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
       // automaticallyImplyLeading: true,
    leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        color: Color(0xFF01d56a).withOpacity(0.8),
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () { 
              Navigator.of(context).pop();
         },
        
      );
    },
  ), 
        title: Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300]),
          child: TextField(
                  autofocus: false, 
                  
                  controller: serchController,
                  decoration: InputDecoration(
                      hintText: 'Search Address',
                    
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                      suffixIcon:  IconButton(
                  icon: Icon(Icons.search, color: Color(0xFF01d56a).withOpacity(0.8),),
                  onPressed: (){
                    _searchLocation();
                  },
                )
                          ),
                  onChanged: (val) {
                    setState(() {
                      searchAddr = val;
                    });
                  },
                ),
        ),

              // actions: <Widget>[
              //   IconButton(
              //     icon: Icon(Icons.search, color: Colors.grey),
              //     onPressed: (){
              //       _searchLocation();
              //     },
              //   )
              // ],
      ),
      body: //_isData?CircularProgressIndicator():
      SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              markers: _markers,
              polylines: _polylines,
              mapType: MapType.normal,
            //  myLocationEnabled: true,
            // myLocationButtonEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
              onCameraMove: ((_position) => _updatePosition(_position)),
            ),

           
               Container(
                 alignment: Alignment.topRight,
                 child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child:  IconButton(
                              icon: Icon(Icons.location_searching),
                              onPressed: () {
                               _myLocation();
                              },
                             ),
                  ),
               ),
           
               
          

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
                    onPressed: () {
                    
                      isVisitFirstTym ?
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => DispensaryRegisterPage())):
                               Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => EditShopPage()));


                     
                    },
                    child: Text(
                      "Pick this location",
                      style: TextStyle(color: Colors.white),
                    ),
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
    // latitude = 24.9112692;
    // longitude = 91.8499715;

    // var coordinates = new Coordinates(latitude, longitude);
    // addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // first = addresses.first;

    controller.moveCamera(
        CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 17));
    setState(() {
    // myAddress = first.addressLine;
    // //_markers.clear();
    _markers.add(
      Marker(

        markerId: MarkerId('locationId'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: "$myAddress"),
      ),
    );
    });
  }

  Future<void> _searchLocation() async {

 if(serchController.text.isEmpty){
     _showNotFoundMsg();
    }
    else{

 String url =
        "https://maps.google.com/maps/api/geocode/json?key=AIzaSyAiXNjJ3WpC-U-NKUPY66eQK471y1CiWTY&language=en_US&address=${serchController.text}";


    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var collection = json.decode(response.body);

    var addressData = SearchAddressModel.fromJson(collection);


  // searchStatus = addressData.status;

   if(addressData.status=="ZERO_RESULTS"){
     // print("object");
      _showNotFoundMsg();
    }

    else{

setState(() {
   searchLat= addressData.results[0].geometry.location.lat;
   searchLong = addressData.results[0].geometry.location.lng;
 
   });
    }

        
    ////////   use plugin ///////
    
    // try {
    //   addresses = await Geocoder.local.findAddressesFromQuery(searchAddr);
    // } on Exception {
    //   addresses = null;
    // }

    // if(addresses==null){
    //  // print("object");
    //   _showNotFoundMsg();
    // }

 ////////   use pliugin end ///////

    // if(searchStatus=="ZERO_RESULTS"){
    //  // print("object");
    //   _showNotFoundMsg();
    // }
   // else{



       ////////   use pliugin ///////

    //     first = addresses.first;

        
    // searchLat = first.coordinates.latitude;
    // searchLong = first.coordinates.longitude;

    ////////   use pliugin end ///////
  

    GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(searchLat, searchLong),
        zoom: 14.0,
      ),
    ));
    setState(() {
      _markers.clear();
      _polylines.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('searchId'),
          position: LatLng(searchLat, searchLong),
          infoWindow: InfoWindow(
            title: '$searchAddr',
          ),
        ),
      );
    });

    serchController.text = "";
    }
    
  //  }

  }

  void _updatePosition(CameraPosition _position) async {
    Marker marker = _markers.firstWhere(
        (p) => p.markerId == MarkerId('marker_2'),
        orElse: () => null);
    setState(() {
      _markers.remove(marker);
    });

    _markers.add(
      Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        // infoWindow: myAddress != ''
        //     ? InfoWindow(title: "$myAddress")
        //     : InfoWindow(
        //         title: '${_position.target.latitude}',
        //         snippet: '${_position.target.longitude}'),
        // infoWindow: InfoWindow(title: '${_position.target.latitude}',
        //         snippet: '${_position.target.longitude}'),
        draggable: true,
        //icon: _searchMarkerIcon,
      ),
    );
    setState(() {
      pickLatitude = _position.target.latitude;
      pickLongitude = _position.target.longitude;
    });

    
  }


    
    void _showNotFoundMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: 
              Text(
                                "Location not found",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "grapheinpro-black",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
              actions: <Widget>[
                Container(
               alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent[400],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              // width: MediaQuery.of(context).size.width/3,
                              height: 30,
                              margin: EdgeInsets.only(bottom: 15, right: 10),
                              child: OutlineButton(
                                  color: Colors.greenAccent[400],
                                  child: new Text(
                                    "Close",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    
                                 Navigator.of(context).pop();
                                  },
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 0.5),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0))))]

     
        );
      },
    );
  }


}
