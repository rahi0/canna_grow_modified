
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
import 'package:cannagrowdev/bottomNavigation/app.dart';

class GrowRegisterForm extends StatefulWidget {
  @override
  _GrowRegisterFormState createState() => _GrowRegisterFormState();
}

class _GrowRegisterFormState extends State<GrowRegisterForm> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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

  var _day = [
    'Date',
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
  ];
  var _currentDaySelected = 'Date';

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

  bool termsConditionValue = false;

  var _growerradioValue1 = -1;
  var _growerradioValue2 = -2;

  String license = "";
  String grow = "";
  String seed = "";

  var _license = [
    'License Types',
    'Retailer',
    'Retailer Storefront',
    'Distributor',
    'Distributor-Transport Only',
    'Microbusiness'
  ];
  var _currentLicense = 'License Types';

  var _grow = ['Growing Types', 'Indoor', 'Outdoor'];
  var _currentGrow = 'Growing Types';

  var _seed = ['Seed Types', 'Organic', 'GMO'];
  var _currentSeed = 'Seed Types';

  Container growRegisterContainer(String label, String field, bool secure,
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
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 5),
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

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(1.0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: TextField(
              style: TextStyle(color: Color(0xFF000000)),
              keyboardType: type,
              obscureText: secure,
              controller: control,
              cursorColor: Color(0xFF9b9b9b),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFFFBFBFB))),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                hintText: field,
                hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                    fontFamily: "standard-regular",
                    fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.only(left: 20, bottom: 12, top: 12),
                fillColor: Color(0xFFFFFFFF),
                filled: true,
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
      child: Column(
        children: <Widget>[
          growRegisterContainer("Shop Name", "Type here", false,
              TextInputType.text, shopNameController),
          growRegisterContainer("License Number", "Type here", false,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /////////// day dropdown ///////
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 30,
                        height: 40,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1.0, 2.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: _day.map((String dropDownStringItem) {
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
                              _dropDownDaySelected(newValueSelected);
                            },
                            value: _currentDaySelected,
                          ),
                        ),
                      ),
                      /////////// month dropdown ///////
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 40,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1.0, 2.0),
                              blurRadius: 5.0,
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

                      /////////// year dropdown ///////
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: 40,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1.0, 2.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: _year.map((String dropDownStringItem) {
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
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
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
///////////////// grow////////////////
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: _grow.map((String dropDownStringItem) {
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
                    _onDropDownGrowSelected(newValueSelected);
                  },
                  value: _currentGrow,
                ),
              ),
            ),
          ),
          ////////////////////seed////////////////////

          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: _seed.map((String dropDownStringItem) {
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
                    _onDropDownSeedSelected(newValueSelected);
                  },
                  value: _currentSeed,
                ),
              ),
            ),
          ),

          growRegisterContainer("Owner First Name", "Type here", false,
              TextInputType.text, firstNameController),
          growRegisterContainer("Owner Last Name", "Type here", false,
              TextInputType.text, lastNameController),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  //  width: 6,
                  //  height: 10,
                  child: Icon(
                    Icons.radio_button_unchecked,
                    size: 10,
                  ),
                ),
                Container(
                  width: 280,
                  // height: 40,
                  margin: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    "Would you allow delivery and pickup of items in your inventory",
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
            margin: EdgeInsets.only(left: 20),
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
                  groupValue: _growerradioValue1,
                  onChanged: _growerhandleRadioValueChange1,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //  width: 6,
                  //  height: 10,
                  margin: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.radio_button_unchecked,
                    size: 10,
                  ),
                ),
                Container(
                  width: 280,
                  // height: 40,
                  margin: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    'Would you allow sharing a live inventory with our platform?',
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
            margin: EdgeInsets.only(left: 20),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  groupValue: _growerradioValue2,
                  onChanged: _growerhandleRadioValueChange2,
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
                  groupValue: _growerradioValue2,
                  onChanged: _growerhandleRadioValueChange2,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  // width: 170,
                  // height: 20,
                  margin: EdgeInsets.only(left: 15, top: 15),
                  decoration: BoxDecoration(

                      // border: Border(

                      //     bottom: BorderSide(width: 1.5, color: Color(0xFF000000)),
                      // ),
                      ),
                  child: Text(
                    "Term and conditions",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: "grapheinpro-black",
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        termsConditionValue = !termsConditionValue;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage('assets/images/check.png'),
                        ),
                      ),
                      child: termsConditionValue
                          ? Icon(
                              Icons.check,
                              size: 20.0,
                              color: Colors.white,
                            )
                          : Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'assets/images/check_grey.png'),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),

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
                      Navigator.pop(context);
                      //         Navigator.push(
                      //  context,
                      //  new MaterialPageRoute(
                      //    builder: (context) => SignUpFirst()
                      //  ));
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
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  //    color: Color(0xFF01D56A)
                  // ),
                  child: FlatButton(
                    color: Color(0xFF01D56A),
                    disabledColor: Colors.grey,
                    //                     onPressed: (){
                    //                        Navigator.push(
                    // context,
                    // new MaterialPageRoute(
                    //     builder: (context) => Home()));
                    //                     },

                    onPressed: _isLoading ? null : _handleLogin,

                    child: Text("Done"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleLogin() async {
    if (shopNameController.text.isEmpty) {
      return _showMsg("Shop Name is empty");
    } else if (licenseController.text.isEmpty) {
      return _showMsg("License Number is empty");
    } else if (_currentDaySelected == 'Day' &&
        _currentMonthsSelected == 'Month' &&
        _currentYearSelected == "Year") {
      return _showMsg("Expiration date s empty");
    } else if (_currentLicense == "License Types") {
      return _showMsg("License Types is empty");
    } else if (_currentGrow == "Growing Types") {
      return _showMsg("Growing Types is empty");
    } else if (_currentSeed == 'Seed Types') {
      return _showMsg("Seed Types is empty");
    } else if (firstNameController.text.isEmpty) {
      return _showMsg("First Name is empty");
    } else if (lastNameController.text.isEmpty) {
      return _showMsg("Last Name is empty");
    } else if (_growerradioValue1 == -1) {
      return _showMsg("Delivery and pick field is empty");
    } else if (_growerradioValue2 == -2) {
      return _showMsg("Sharing live field is empty");
    } else if (!termsConditionValue) {
      return _showMsg("Check Terms and Condition");
    }
    setState(() {
      _isLoading = true;
    });

    var data = {
      'name': shopNameController.text,
      'license': licenseController.text,
      'licenseExpiration': _currentDaySelected +
          '-' +
          _currentMonthsSelected +
          '-' +
          _currentYearSelected,
      'licenseType': _currentLicense,
      'growingType': _currentGrow,
      'seedType': _currentSeed,
      'ownerNameFirst': firstNameController.text,
      'ownerNameLast': lastNameController.text,
      'deliver': _growerradioValue1 != 1 ? 'Yes' : 'No',
      'sharingInventory': _growerradioValue2 != 1 ? 'Yes' : 'No',
      // 'delivery' :  _growerradioValue1,
      // 'sharingInventory':  _growerradioValue2
      //'birthday': _currentYearSelected
    };

    var res = await CallApi().postData(data, 'auth/registerGrow');
    var body = json.decode(res.body);
    print(body);

    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      localStorage.setString('cannagrow', json.encode(body['cannagrow']));

      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
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

  void _onDropDownGrowSelected(String newValueSelected) {
    setState(() {
      this._currentGrow = newValueSelected;
    });
  }

  void _onDropDownSeedSelected(String newValueSelected) {
    setState(() {
      this._currentSeed = newValueSelected;
    });
  }

  void _growerhandleRadioValueChange1(int value) {
    setState(() {
      _growerradioValue1 = value;
    });
  }

  void _growerhandleRadioValueChange2(int value) {
    setState(() {
      _growerradioValue2 = value;
    });
  }

  void _dropDownMonthSelected(String newValueSelected) {
    setState(() {
      this._currentMonthsSelected = newValueSelected;
    });
  }

  void _dropDownYearSelected(String newValueSelected) {
    setState(() {
      this._currentYearSelected = newValueSelected;
    });
  }

  void _dropDownDaySelected(String newValueSelected) {
    setState(() {
      this._currentDaySelected = newValueSelected;
    });
  }
}
