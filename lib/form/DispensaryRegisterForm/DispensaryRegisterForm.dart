import 'package:cannagrowdev/BottomApp/bottomApp.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
import 'package:cannagrowdev/screen/Map/MapPage.dart';
import 'package:cannagrowdev/screen/loginPage/loginPage.dart';
import 'package:http/http.dart' as http;

bool isVisitFirstTym = false;
bool goFirst = true;
String shopName = "";
String license = "";
String firstName = "";
String lastName = "";
String revenue = "";
String address = "";
var licenseDay = "Day";
var deliveryFee;
var licenseMonth = "Month";
var openStore = "00 AM";
var closeStore = "00 PM";
var licenseYear = "Year";
var dispensaryLicenseType = "License Types";
var dispensaryType = "Dispensary Types";
int delivery;
int share;
var latitudeText = "";
var longitudeText = "";
var addressText = "";
int globalcount = 1;
bool _isDelivery = false;

class DispensaryRegisterForm extends StatefulWidget {
  @override
  _DispensaryRegisterFormState createState() => _DispensaryRegisterFormState();
}

class _DispensaryRegisterFormState extends State<DispensaryRegisterForm> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController revenueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController delivaryFeeController = TextEditingController();
  // TextEditingController latitudeController = TextEditingController();
  // TextEditingController longitudeController = TextEditingController();

  double latitude;
  double longitude;
  int count;

  bool _isLocationFirstClick = false;

  bool _isSelected = false;

  var now = new DateTime.now();
  String dayCheck = "";
  String yearCheck = "";
  String monthCheck = "Month";

  @override
  void initState() {
    _getData();
    _getYear();
    super.initState();
  }

  List _yr = [];

  void _getYear() {
    _yr.insert(0, 'Year');

    for (var yy = now.year - 60; yy <= now.year + 20; yy++) {
      _yr.add(yy.toString());
    }
  }

  var _months = [
    'Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  var _currentMonthsSelected = 'Month';

  var _year = ['Year', '1990', '1991', '1992', '1993', '1994', '1995', '1996'];
  var _currentYearSelected = 'Year';

  var _dayThirtyOne = [
    'Day',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];

  var _dayThirty = [
    'Day',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30'
  ];

  var _dayTwentyEight = [
    'Day',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28'
  ];

  var _dayTwentyNine = [
    'Day',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29'
  ];

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
  var _currentDaySelected = 'Day';
  var _currentOpenTime = '00 AM';
  var _currentCloseTime = '00 PM';

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  bool _isLoading = false;
  bool _isClicked = false;

  bool termsConditionValue = false;
  bool deviceGPS = false;

  var _growerradioValue1 = -1;
  var _growerradioValue2 = -2;

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

  var _latLangOption = [
    'Choose Any One',
    'Manually fill your location latitude and longitude',
    'Turn on your device GPS'
  ];
  var _currentlatLangOption = 'Choose Any One';

  void _convertToAddress(lat, lng) async {
    String url =
        "https://maps.google.com/maps/api/geocode/json?key=AIzaSyAiXNjJ3WpC-U-NKUPY66eQK471y1CiWTY&language=en_US&latlng=$lat,$lng";

    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var collection = json.decode(response.body);

    var addressData = GetAddressModel.fromJson(collection);
    setState(() {
      addressText = addressData.results[0].formatted_address;
    });

    print("addressText");
    print(addressText);
  }

  void _getData() async {
    //  print(globalcount);

    if (globalcount == 0) {
      setState(() {
        _isSelected = true;
      });

      latitudeText = '$pickLatitude';
      longitudeText = '$pickLongitude';

      // get the address
      var coordinates = new Coordinates(pickLatitude, pickLongitude);
      if (coordinates == null) {
        addressText = "";
      } else {
        _convertToAddress(pickLatitude, pickLongitude);

        //      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

        //     setState(() {
        //        var first = addresses.first;
        //  addressText = first.addressLine;
        //     });
      }

      // print("userAddress");
      //  print(userAddress);

    }

    _currentDaySelected = licenseDay;
    _currentMonthsSelected = licenseMonth;
    _currentYearSelected = licenseYear;
    _currentOpenTime = openStore;
    _currentCloseTime = closeStore;
    _currentLicense = dispensaryLicenseType;
    _dispensarycurrentGrow = dispensaryType;
    _growerradioValue1 = delivery;
    _growerradioValue2 = share;
    delivaryFeeController.text = deliveryFee;
    shopNameController.text = shopName;
    licenseController.text = license;
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    revenueController.text = revenue;
    addressController.text = address;
  }

  Container dispensaryLatLngContainer(String label, String field) {
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
                child: Text(field,
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
      TextInputType type, TextEditingController control) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 10, 
            margin: EdgeInsets.only(left: 15, top: 12, bottom: 15),
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
              //  height: 35,
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
                  hintText: "Type here",
                  hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontFamily: "sourcesanspro",
                      fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.only(left: 20, bottom: 10, top: 10),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dispensaryRegisterContainer("Shop Name", "Type here", false,
                TextInputType.text, shopNameController),

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
                TextInputType.number, revenueController),
            dispensaryRegisterContainer("License Number", "Type here", false,
                TextInputType.number, licenseController),

            ///////Dob//////
            Container(
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(bottom: 5),
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //width: 300,
                    //height: 30,
                    margin: EdgeInsets.only(left: 15, top: 15),
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
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        /////////// year dropdown ///////
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
                              items: _yr.map((var dropDownStringItem) {
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
                                _dropDownYearSelected(newValueSelected);
                              },
                              value: _currentYearSelected,
                            ),
                          ),
                        ),

                        /////////// month dropdown ///////
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
                              items: _months.map((String dropDownStringItem) {
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
                                _dropDownMonthSelected(newValueSelected);
                              },
                              value: _currentMonthsSelected,
                            ),
                          ),
                        ),
                        ///////// day dropdown ///////
                        Container(
                          //  width: MediaQuery.of(context).size.width / 3 - 35,
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
                              items: dayCheck == "Twenty Eight"
                                  ? _dayTwentyEight
                                      .map((String dropDownStringItem) {
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
                                    }).toList()
                                  : dayCheck == "Twenty Nine"
                                      ? _dayTwentyNine
                                          .map((String dropDownStringItem) {
                                          return DropdownMenuItem<String>(
                                              value: dropDownStringItem,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  dropDownStringItem,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color(0xFF9b9b9b),
                                                      fontFamily:
                                                          "sourcesanspro",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ));
                                        }).toList()
                                      : dayCheck == "Thirty One"
                                          ? _dayThirtyOne
                                              .map((String dropDownStringItem) {
                                              return DropdownMenuItem<String>(
                                                  value: dropDownStringItem,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                      dropDownStringItem,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF9b9b9b),
                                                          fontFamily:
                                                              "sourcesanspro",
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ));
                                            }).toList()
                                          : _dayThirty
                                              .map((String dropDownStringItem) {
                                              return DropdownMenuItem<String>(
                                                  value: dropDownStringItem,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                      dropDownStringItem,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF9b9b9b),
                                                          fontFamily:
                                                              "sourcesanspro",
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ));
                                            }).toList(),
                              onChanged: (String newValueSelected) {
                                _dropDownDaySelected(newValueSelected);
                              },
                              value: _currentDaySelected,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            ///////Dob end/////

            SizedBox(height: 10),

            /////////// license///////////////
            Card(
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
                ],
                    borderRadius: BorderRadius.circular(20)),
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
                TextInputType.text, firstNameController),
            dispensaryRegisterContainer("Owner Last Name", "Type here", false,
                TextInputType.text, lastNameController),

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

            _isDelivery
                ? Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child:dispensaryRegisterContainer("Delivery Fee", "Type here",
                    false, TextInputType.number, delivaryFeeController))
                : Container(),
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
                  boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                    // offset: Offset(1.0, 2.0),
                    blurRadius: 14.0,
                  ),
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
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 5, right: 5),
              padding: EdgeInsets.only(left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    // width: MediaQuery.of(context).size.width/2-15,

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
                          'Current Device',
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
                    // width: MediaQuery.of(context).size.width/2-15,
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

            Container(
                child: _isSelected
                    ? Column(
                        children: <Widget>[
                          dispensaryLatLngContainer(
                              "Address Latitude", latitudeText),
                          dispensaryLatLngContainer(
                              "Address Longitude", longitudeText),
                          dispensaryLatLngContainer("Address", addressText),
                        ],
                      )
                    : Text("")),

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
                        shopName = "";
                        license = "";
                        firstName = "";
                        lastName = "";
                        revenue = "";
                        address = "";
                        licenseDay = "Day";
                        deliveryFee = "";
                        licenseMonth = "Month";
                        licenseYear = "Year";
                        openStore = "00 AM";
                        closeStore = "00 PM";
                        dispensaryLicenseType = "License Types";
                        dispensaryType = "Dispensary Types";
                        delivery = 11;
                        share = 12;
                        globalcount = 1;

                        latitudeText = "";
                        longitudeText = "";
                        addressText = "";

                        goFirst
                            ? Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => LogIn()))
                            :

                            Navigator.of(context).pop();
                            //  Navigator.push(
                            //     context,
                            //     new MaterialPageRoute(
                            //         builder: (context) => Navigation())
                            //         );
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
                      color: Color(0xFF01D56A),
                      disabledColor: Colors.grey,
                      //                     onPressed: (){
                      //                        Navigator.push(
                      // context,
                      // new MaterialPageRoute(
                      //     builder: (context) => Home()));
                      //                     },

                      onPressed: _isLoading ? null : _handleLogin,
                      child: Text(_isLoading ? "Please wait..." : "Done"),

                      // child: Text("Done"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (shopNameController.text.isEmpty) {
      return _showMsg("Shop Name is empty");
    } 
     else if (_currentOpenTime == '00 AM') {
      return _showMsg("Open Time is empty");
    } 
      else if (_currentCloseTime == '00 PM') {
      return _showMsg("Close Time is empty");
    } 
    else if (revenueController.text.isEmpty) {
      return _showMsg("Revenue Field is empty");
    } else if (licenseController.text.isEmpty) {
      return _showMsg("License Number is empty");
    } else if (_currentDaySelected == 'Day') {
      return _showMsg("Date is empty");
    }
     else if (_currentMonthsSelected == 'Month') {
      return _showMsg("Month is empty");
    } 
    else if (_currentYearSelected == "Year") {
      return _showMsg("Year is empty");
    } else if (_currentLicense == "License Types") {
      return _showMsg("License Types is empty");
    } else if (firstNameController.text.isEmpty) {
      return _showMsg("First Name is empty");
    } else if (lastNameController.text.isEmpty) {
      return _showMsg("Last Name is empty");
    } else if (delivaryFeeController.text.isEmpty) {
      setState(() {
        delivaryFeeController.text = '0';
      });
    } else if (_growerradioValue1 == -1) {
      return _showMsg("Delivery and pick field is empty");
    } else if (_growerradioValue2 == -2) {
      return _showMsg("Sharing live field is empty");
    } else if (_dispensarycurrentGrow == 'Dispensary Types') {
      return _showMsg("Dispensary Types is empty");
    } else if (longitudeText.isEmpty && latitudeText.isEmpty) {
      return _showMsg("Click button to select your location");
    }
    if (latitudeText.isEmpty) {
      return _showMsg("Latitude is empty");
    } else if (longitudeText.isEmpty) {
      return _showMsg("Longitude is empty");
    }
    // else if (!termsConditionValue) {
    //   return _showMsg("Check Terms and Condition");
    // }

    setState(() {
      _isLoading = true;
    });

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJsonString = localStorage.getString('user');
    var user = json.decode(userJsonString);
    var data = {
      'userId': user['id'],
      'name': shopNameController.text,
      'openingTime':_currentOpenTime,
      'closingTime':_currentCloseTime,
      'yearlyRevenue': revenueController.text,
      'license': licenseController.text,
      'licenseExpiration': _currentDaySelected +
          '-' +
          _currentMonthsSelected +
          '-' +
          _currentYearSelected,
      'licenseType': _currentLicense,
      'ownerNameFirst': firstNameController.text,
      'ownerNameLast': lastNameController.text,
      'deliver': _growerradioValue1 == 1 ? 'Yes' : 'No',
      'sharingInventory': _growerradioValue2 == 1 ? 'Yes' : 'No',
      'RecreationalOrMedicinal': _dispensarycurrentGrow,
      'address': addressText, //addressController.text,
      'deliveryFee': delivaryFeeController.text,
      'lat': latitudeText,
      'lng': longitudeText
    };
  
    var res = await CallApi().postData(data, 'auth/registerDep');
    var body = json.decode(res.body);
    print(body);

    if (body['success'] == true) {
      localStorage.setString('token', body['token']);
      // localStorage.setString('user', json.encode(body['user']));
      localStorage.setString('dispensary', json.encode(body['dispensary']));

      bottomNavIndex = 4;

      latitudeText = '';
      longitudeText = '';
      addressText = '';
      _currentDaySelected = "Day";
      _currentMonthsSelected = "Month";
      _currentYearSelected = "Year";
      _currentLicense = "License Types";
      _dispensarycurrentGrow = "Dispensary Types";
      _growerradioValue1 = null;
      _growerradioValue2 = null;

      shopNameController.text = '';
      licenseController.text = '';
      firstNameController.text = '';
      lastNameController.text = '';
      revenueController.text = '';
      addressController.text = '';
      delivaryFeeController.text = '';
      goFirst
          ? Navigator.push(
              context, new MaterialPageRoute(builder: (context) => LogIn()))
          :

        //  Navigator.of(context).pop();
        bottomNavIndex = 4;
           Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Navigation()));

      // Navigator.push(
      //     context, new MaterialPageRoute(builder: (context) => LogIn()));

    } else {
      _showMsg("Something is wrong");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _onDropDownLicenseSelected(String newValueSelected) {
    setState(() {
      this._currentLicense = newValueSelected;
    });
  }

  void _growerhandleRadioValueChange1(int value) {
    if (value == 0) {
      setState(() {
        //delivaryFeeController.text="0";
        _isDelivery = true;
        _growerradioValue1 = 0;
      });
    } else if (value == 1) {
      setState(() {
        _isDelivery = false;
        delivaryFeeController.text = "";
        _growerradioValue1 = 1;
      });
    }
  }

  void _growerhandleRadioValueChange2(int value) {
    setState(() {
      _growerradioValue2 = value;
    });
  }

  void _dropDownMonthSelected(String newValueSelected) {
    setState(() {
      this._currentMonthsSelected = newValueSelected;
      monthCheck = newValueSelected;
      _currentDaySelected = 'Day';

      if (newValueSelected == 'April' ||
          newValueSelected == 'June' ||
          newValueSelected == 'September' ||
          newValueSelected == 'November') {
        dayCheck = "Thirty";
      } else if (newValueSelected == 'February') {
        if ((int.parse(yearCheck) % 4 == 0) &&
            ((int.parse(yearCheck) % 100 != 0) ||
                (int.parse(yearCheck) % 400 == 0))) {
          dayCheck = "Twenty Nine";
        } else {
          dayCheck = "Twenty Eight";
        }
      } else {
        dayCheck = "Thirty One";
      }
    });
  }

  void _dropDownYearSelected(String newValueSelected) {
    setState(() {
      this._currentYearSelected = newValueSelected;
      yearCheck = newValueSelected;
      _dropDownMonthSelected(monthCheck);
    });
  }

  void _dropDownDaySelected(String newValueSelected) {
    setState(() {
      this._currentDaySelected = newValueSelected;
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

  void _latLangOptionDropDownSelected(String newValueSelected) async {
    LocationData currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
    setState(() {
      this._currentlatLangOption = newValueSelected;
      _isSelected = true;
    });

    if (_currentlatLangOption == 'Current Location') {
      latitudeText = '$latitude';
      longitudeText = '$longitude';

      // get the address
      var coordinates = new Coordinates(latitude, longitude);
      if (coordinates == null) {
        addressText = "";
      } else {
        _convertToAddress(latitude, longitude);

        //      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

        //     setState(() {
        //        var first = addresses.first;
        // addressText = first.addressLine;
        //     });
      }

      // print("userAddress");
      //  print(userAddress);
    } else if (_currentlatLangOption ==
        'Manually fill your location latitude and longitude') {
      latitudeText = '';
      longitudeText = '';
      addressText = "";
    }
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

    setState(() {
      latitudeText = '$latitude';
      longitudeText = '$longitude';
    });

    // get the address
    var coordinates = new Coordinates(latitude, longitude);
    if (coordinates == null) {
      addressText = "";
    } else {
      _convertToAddress(latitude, longitude);

    }

   
  }

  void _seleclocation() {
    _deviceLocation();

    setState(() {
      _isLocationFirstClick = true;
      isVisitFirstTym = true;
      globalcount = 0;
      count = globalcount;
    });
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => MapPage()));

    shopName = shopNameController.text;
    license = licenseController.text;
    firstName = firstNameController.text;
    lastName = lastNameController.text;
    revenue = revenueController.text;
    address = addressController.text;
    deliveryFee = delivaryFeeController.text;
    licenseDay = _currentDaySelected;
    licenseMonth = _currentMonthsSelected;
    licenseYear = _currentYearSelected;
    openStore = _currentOpenTime;
    closeStore = _currentCloseTime;
    dispensaryLicenseType = _currentLicense;
    dispensaryType = _dispensarycurrentGrow;
    delivery = _growerradioValue1;
    share = _growerradioValue2;
    globalcount = count;

    // setState(() {
    //   isLocationFirstClick = false;
    // });
  }
}
