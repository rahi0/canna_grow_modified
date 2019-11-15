import 'package:cannagrowdev/ImagePicker/image_picker_handler.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
// import 'package:cannagrowdev/screen/CountryDetails/CountryDetails.dart';
// import 'package:cannagrowdev/screen/CountryDetails/CountryModel.dart';
import 'package:cannagrowdev/screen/DispensaryRegisterPage/DispensaryRegisterPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class DispensaryCommonRegisterForm extends StatefulWidget {
  @override
  _DispensaryCommonRegisterFormState createState() =>
      _DispensaryCommonRegisterFormState();
}
class _DispensaryCommonRegisterFormState
    extends State<DispensaryCommonRegisterForm>
    with TickerProviderStateMixin//,ImagePickerListener 
    {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  


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
    PhotoCrop state;
  File imageFile;
  // File _image;
  // AnimationController _controller;

  //  Country _selected = Country( asset: "assets/flags/us_flag.png",
  //   dialingCode: "1",
  //   isoCode: "US",
  //   name: "Select Country");
     String image;
  var imagePath=null;
   bool _isImage= false;

  //ImagePickerHandler imagePicker;
  
  var now = new DateTime.now();
  String dayCheck = "";
  String yearCheck = "";
  String monthCheck="Month";

  @override
  void initState() {
    state = PhotoCrop.free;
     _getYear();
    super.initState();
    // _controller = new AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 500),
    // );
    //imagePicker=new ImagePickerHandler(this,_controller);
    //imagePicker.init();


 shopName = "";
 license = "";
 firstName = "";
 lastName = "";
revenue = "";
 address = "";
 licenseDay = "Day";
deliveryFee="";
 licenseMonth = "Month";
 licenseYear = "Year";
 dispensaryLicenseType = "License Types";
 dispensaryType = "Dispensary Types";
delivery=11;
 globalcount =1;
 share=12;
 latitudeText = "";
 longitudeText = "";
  }

   List _yr = [];

  void _getYear() {
    _yr.insert(0, 'Year');

    for (var yy = now.year - 60; yy <= now.year + 20; yy++) {
      _yr.add(yy.toString());
    }
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
  var _currentDaySelected = 'Day';

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
            //height: 10,
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 10),
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
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                   // offset: Offset(3.0, 5.0),
                    blurRadius: 16.0,
                  ),
                ],
              ),
             // height: 35,
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
      padding: EdgeInsets.only(left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
                  SizedBox(height: 10),

                //           state == PhotoCrop.free || state == PhotoCrop.cropped
                // ? Container()
                // : Stack(
                //     children: <Widget>[
                //       GestureDetector(
                //         onTap: () {
                //             setState(() {

                //           //state=PhotoCrop.remove;
                //           state = PhotoCrop.free;
                //           imageFile = null;
                //         });
                //         },
                //         child: Container(
                //             color: Colors.teal,
                //             padding: EdgeInsets.only(
                //                 top: 10, bottom: 10, left: 30, right: 30),
                //             margin: EdgeInsets.only(bottom: 10),
                //             width: MediaQuery.of(context).size.width,
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: <Widget>[
                //                 Icon(Icons.arrow_back),
                //                 Text(
                //                   "  Back to Registration Form",
                //                   style: TextStyle(
                //                       color: Color(0xFF000000),
                //                       fontFamily: "sourcesanspro",
                //                       fontSize: 17,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //               ],
                //             )),
                //       ),
                //     ],
                //   ),
              ///////////////  image  picker ////////////////
            _isImage? Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
      Center(
        
        child: CircularProgressIndicator(),)
            ): Center(child: _buildButtonIcon()),
            SizedBox(height: 10,),
        

           growCommonRegisterContainer("Name", "Type here", false,
                TextInputType.text, nameController),
         growCommonRegisterContainer("Email", "Type here", false,
                TextInputType.emailAddress, mailController),
         growCommonRegisterContainer("Password", "Type here", true,
                TextInputType.text, passwordController),
          growCommonRegisterContainer("Confirm Password", "Type here", true,
                TextInputType.text, confirmPasswordController),

            ////////  Country and State /////////
        Container(
              width: MediaQuery.of(context).size.width,
              // height: 30,
              margin: EdgeInsets.only(left: 15, top: 20, bottom: 10),
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

        //  Container(
        //               alignment: Alignment.centerLeft,
        //               margin: EdgeInsets.only(left: 10, right: 10),
        //              padding: EdgeInsets.only(left: 10),
        //               width: MediaQuery.of(context).size.width,
        //               height: 40,
        //               decoration: BoxDecoration(
        //                 color: Color(0xFFFFFFFF),
        //                 borderRadius: BorderRadius.circular(20),
        //                 boxShadow: <BoxShadow>[
        //           BoxShadow(
        //             color: Colors.grey[200],
        //            // offset: Offset(3.0, 5.0),
        //             blurRadius: 16.0,
        //           ),
        //         ],
        //               ),
        //               child:                   CountryPicker(
                        
        //   dense: false,
        //   showFlag: false,  //displays flag, true by default
        //   showDialingCode: false, //displays dialing code, false by default
        //   showName: true, //displays country name, true by default
        //   onChanged: (Country country) {
        //     setState(() {
        //       _selected = country;
        //     });
        //   },
        //   selectedCountry: _selected,
        // ),
        //             ),



      ///////////////// Country///////////
      

      Padding(
   
            padding: const EdgeInsets.only(left: 10, right: 10,top: 10, bottom: 10),
            child: Container(
               
              //width: 350,
              decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.circular(20),
               boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                   // offset: Offset(3.0, 5.0),
                    blurRadius: 16.0,
                  ),
                ],
              ),
            //  height: 40,
              child: TextField(
                controller: countryController,
                obscureText: false,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Color(0xFF000000)),
                cursorColor: Color(0xFF9b9b9b),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  hintText: "Type Country",
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


        ////////////   State////////
Padding(
   
            padding: const EdgeInsets.only(left: 10, right: 10,top: 10, bottom: 10),
            child: Container(
               
              //width: 350,
              decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.circular(20),
               boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                   // offset: Offset(3.0, 5.0),
                    blurRadius: 16.0,
                  ),
                ],
              ),
            //  height: 40,
              child: TextField(
                controller: stateController,
                obscureText: false,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Color(0xFF000000)),
                cursorColor: Color(0xFF9b9b9b),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  hintText: "Type State",
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
            /////////// state dropdown ///////
            // Card(
            //   elevation: 4,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)),
            //   //  margin: EdgeInsets.only(top: 5),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 40,
            //     decoration: BoxDecoration(
            //         color: Color(0xFFFFFFFF),
            //         borderRadius: BorderRadius.circular(20)),
            //     child: DropdownButtonHideUnderline(
            //       child: DropdownButton<String>(
            //         items: _growerstates.map((String dropDownStringItem) {
            //           return DropdownMenuItem<String>(
            //               value: dropDownStringItem,
            //               child: Padding(
            //                 padding: EdgeInsets.only(left: 20),
            //                 child: Text(
            //                   dropDownStringItem,
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       color: Color(0xFF000000),
            //                       fontFamily: "standard-regular",
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w400),
            //                 ),
            //               ));
            //         }).toList(),
            //         onChanged: (String newValueSelected) {
            //           _groweronDropDownCitySelected(newValueSelected);
            //         },
            //         value: _growercurrentStateSelected,
            //       ),
            //     ),
            //   ),
            // ),

            ///////Dob//////
      Container(
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //width: 300,
                    //height: 30,
                    margin: EdgeInsets.only(left: 0, top: 15),
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

                           /////////// year dropdown ///////
                        Container(
                         // width: MediaQuery.of(context).size.width / 4,
                          height: 40,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                           boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                   // offset: Offset(3.0, 5.0),
                    blurRadius: 16.0,
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
                          //  width: MediaQuery.of(context).size.width / 4 +40,
                            height: 40,
                            margin: EdgeInsets.only(top: 10, right: 3),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                   // offset: Offset(3.0, 5.0),
                    blurRadius: 16.0,
                  ),
                ],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: _months.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          dropDownStringItem,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
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
                        /////////// day dropdown ///////
                        Container(
                        //  width: MediaQuery.of(context).size.width / 4 +10,
                          height: 40,
                          margin: EdgeInsets.only(top: 10, right: 3),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                           boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[200],
                   // offset: Offset(3.0, 5.0),
                    blurRadius: 16.0,
                  ),
                ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: dayCheck=="Twenty Eight"? _dayTwentyEight.map((String dropDownStringItem) {
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
                              :
                              dayCheck=="Twenty Nine"? _dayTwentyNine.map((String dropDownStringItem) {
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
                              :
                              dayCheck=="Thirty One"? _dayThirtyOne.map((String dropDownStringItem) {
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
                              : _dayThirty.map((String dropDownStringItem) {
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Color(0xFF01D56A).withOpacity(0.8),
                      disabledColor: Colors.grey,
                      //                     onPressed: (){
                      //                        Navigator.push(
                      // context,
                      // new MaterialPageRoute(
                      //     builder: (context) => DispensaryRegisterPage()));
                      //                     },

                      onPressed: _isLoading ? null : _handleLogin,
//
                      child: Text(_isLoading ? "Please wait..." : "Next"),
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

  // @override
  // userImage(File _image) {
  //   setState(() {
  //     this._image = _image;
  //   });
  // }
  void _uploadImage() async {

              setState(() {
 _isImage = true; 
});



    if (imageFile != null) {
      List<int> imageBytes = imageFile.readAsBytesSync();
      image = base64.encode(imageBytes);
      image = 'data:image/png;base64,' + image;
      var data = {'image': image};

      var res = await CallApi().postData(data, 'app/upload/images');
      var body = json.decode(res.body);
      imagePath = body["image_path"];
    } else {
      imagePath = null;
    }


        setState(() {
 _isImage = false; 
});

    // print("image");
    // print(imagePath);
  }
  void _handleLogin() async {

    if (nameController.text.isEmpty) {
      return _showMsg("Name is empty");
    } else if (mailController.text.isEmpty) {
      return _showMsg("Email is empty");
    } 
    else if (passwordController.text.isEmpty) {
      return _showMsg("Password is empty");
    }
     else if (confirmPasswordController.text.isEmpty) {
      return _showMsg("Confirm Password is empty");
    }
    else if (confirmPasswordController.text != passwordController.text) {
      return _showMsg("Password doesn't match");
    }
     else if (countryController.text.isEmpty ) {//_selected.name== "Select Country"
      return _showMsg("Country is empty");
    } 
    else if (stateController.text.isEmpty) {
      return _showMsg("State is empty");
    }
      else if( _currentYearSelected=="Year"){
        return _showMsg("Year is empty");
      }
      else if(_currentMonthsSelected=='Month'){
        return _showMsg("Month is empty");
      }
       
      else if( _currentDaySelected=='Day'){
        return _showMsg("Date is empty");
      }
    else if (phoneController.text.isEmpty) {
      return _showMsg("Phone number is empty");
    }
    setState(() {
      _isLoading = true;
    });

    // String base64Image = '';
    // if (_image != null) {
    //   List<int> imageBytes = await _image.readAsBytes();
    //   base64Image = base64Encode(imageBytes);
    // }

    var data = {
      'name': nameController.text,
      'email': mailController.text,
      'password': passwordController.text,
      'img': imagePath,
      'phone': phoneController.text,
      'country': countryController.text,//_selected.name,//_growercurrentCountrySelected,
      'state': stateController.text, //_growercurrentStateSelected,
      'birthday': _currentDaySelected +
          '-' +
          _currentMonthsSelected +
          '-' +
          _currentYearSelected,
    'userType': '3',
    'app_Token': "app_Token"
    };

    var res = await CallApi().postData(data, 'auth/register');
    var body = json.decode(res.body);

    print(body);
    // String body_msg = "$body";
    // print("Body : " + body_msg);

    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));

      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => DispensaryRegisterPage()));
    } else {
      if (body['message'].contains('ER_DUP_ENTRY')) {
        _showMsg("Email already exists");
      } else {
        _showMsg("Something is error");
      }
    }
    setState(() {
      _isLoading = false;
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

      Widget _buildButtonIcon() {
    if (state == PhotoCrop.free){
    return GestureDetector(

      onTap: (){
        _pickImage();
      },
          child: Stack(
                      children: <Widget>[
                        new Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                    border: Border.all(
                          width: 3, color: Color(0xFF01d56a).withOpacity(0.4)),
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/camera.png',
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                                      Positioned(
                              child: Container(
                                  width: 35,
                                  height: 35,
                                  margin: EdgeInsets.only(top: 70, left: 80),
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
    );
    }
     // return Icon(Icons.add);
    else if (state == PhotoCrop.picked)
      return Column(
        children: <Widget>[
                        imageFile == null ?Container(
                        padding: EdgeInsets.only(top: 100, bottom: 100),
                        child: Center(
                          child: Text(
                            'No Image Selected',
                           
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'MyriadPro',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        color: Colors.transparent,
                      ) :  Stack(
                        children: <Widget>[

                         
                          // Container(
                          //    padding: EdgeInsets.only(top: 100, bottom: 100),
                          //   child: Center(child:CircularProgressIndicator())),
                          //  Center(child: Image.file(imageFile)),
                               Container(
                                      decoration: BoxDecoration(
                                           border: Border.all(
                          width: 3, color: Color(0xFF01d56a).withOpacity(0.4)),
                                          shape: BoxShape.circle),
                                      child: ClipOval(
                                        child:Image.file(imageFile,
                                          height: 100,
                                        width: 100,
                                          fit: BoxFit.fill,
                                        )
                                        //  Image.asset(
                                        //    imageFile,
                                        //  // 'assets/images/nen.jpg',
                                        //   height: 85,
                                        //   width: 85,
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                        ],
                      ), 
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                Container(
                 
              // padding: EdgeInsets.all(8),
               decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Color(0xFF01d56a).withOpacity(0.8),
                  ),
               margin: EdgeInsets.only(right: 10, top: 10,bottom: 10),
               
                child: IconButton(
                 
                  icon: Icon(Icons.crop, color: Colors.white,),
                  
                  onPressed: (){
                    _cropImage();
                  },
                ),
              ),
            Container(
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                    color:  Color(0xFF01d56a).withOpacity(0.8),
                  ),
             //  padding: EdgeInsets.all(5),
               margin: EdgeInsets.only(left: 10, top: 10,bottom: 10),
               
                child: IconButton(
                 
                  icon: Icon(Icons.done, color: Colors.white),
                  onPressed: (){

                     _uploadImage();
                      setState(() {
                       state = PhotoCrop.cropped; 
                      });
                  },
                ),
              ),
            ],
          ) 
        ],
      );//Icon(Icons.crop);
    else if (state == PhotoCrop.cropped){

         
        
      return GestureDetector(
        onTap: (){
           _pickImage();
        },
              child: Stack(
                        children: <Widget>[
                          new Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                           border: Border.all(
                          width: 3, color: Color(0xFF01d56a).withOpacity(0.4)),
                                          shape: BoxShape.circle),
                                      child: ClipOval(
                                        child:Image.file(imageFile,
                                          height: 100,
                                        width: 100,
                                          fit: BoxFit.fill,
                                        )
                                        //  Image.asset(
                                        //    imageFile,
                                        //  // 'assets/images/nen.jpg',
                                        //   height: 85,
                                        //   width: 85,
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                                        Positioned(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                  margin: EdgeInsets.only(top: 70, left: 80),
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
      );
                 
                    }// imageFile != null ? Image.file(imageFile) : Container(); //Icon(Icons.clear);
    else
      return Container();
  }

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery,
    imageQuality: 80
    );
    if (imageFile != null) {
      setState(() {
        state = PhotoCrop.picked;
      });
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      toolbarTitle: 'Cropper',
      toolbarColor: Colors.blue,
      toolbarWidgetColor: Colors.white,
    );
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
       // state = PhotoCrop.free; 
        state = PhotoCrop.cropped;
      });
    }
      _uploadImage();
  }
}
