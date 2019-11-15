

import 'package:cannagrowdev/BottomApp/bottomApp.dart';
import 'package:cannagrowdev/ImagePicker/image_picker_handler.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
import 'package:cannagrowdev/form/pp.dart';
// import 'package:cannagrowdev/screen/CountryDetails/CountryDetails.dart';
// import 'package:cannagrowdev/screen/CountryDetails/CountryModel.dart';
import 'package:cannagrowdev/widgets/ProfilePhoto/profilePhoto.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_cropper/image_cropper.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

enum PhotoCrop {
  free,
  picked,
  cropped,
}

class _EditProfileFormState extends State<EditProfileForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController licenseExpController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

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
  PhotoCrop state;
  File imageFile;
   String image;
  var imagePath;
   bool _isImage= false;

  // File _image;
  // AnimationController _controller;
  //ImagePickerHandler imagePicker;

  var userData;
  var dispensaryData;

  bool _isLoading = false;

   bool _dispensaryIsEmpty = true;

    String date;
    String countryName;

//  Country _selected = Country( asset: "assets/flags/us_flag.png",
//     dialingCode: "1",
//     isoCode: "US",
//     name: "Select Country");

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

  //  Future<File> fileImage;

  // pickImagefromGallery(ImageSource src) {
  //   setState(() {
  //     fileImage = ImagePicker.pickImage(source: src);
  //   });
  // }
  
  @override
  void initState() {
    _getProfileInfo();
     state = PhotoCrop.free;
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
     if(dispensaryJson == null){
        _dispensaryIsEmpty = true;
    }
    else{
 var dispensary = json.decode(dispensaryJson);
    setState(() {
  
      dispensaryData = dispensary;
       _dispensaryIsEmpty = false;
    });
    // licenseNumberController.text = '${dispensaryData['license']}';
    // licenseExpController.text =  '${dispensaryData['licenseExpiration']}';
    // addressController.text =  '${dispensaryData['address']}';
    // latitudeController.text =  '${dispensaryData['lat']}';
    // longitudeController.text =  '${dispensaryData['lng']}';

    
    } 
    nameController.text = '${userData['name']}';
    birthdayController.text =  '${userData['birthday']}';
    phoneController.text = '${userData['phone']}';
    stateController.text ='${userData['state']}';
    countryController.text ='${userData['country']}';
    countryName = '${userData['country']}';
      format = DateFormat("yyyy-MM-dd").format(selectedDate);
    date = '${userData['birthday']}';

    // _selected = Country( asset: "assets/flags/us_flag.png",
    // dialingCode: "1",
    // isoCode: "US",
    // name: countryName);

    imagePath = '${userData['img']}';

  
    // mailController.text = '${userData['email']}';
    // passwordController.text = '${userData['password']}';
    // confirmPasswordController.text = '${userData['password']}';
  }

  Container editProfileContainer(String label, TextEditingController control,
      TextInputType value, bool secure,String text) {
    return Container(
      margin: EdgeInsets.only(top: 10,right: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ////////  name /////////
          Container(
            width: MediaQuery.of(context).size.width / 3 - 30,
            margin: EdgeInsets.only(left: 25),
            //color: Colors.blue,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF343434),
                  fontFamily: "sourcesanspro",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////  name textfield /////////

          Expanded(
            
                      child: Card(
                                        margin: EdgeInsets.only(right: 10),
              elevation: 0.2,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

                height: 40,
                child: TextField(
                  style: TextStyle( color: Colors.grey[600],
                                  fontFamily: "sourcesanspro",
                                  fontSize: 14,
                                 fontWeight: FontWeight.w500),
                  controller: control,
                  cursorColor: Color(0xFF9b9b9b),
                  obscureText: secure,
                  keyboardType: value,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xFFFBFBFB))),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                        hintText: text,
                    contentPadding:
                        EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    fillColor: Color(0xFFFFFFFF),
                    filled: true,
                  ),
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         
         SizedBox(height: 20),
           ///////////////  image  picker ////////////////
          _isImage? 
      Center(child: CircularProgressIndicator(),): Center(child: _buildButtonIcon()),
      SizedBox(height: 15,),
          ///////// name field //////
      //   state == PhotoCrop.picked?Container(): 
         editProfileContainer(
              "Name", nameController, TextInputType.text, false,nameController.text),

          // editProfileContainer("Date of Birth", birthdayController,
          //     TextInputType.text, false,birthdayController.text),

            //  state == PhotoCrop.picked?Container():  
              Container(
      margin: EdgeInsets.only(top: 10,right: 5),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ////////  name /////////
          Container(
            width: MediaQuery.of(context).size.width / 3 - 30,
            margin: EdgeInsets.only(left: 25),
            //color: Colors.blue,
            child: Text(
              "Date of Birth",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF343434),
                  fontFamily: "sourcesanspro",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
           Expanded(
                      child: Card(
                        elevation: 0.2,
                      margin: EdgeInsets.only(right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                                                child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15),
                          
                                        child:Text(
            // widget.cannagoData!=null && widget.cannagoData['medicalCannabisExpiration']!= null ? date.toString() : '',
             userData!= null ? date.toString():"",
              textAlign: TextAlign.right,
                 style: TextStyle( color: Colors.grey[600],
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
                      ),
          ),

          ////////  name textfield /////////

         
        ],
      ),
    ),
  
         // state == PhotoCrop.picked? Container():
           editProfileContainer(
              "Phone", phoneController, TextInputType.number, false,phoneController.text),
             //   state == PhotoCrop.picked?   Container(): 
                 editProfileContainer(
              "State", stateController, TextInputType.text, false,stateController.text),
      // state == PhotoCrop.picked?  Container():  
//        Container(
//       margin: EdgeInsets.only(top: 10, right: 10),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           ////////  name /////////
//           Container(
//             width: MediaQuery.of(context).size.width / 3 - 30,
//             margin: EdgeInsets.only(left: 25),
//             //color: Colors.blue,
//             child: Text(
//               "Country",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                   color: Color(0xFF343434),
//                   fontFamily: "sourcesanspro",
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
// // Expanded(
// //                             child: Container(
// //                         alignment: Alignment.centerLeft,
                        
// //                        padding: EdgeInsets.only(left: 10),
// //                          margin: EdgeInsets.only(right: 10),
// //                         height: 40,
// //                            decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(20),
// //                 boxShadow: <BoxShadow>[
// //                   BoxShadow(
// //                     color: Colors.grey[200],
// //                     // offset: Offset(1.0, 2.0),
// //                     blurRadius: 14.0,
// //                   ),
// //                 ],
// //               ),
// //                         child:                   CountryPicker(
                          
// //           dense: false,
// //           showFlag: false,  //displays flag, true by default
// //           showDialingCode: false, //displays dialing code, false by default
// //           showName: true, //displays country name, true by default
// //           onChanged: (Country country) {
// //             setState(() {
// //                 _selected = country;
// //             });
// //           },
// //           selectedCountry: _selected,
// //         ),
// //                       ),
// //              ),
          

         
//         ],
//       ),
//     ),
                  editProfileContainer(
              "Country", countryController, TextInputType.text, false,countryController.text),

          // profileContainer("Store's Hour", "Type here"),
        
        
        // state == PhotoCrop.picked? Container():  
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF01d56a).withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                 // width: MediaQuery.of(context).size.width / 3,
                  height: 42,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 3),
                          child: Text(
                            _isLoading ? 'Saving...' : 'Save',
                            //textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'MyriadPro', 
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    color: Colors.transparent,
                    // elevation: 4.0,
                    //splashColor: Colors.blueGrey,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    disabledColor: Colors.grey,
                    onPressed: _isLoading ? null : _handleSaveProfile,
                  )),
            ],
          ),
        ],
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
      print(res);
      var body = json.decode(res.body);

      print(body);
      imagePath = body["image_path"];
    }
    setState(() {
 _isImage = false; 
});

  }

  void _handleSaveProfile() async {
   

     if(nameController.text.isEmpty){
        return _showMsg("Name is empty");
      }

        else if (date.isEmpty) {
      return _showMsg("Birth Date is empty");
    }

       else if (stateController.text.isEmpty) {
      return _showMsg("State is empty");
    } 

        else if (countryController.text.isEmpty) {
      return _showMsg("Country is empty");
    }
   

       else if(phoneController.text.isEmpty){
        return _showMsg("Phone number is empty");
      }


    var userdata = {
      'name': nameController.text,
      'email': '${userData['email']}',
      'img': imagePath,
      'phone': phoneController.text,
      'id': '${userData['id']}',
      'country': countryController.text,//_selected.name
      'state': stateController.text,
      'birthday': date//birthdayController.text,
    };

    setState(() {
      _isLoading = true;
    });

    var res = await CallApi().postData(userdata, 'app/userEdit');
    var body = json.decode(res.body);
    print(body);
    
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.setString('user', json.encode(body['user']));
   
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Navigation()));
    } else {     

      _showMsg("Something is wrong");
    } 

    setState(() {
      _isLoading = false;
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
                                      child: imagePath!= null
                              ? 
                              Image.network(
                                        
                                      "https://www.dynamyk.biz"+imagePath,
                                  //  'https://picsum.photos/250?image=9',
                                        height: 100,
                                          width: 100,
                                        fit: BoxFit.fill,
                                      ) 
                           
                                      :
                                      Image.asset(
                                        
                                                 'assets/images/camera.png',
                                       // 'assets/images/camera.png',
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
                                 
                                  margin: EdgeInsets.only(top: 70, left: 80),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF01D56A),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.photo_camera,
                                      color: Color(0xFFFFFFFF),
                                    ),
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
                          //   Center(child: Image.file(imageFile)),
                          Container(
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
                              )
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
                                 
                                  margin: EdgeInsets.only(top: 70, left: 80),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF01D56A),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.photo_camera,
                                      color: Color(0xFFFFFFFF),
                                    ),
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
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality: 80);
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
