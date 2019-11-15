import 'package:cannagrowdev/BottomApp/bottomApp.dart';
import 'package:cannagrowdev/ImagePicker/image_picker_handler.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
import 'package:cannagrowdev/widgets/ProfilePhoto/profilePhoto.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

bool visitSettings = false;
String shopNameEdit = "";
String licenseEdit = "";
String firstNameEdit = "";
String lastNameEdit = "";
String revenueEdit = "";
//String addressEdit = "";
var licenseDateEdit = "";
var deliveryFeeEdit;
var dispensaryLicenseTypeEdit = "License Types";
var openEdit = "00 AM";
var closeEdit = "00 PM";
var dispensaryTypeEdit = "Dispensary Types";
int deliveryEdit;
int shareEdit;
int globalEditshop = 1;
bool _isDelivery=false;

class EditShopForm extends StatefulWidget {
  @override
  _EditShopFormState createState() => _EditShopFormState();
}

class _EditShopFormState extends State<EditShopForm> {

  
   String date;

 DateTime selectedDate = DateTime.now();
 var format;


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
     //  locale: Locale("yyyy-MM-dd"),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
     date = "${DateFormat("yyyy - MMMM - dd").format(selectedDate)}"; 
      });
  }
  var _growerradioValue1 = -1;
  var _growerradioValue2 = -2;


  bool _visitMap = false;

  var userLat;
  var userLng;
  var userAddress;
  double latitude;
  double longitude;

  int count;

  bool _isSelected = false;

  String _checkRadio1;
  String _checkRadio2;
  var _openTime = [
    '00 AM',
    '01 AM',
    '02 AM',
    '03 AM',
    '04 AM',
    '05 AM',
    '06 AM',
    '07 AM',
    '08 AM',
    '09 AM',
    '10 AM',
    '11 AM',
    '12 AM',
    '01 PM',
    '02 PM',
    '03 PM',
    '04 PM',
    '05 PM',
    '06 PM',
    '07 PM',
    '08 PM',
    '09 PM',
    '10 PM',
    '11 PM',
    '12 PM'
  ];

  var _closeTime = [
    '00 PM',
    '01 PM',
    '02 PM',
    '03 PM',
    '04 PM',
    '05 PM',
    '06 PM',
    '07 PM',
    '08 PM',
    '09 PM',
    '10 PM',
    '11 PM',
    '12 PM',
    '01 AM',
    '02 AM',
    '03 AM',
    '04 AM',
    '05 AM',
    '06 AM',
    '07 AM',
    '08 AM',
    '09 AM',
    '10 AM',
    '11 AM',
    '12 AM',
  ];
   var _currentOpenTime = '00 AM';
  var _currentCloseTime = '00 PM';
  var _license = [
    'License Types',
    'Retailer',
    'Retailer Storefront',
    'Distributor',
    'Distributor-Transport Only',
    'Microbusiness'
  ];
  var _currentLicense = 'License Types';

  var _dispensarygrow = [
    'Dispensary Types',
    'Recreational',
    'Medicina',
    'Both',
    'None',
    'Other'
  ];
  var _dispensarycurrentGrow = 'Dispensary Types';

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  File _image;
  AnimationController _controller;
  //ImagePickerHandler imagePicker;

  var userData;
  var dispensaryData;

  bool _isLoading = false;

  TextEditingController shopNameController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
 // TextEditingController licenseExpirationController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController revenueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController delivaryFeeController = TextEditingController();

  bool _dispensaryIsEmpty = true;

  @override
  void initState() {
      format = DateFormat("yyyy-MM-dd").format(selectedDate);
    
    _getProfileInfo();
    super.initState();
  }

  void _getProfileInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');

    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
    if (dispensaryJson == null) {
      _dispensaryIsEmpty = true;
    } else {
      var dispensary = json.decode(dispensaryJson);
      setState(() {
        dispensaryData = dispensary;
        _dispensaryIsEmpty = false;
   
      shopNameController.text = '${dispensaryData['name']}';
      _currentOpenTime =dispensaryData['openingTime']==null?'00 AM':'${dispensaryData['openingTime']}';
      _currentCloseTime =dispensaryData['closingTime']==null?'00 PM':'${dispensaryData['closingTime']}';
      licenseController.text = '${dispensaryData['license']}';
     // licenseExpirationController.text =
         date= '${dispensaryData['licenseExpiration']}';
      revenueController.text = '${dispensaryData['yearlyRevenue']}';
      firstNameController.text = '${dispensaryData['ownerNameFirst']}';
      lastNameController.text = '${dispensaryData['ownerNameLast']}';
      userAddress = '${dispensaryData['address']}';
      delivaryFeeController.text = '${dispensaryData['deliveryFee']}';
      userLat = '${dispensaryData['lat']}';
      userLng = '${dispensaryData['lng']}';
      _currentLicense = '${dispensaryData['licenseType']}';
      _dispensarycurrentGrow = '${dispensaryData['RecreationalOrMedicinal']}';
      
      _checkRadio1 = '${dispensaryData['deliver']}';
      _checkRadio2 = '${dispensaryData['sharingInventory']}';

      _checkRadio1 == "Yes" ?  _growerradioValue1 = 1 : _growerradioValue1 = 0;
      _checkRadio2 == "Yes" ? _growerradioValue2 = 1 : _growerradioValue2 = 0;
     date ='${dispensaryData['licenseExpiration']}'!= null ? '${dispensaryData['licenseExpiration']}' : '';

      print(dispensaryData);
   });

      if (globalEditshop == 0) {

        
        _getprevData();
        userLat = '$pickLatitude';
        userLng = '$pickLongitude';

         // get the address 
    var coordinates = new Coordinates(pickLatitude, pickLongitude);
    if(coordinates == null){

    userAddress="";
    }
      else{

          _convertToAddress(pickLatitude,pickLongitude);
    //      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
   
    //     setState(() {
    //        var first = addresses.first;
    // userAddress = first.addressLine;
    //     });
      }

      // print("userAddress");
      //  print(userAddress);
      }
    }
  }

  void _convertToAddress(lat, lng) async{

    String url =
        "https://maps.google.com/maps/api/geocode/json?key=AIzaSyAiXNjJ3WpC-U-NKUPY66eQK471y1CiWTY&language=en_US&latlng=$lat,$lng";


    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var collection = json.decode(response.body);

    var addressData = GetAddressModel.fromJson(collection);
setState(() {
    userAddress=addressData.results[0].formatted_address;
});
  

print("userAddress");
    print(userAddress);

  }

  void _getprevData() {
    _currentLicense = dispensaryLicenseTypeEdit;
    _dispensarycurrentGrow = dispensaryTypeEdit;
    _currentOpenTime = openEdit;
    _currentCloseTime = closeEdit;
    _growerradioValue1 = deliveryEdit;
    _growerradioValue2 = shareEdit;
    delivaryFeeController.text = deliveryFeeEdit;
    shopNameController.text = shopNameEdit;
    licenseController.text = licenseEdit;
    firstNameController.text = firstNameEdit;
    lastNameController.text = lastNameEdit;
    revenueController.text = revenueEdit;
    date = licenseDateEdit;
    // addressController.text = addressEdit;
  }

  Container dispensaryLatLngContainer(String label, var data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 10,
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 15),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////   text /////////

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              elevation: 0.2,
              margin: EdgeInsets.only(right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
              ),
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Text(data,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: "grapheinpro-black",
                        fontSize: 14)
                    //  fontWeight: FontWeight.w400),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Container dispensaryRegisterContainer(String label, String field, bool secure,
      TextInputType type, TextEditingController control, String text) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 10,
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 15),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////   textfield /////////

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              //width: 350,
              decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              
                color: Colors.white,
               
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
            
              ),
              height: 35,
              child: TextField(
                controller: control,
                obscureText: secure,
                keyboardType: type,
                style: TextStyle(color: Color(0xFF000000)),
                cursorColor: Color(0xFF9b9b9b),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  hintText: text,
                  hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontFamily: "sourcesanspro",
                      fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.only(left: 20, bottom: 5, top: 5),
                      
                  fillColor: Color(0xFFFFFFFF),
                  filled: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 20),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dispensaryRegisterContainer("Shop Name", "Type here", false,
                TextInputType.text, shopNameController,shopNameController.text),


                ///////////  shop time//////////
            
                   ////////  shop time//////
            Container(
              //width: 300,
              //height: 30,
              margin: EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Store's Hour",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: "grapheinpro-black",
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  /////////// open dropdown ///////
                  Container(
                    //  width: MediaQuery.of(context).size.width / 3 - 30,
                    height: 40,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                     boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: _openTime.map((var dropDownStringItem) {
                          return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  dropDownStringItem,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontFamily: "sourcesanspro",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ));
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          _openTimeSelected(newValueSelected);
                        },
                        value: _currentOpenTime,
                      ),
                    ),
                  ),

                  Container(
                    //width: 300,
                    //height: 30,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      "to",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "grapheinpro-black",
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  /////////// close dropdown ///////
                  Container(
                    //   width: MediaQuery.of(context).size.width / 3 - 2,

                    height: 40,
                    margin: EdgeInsets.only(top: 10, right: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                       boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: _closeTime.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  dropDownStringItem,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontFamily: "sourcesanspro",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ));
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          _closeTimeSelected(newValueSelected);
                        },
                        value: _currentCloseTime,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            dispensaryRegisterContainer("Yearly Revenue", "Type here", false,
                TextInputType.number, revenueController,revenueController.text),
            dispensaryRegisterContainer("License Number", "Type here", false,
                TextInputType.number, licenseController,licenseController.text),
            // dispensaryRegisterContainer("License Expiration Date", "Type here",
            //     false, TextInputType.number, licenseExpirationController,licenseExpirationController.text),

Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 10,
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 10),
            child: Text(
              "License Expiration Date",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),

               Card(
                 elevation: 0.2,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
                                       child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Container(
                       
                      
                       padding: EdgeInsets.only(left: 20),
                   
                                 child:Text(
            // widget.cannagoData!=null && widget.cannagoData['medicalCannabisExpiration']!= null ? date.toString() : '',
            // '${dispensaryData['licenseExpiration']}'!= null ? 
            date!=null?date.toString():"",
              textAlign: TextAlign.right,
              style: TextStyle(
                           color: Colors.black,
                           fontFamily: "sourcesanspro",
                           fontSize: 14,
                           fontWeight: FontWeight.w500),
            ),
                          
                               ),


                               IconButton(
                                
                                              onPressed: () {

                                               _selectDate(context);
                                           
                                              },

                                 icon: Icon(Icons.calendar_today),
                               )
                   ],
                 ),
               ),

          
        ],
      ),
    ),


            SizedBox(height: 13),

            /////////// license///////////////
            ///
             Container(
            width: MediaQuery.of(context).size.width,
            //height: 10,
            margin: EdgeInsets.only(left: 15, top: 10, bottom: 15),
            child: Text(
              "License Type",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
            Card(
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
              ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: _license.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              dropDownStringItem,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: "standard-regular",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ));
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      _onDropDownLicenseSelected(newValueSelected);
                    },
                    value: _currentLicense,
                  ),
                ),
              ),
            ),

            dispensaryRegisterContainer("Owner First Name", "Type here", false,
                TextInputType.text, firstNameController,firstNameController.text),
            dispensaryRegisterContainer("Owner Last Name", "Type here", false,
                TextInputType.text, lastNameController,lastNameController.text),
           
           
            // growRegisterContainer("Address Latitude", "Type here", false,
            //     TextInputType.number, latitudeController),
            // growRegisterContainer("Address Longitude", "Type here", false,
            //     TextInputType.number, longitudeController),

            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    //  width: 6,
                    //  height: 10,
                    child: Icon(
                      Icons.star_border,
                      size: 10,
                    ),
                  ),
                  Container(
                    width: 280,
                    // height: 40,
                    margin: EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                   "Would you allow free delivery? ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "standard-regular",
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "YES",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: "standard-regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  new Radio(
                    value: 1,
                    activeColor: Color(0xFF01D56A),
                    groupValue: _growerradioValue1,
                    onChanged: _growerhandleRadioValueChange1,
                  ),
                  Text(
                    "NO",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: "standard-regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  new Radio(
                    value: 0,
                    activeColor: Color(0xFF01D56A),
                    groupValue: _growerradioValue1,
                    onChanged: _growerhandleRadioValueChange1,
                  ),
                ],
              ),
            ),
             _isDelivery?dispensaryRegisterContainer("Delivery Fee", "Type here", false,
                TextInputType.number, delivaryFeeController,delivaryFeeController.text):Container(),
            // Container(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Container(
            //         //  width: 6,
            //         //  height: 10,
            //         margin: EdgeInsets.only(top: 10),
            //         child: Icon(
            //           Icons.star_border,
            //           size: 10,
            //         ),
            //       ),
            //       Container(
            //         width: 280,
            //         // height: 40,
            //         margin: EdgeInsets.only(left: 15, top: 8),
            //         child: Text(
            //           'Would you allow sharing a live inventory with our platform?',
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //               color: Color(0xFF000000),
            //               fontFamily: "standard-regular",
            //               fontSize: 14,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 30),
            //   child: new Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         "YES",
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //             color: Color(0xFF000000),
            //             fontFamily: "standard-regular",
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400),
            //       ),
            //       new Radio(
            //         value: 1,
            //         activeColor: Color(0xFF01D56A),
            //         groupValue: _growerradioValue2,
            //         onChanged: _growerhandleRadioValueChange2,
            //       ),
            //       Text(
            //         "NO",
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //             color: Color(0xFF000000),
            //             fontFamily: "standard-regular",
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400),
            //       ),
            //       new Radio(
            //         value: 0,
            //         activeColor: Color(0xFF01D56A),
            //         groupValue: _growerradioValue2,
            //         onChanged: _growerhandleRadioValueChange2,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 5),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    //  width: 6,
                    //  height: 60,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Icon(
                      Icons.star_border,
                      size: 10,
                    ),
                  ),
                  Container(
                    width: 280,
                    // height: 60,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Prompted with the question “Are you a recreational or medicinal retail dispensary",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "standard-regular",
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

///////////////// dispensary type////////////////
            SizedBox(height: 8),
            Card(
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                
                decoration: BoxDecoration(
                   boxShadow:[
                         BoxShadow(color:Colors.grey[300],
                         blurRadius: 17,
                          //offset: Offset(0.0,3.0)
                          )
                       
                       ], 
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: _dispensarygrow.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              dropDownStringItem,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: "standard-regular",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ));
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      _dispensaryonDropDownGrowSelected(newValueSelected);
                    },
                    value: _dispensarycurrentGrow,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),
            //////////////    lat lang choose /////
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    //  width: 6,
                    //  height: 60,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Icon(
                      Icons.star_border,
                      size: 10,
                    ),
                  ),
                  Container(
                    width: 280,
                    // height: 60,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Would you like to turn to your device GPS or pick store location latitude and langitude?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "standard-regular",
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 7),

            ///////   turn on location //
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                  //  width: MediaQuery.of(context).size.width/2-15,
                  //  height: 45,
                    child: Card(
                      elevation: 0.2,
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        disabledColor: Colors.grey,
                        onPressed: () {
                          _deviceLocation();
                        },
                        child: Text(
                          'Current Location',
                           textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF01D56A),
                            //color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///////  Find location////
                  Container(
                   //  width: MediaQuery.of(context).size.width/2-15,
                  //  height: 45,
                    child: Card(
                      elevation: 0.2,
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        disabledColor: Colors.grey,
                        onPressed: () {
                          setState(() {
                            isVisitFirstTym = false;
                          });
                          _seleclocation();
                        },
                        child: Text(
                          'Pick Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF01D56A),
                            // _isClicked?Colors.grey:
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            dispensaryLatLngContainer(
                "Address Latitude", userLat == null ? "" : userLat),
            dispensaryLatLngContainer(
                "Address Longitude", userLng == null ? "" : userLng),

             dispensaryLatLngContainer("Store's Address",userAddress==null?"":userAddress),

            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 140,
                    // height: 30,
                    margin: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {

                        globalEditshop==0?
                      
                       visitSettings?
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Settings())):

                                     Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Navigation())):

                                    Navigator.of(context).pop();

                       
                      },
                      child: Text(
                        "Back",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "grapheinpro-black",
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Color(0xFF01D56A).withOpacity(0.8),
                      disabledColor: Colors.grey,
                      //                     onPressed: (){
                      //                        Navigator.push(
                      // context,
                      // new MaterialPageRoute(
                      //     builder: (context) => Home()));
                      //                     },

                      onPressed: _isLoading ? null : _handleSaveProfile,
                      child: Text(_isLoading ? "Please wait..." : "Save"),

                      // child: Text("Done"),"
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    //return SingleChildScrollView(

    // child: Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[

    /////////// Form Start //////////

    ///////// name field //////
    // editProfileContainer(
    //     "Shop Name", shopNameController, TextInputType.text, false),

    // editProfileContainer("License Number", licenseController,
    //     TextInputType.number, false),
    //     editProfileContainer("License Expiration Date", licenseExpirationController,
    //     TextInputType.text, false),
    //     editProfileContainer("Yearly Revenue", revenueController,
    //     TextInputType.number, false),
    //      editProfileContainer("Owner First Name", firstNameController,
    //     TextInputType.text, false),
    //      editProfileContainer("Owner Last Name", lastNameController,
    //     TextInputType.text, false),
    //     editProfileContainer("Address", addressController,
    //     TextInputType.text, false),
    //   editProfileContainer("Delivery Fee", delivaryFeeController,
    //     TextInputType.number, false),

    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: <Widget>[
    //         Container(
    //             decoration: BoxDecoration(
    //               color: Colors.greenAccent[400],
    //               borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //             ),
    //             width: MediaQuery.of(context).size.width / 3,
    //             height: 45,
    //             margin:
    //                 EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
    //             child: FlatButton(
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: <Widget>[
    //                   Icon(
    //                     Icons.save,
    //                     color: Colors.white,
    //                   ),
    //                   Container(
    //                     margin: EdgeInsets.only(left: 5),
    //                     child: Text(
    //                       _isLoading ? 'Saving...' : 'Save',
    //                       textDirection: TextDirection.ltr,
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 17.0,
    //                         decoration: TextDecoration.none,
    //                         fontFamily: 'MyriadPro',
    //                         fontWeight: FontWeight.normal,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               color: Colors.transparent,
    //               // elevation: 4.0,
    //               //splashColor: Colors.blueGrey,
    //               shape: new RoundedRectangleBorder(
    //                   borderRadius: new BorderRadius.circular(20.0)),
    //               disabledColor: Colors.grey,
    //               onPressed: _isLoading ? null : _handleSaveProfile,
    //             )),
    //       ],
    //     ),
    //   ],
    // ),
    //);
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }

  void _handleSaveProfile() async {
   

   if (shopNameController.text.isEmpty) {
      return _showMsg("Shop Name is empty");
    } 
     else if (_currentOpenTime == '00 AM') {
      return _showMsg("Open Time is empty");
    } 
      else if (_currentCloseTime == '00 PM') {
      return _showMsg("Close Time is empty");
    } else if (revenueController.text.isEmpty) {
      return _showMsg("Revenue Field is empty");
    } else if (licenseController.text.isEmpty) {
      return _showMsg("License Number is empty");
    } 
    else if (date.isEmpty) {
      return _showMsg("Expiration date is empty");
    } 
    else if (_currentLicense == "License Types") {
      return _showMsg("License Types is empty");
    } else if (firstNameController.text.isEmpty) {
      return _showMsg("First Name is empty");
    } else if (lastNameController.text.isEmpty) {
      return _showMsg("Last Name is empty");
    } 
    // else if (addressController.text.isEmpty) {
    //   return _showMsg("Store's Address is empty");
    // }
    else if (delivaryFeeController.text.isEmpty) {
        setState(() {
       delivaryFeeController.text='0'; 
      });
    } else if (_growerradioValue1 == -1) {
      return _showMsg("Delivery and pick field is empty");
    } else if (_growerradioValue2 == -2) {
      return _showMsg("Sharing live field is empty");
    } else if (_dispensarycurrentGrow == 'Dispensary Types') {
      return _showMsg("Dispensary Types is empty");
    }
    else if (userLat.isEmpty && userLng.isEmpty) {
      return _showMsg("Click button to select your location");
    }
    if (userLat.isEmpty) {
      return _showMsg("Latitude is empty");
    } else if (userLng.isEmpty) {
      return _showMsg("Longitude is empty");
    }


    var growdata = {
      'id': '${dispensaryData['id']}',
      'license': licenseController.text,
      'address': userAddress,
      'lat': userLat,
      'lng': userLng,
      'name': shopNameController.text,
      'openingTime':_currentOpenTime,
      'closingTime':_currentCloseTime,
      'yearlyRevenue': revenueController.text,
      'licenseExpiration': date,//licenseExpirationController.text,
      'licenseType': _currentLicense,
      'ownerNameFirst': firstNameController.text,
      'ownerNameLast': lastNameController.text,
      'deliver': _growerradioValue1 == 1 ? 'Yes' : 'No',
      'deliveryFee': delivaryFeeController.text,
      'sharingInventory': _growerradioValue2== 1 ? 'Yes' : 'No',
      'RecreationalOrMedicinal': _dispensarycurrentGrow,
    };

    setState(() {
      _isLoading = true;
    });

    // var res = await CallApi().postData(userdata, 'app/userEdit');
    // var body = json.decode(res.body);
    // print(growdata);

    var res = await CallApi().postData(growdata, 'app/cannagrowEdit');
    var body = json.decode(res.body);
    print(body);

    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
     
      localStorage.remove('dispensary');
      localStorage.setString('dispensary', json.encode(body['data']));


    _showHintMsg();

    


    } else {
      _showMsg("Something is wrong");
    }

    setState(() {
      _isLoading = false;
    });
  }
   void _showHintMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: 
              Text(
                                "Shop information has been updated successfully! ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "grapheinpro-black",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
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
                                    "Ok",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    
                                 Navigator.push(
                 context, new MaterialPageRoute(builder: (context) => Navigation()));
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
  void _onDropDownLicenseSelected(String newValueSelected) {
    setState(() {
      this._currentLicense = newValueSelected;
    });
  }

  void _growerhandleRadioValueChange1(int value) {
  if(value==0){

      
  setState(() {

      //delivaryFeeController.text="0";
      _isDelivery=true;
      _growerradioValue1 = 0;
    });
    }
  

    else if(value==1){
  setState(() {
        _isDelivery=false;
      delivaryFeeController.text="";
      _growerradioValue1 = 1;
    });
    }
  }

  void _growerhandleRadioValueChange2(int value) {
    setState(() {
      _growerradioValue2 = value;
    });
  }

  void _dispensaryonDropDownGrowSelected(String newValueSelected) {
    setState(() {
      this._dispensarycurrentGrow = newValueSelected;
    });
  }

  void _openTimeSelected(String newValueSelected) {
    setState(() {
      this._currentOpenTime = newValueSelected;
    });
  }

  void _closeTimeSelected(String newValueSelected) {
    setState(() {
      this._currentCloseTime = newValueSelected;
    });
  }
  void _deviceLocation() async {
    setState(() {
      _isSelected = true;
    });

    LocationData currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
    
    // get the address 
    var coordinates = new Coordinates(latitude, longitude);
    if(coordinates == null){

    userAddress="";
    }
      else{


        _convertToAddress(latitude, longitude);
    //      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = addresses.first;
    // userAddress = first.addressLine;
      }

      // print("myAddress");
      //  print(myAddress);
    setState(() {
      userLat = '$latitude';
      userLng = '$longitude';
    });
  }

  void _seleclocation() {

_deviceLocation();

    setState(() {
    
      _visitMap = true;
      globalEditshop = 0;
      count = globalEditshop;
    });
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => MapPage()));

    shopNameEdit = shopNameController.text;
    licenseEdit = licenseController.text;
    firstNameEdit = firstNameController.text;
    lastNameEdit = lastNameController.text;
    revenueEdit = revenueController.text;
    licenseDateEdit = date;
    openEdit = _currentOpenTime;
    closeEdit = _currentCloseTime;
   // addressEdit = addressController.text;
    deliveryFeeEdit = delivaryFeeController.text;
    dispensaryLicenseTypeEdit = _currentLicense;
    dispensaryTypeEdit = _dispensarycurrentGrow;
    deliveryEdit = _growerradioValue1;
    shareEdit = _growerradioValue2;
    globalEditshop = count;
  }
}
