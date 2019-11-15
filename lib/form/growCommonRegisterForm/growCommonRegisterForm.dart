
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
import 'package:cannagrowdev/screen/GrowRegisterPage/GrowRegisterPage.dart';

class GrowCommonRegisterForm extends StatefulWidget {
  @override
  _GrowCommonRegisterFormState createState() => _GrowCommonRegisterFormState();
}

class _GrowCommonRegisterFormState extends State<GrowCommonRegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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

  String nameGrowerCountry = "";
  String nameGrowerState = "";

  var _growercountries = ['Country', 'United state america', 'Others'];
  var _growercurrentCountrySelected = 'Country';

  var _growerstates = ['State', 'California', 'Others'];
  var _growercurrentStateSelected = 'State';

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

  Container growCommonRegisterContainer(String label, String field, bool secure,
      TextInputType type, TextEditingController control) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
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
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ////////   add photo  /////////

          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              // margin: EdgeInsets.only(left: 80, top: 40, bottom: 10),
              child: Stack(
                children: <Widget>[
                  Container(
                      width: 100,
                      height: 100,
                      decoration: new BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 5, color: Colors.blue[100]),
                            top: BorderSide(width: 5, color: Colors.blue[100]),
                            left: BorderSide(width: 5, color: Colors.blue[100]),
                            right:
                                BorderSide(width: 5, color: Colors.blue[100]),
                          ),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage('assets/images/nen.jpg'),
                          ))),

                  //////   camera icon  ////////////

                  new Positioned(
                    child: Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(top: 60, left: 70),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF01D56A),
                        ),
                        child: Icon(
                          Icons.photo_camera,
                          color: Color(0xFFFFFFFF),
                        )),
                  )
                ],
              ),
            ),
          ),

          growCommonRegisterContainer("Grower name", "Type here", false,
              TextInputType.text, nameController),
          growCommonRegisterContainer(
              "Email", "Type here", false, TextInputType.text, mailController),
          growCommonRegisterContainer("Password", "Type here", true,
              TextInputType.text, passwordController),

          ////////  Country and State /////////
          Container(
            width: MediaQuery.of(context).size.width,
            // height: 30,
            margin: EdgeInsets.only(left: 15, top: 20),
            child: Text(
              "Country and State",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////  country dropdown /////////

          Container(
            margin: EdgeInsets.only(top: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // margin: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: _growercountries.map((String dropDownStringItem) {
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
                      _groweronDropDownCountrySelected(newValueSelected);
                    },
                    value: _growercurrentCountrySelected,
                  ),
                ),
              ),
            ),
          ),

          /////////// state dropdown ///////
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //  margin: EdgeInsets.only(top: 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: _growerstates.map((String dropDownStringItem) {
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
                    _groweronDropDownCitySelected(newValueSelected);
                  },
                  value: _growercurrentStateSelected,
                ),
              ),
            ),
          ),

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
                    "Date of Birth",
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
                        width: MediaQuery.of(context).size.width / 4+5,
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
          growCommonRegisterContainer("Phone", "Type here", false,
              TextInputType.number, phoneController),

          ///////////////////  Back and Next/////////////////

          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // width: 140,
                  // height: 30,
                  margin: EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      //               Navigator.push(
                      //  context,
                      //  new MaterialPageRoute(
                      //    builder: (context) => LogIn()
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
                    //     builder: (context) => GrowRegisterPage()));
                    //                     },

                    onPressed: _isLoading ? null : _handleLogin,

                    child: Text(_isLoading ? 'Loading...' : "Next"),
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
    if (nameController.text.isEmpty) {
      return _showMsg("Name is empty");
    } else if (mailController.text.isEmpty) {
      return _showMsg("Email is empty");
    } else if (passwordController.text.isEmpty) {
      return _showMsg("Password is empty");
    } else if (_growercurrentCountrySelected == "Country") {
      return _showMsg("Country is empty");
    } else if (_growercurrentStateSelected == "State") {
      return _showMsg("State is empty");
    } else if (_currentDaySelected == 'Day' &&
        _currentMonthsSelected == 'Month' &&
        _currentYearSelected == "Year") {
      return _showMsg("Birth date s empty");
    } else if (phoneController.text.isEmpty) {
      return _showMsg("Phone number is empty");
    }
    setState(() {
      _isLoading = true;
    });

    var data = {
      'name': nameController.text,
      'email': mailController.text,
      'password': passwordController.text,
      'phone': phoneController.text,
      'country': _growercurrentCountrySelected,
      'state': _growercurrentStateSelected,
      'birthday': _currentDaySelected +
          '-' +
          _currentMonthsSelected +
          '-' +
          _currentYearSelected,
    };

    var res = await CallApi().postData(data, 'auth/register');
    var body = json.decode(res.body);
    print("Body : "+body);

    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));

      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => GrowRegisterPage()));
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
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

  void _groweronDropDownCountrySelected(String newValueSelected) {
    setState(() {
      this._growercurrentCountrySelected = newValueSelected;
    });
  }

  void _groweronDropDownCitySelected(String newValueSelected) {
    setState(() {
      this._growercurrentStateSelected = newValueSelected;
    });
  }
}
