import 'package:cannagrowdev/BottomApp/bottomApp.dart';
import 'package:cannagrowdev/ImagePicker/image_picker_handler.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';
import 'package:cannagrowdev/redux/thunk.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import 'package:image_cropper/image_cropper.dart';


class StoreForm extends StatefulWidget {
  @override
  _StoreFormState createState() => _StoreFormState();
}

class _StoreFormState extends State<StoreForm>
    with TickerProviderStateMixin//, ImagePickerListener 
    {
  TextEditingController itemNameController = TextEditingController();
  // TextEditingController deliveryFeeController = TextEditingController();
  TextEditingController cannaGrowFeeController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController netSaleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

 // File _image;
  String shop_id = '';
  var deliveryFee = "";
  AnimationController _controller;
  var dispensaryData;
   PhotoCrop state;

  File imageFile;
   String image;
  var imagePath=null;
   bool _isImage= false;

  //ImagePickerHandler imagePicker;

  @override
  void initState() {
     state = PhotoCrop.free;
    bottomNavIndex = 1;
    super.initState();
    _getUserInfo();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // imagePicker = new ImagePickerHandler(this, _controller);
    // imagePicker.init();
    // deliveryFeeController.text = "0.00";
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');
    print(dispensaryJson);
    var user = json.decode(userJson);
    var dispensary = json.decode(dispensaryJson);
    setState(() {
      //userData = user;
      dispensaryData = dispensary;
    });
    shop_id = '${dispensaryData['id']}';
    deliveryFee = '${dispensaryData['deliveryFee']}';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //    Future<File> fileImage;

  // pickImagefromGallery(ImageSource src) {
  //   setState(() {
  //     fileImage = ImagePicker.pickImage(source: src);
  //   });
  // }

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

  Container productEntryContainer(String label, String field,
      TextInputType type, TextEditingController control, int line) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
             width: MediaQuery.of(context).size.width/2-80,
            //height: 10,
            margin: EdgeInsets.only(left: 30, top: 20, bottom: 8),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "grapheinpro-black",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////   textfield /////////
          ///
           Expanded(
                        child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 10, top: 3, bottom: 2),
                 child: Card(
                   elevation: 0.2,
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
                     width: MediaQuery.of(context).size.width/2+20,
                  //   height: 35,

                     child: SingleChildScrollView(
                       scrollDirection: Axis.vertical,
                       child: TextField(
                                              style: TextStyle(color: Color(0xFF000000)),
                         keyboardType: type,
                         controller: control,
                        // maxLength: 250,
                         maxLines: line,
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
                               fontSize: 14,
                               fontFamily: "standard-regular",
                               fontWeight: FontWeight.w400),
                           contentPadding:
                               EdgeInsets.only(left: 20, bottom: 10, top: 12, right: 12),
                           fillColor: Color(0xFFFFFFFF),
                           filled: true,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
           ),

          // Expanded(
          //             child: Padding(
          //     padding:
          //         const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
          //     child: Card(
          //       elevation: 6,
          //        shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(20),
          //        ),
          //                   child: Container(
                
          //         //width: 350,
          //         decoration: BoxDecoration(
          //           //color: Colors.red,
          //           borderRadius: BorderRadius.circular(20),
          //           // boxShadow: <BoxShadow>[
          //           //   BoxShadow(
          //           //     color: Colors.black.withOpacity(0.5),
          //           //     offset: Offset(1.0, 2.0),
          //           //     blurRadius: 5.0,
          //           //   ),
          //           // ],
          //         ),
          //         height: 35,
          //         width: MediaQuery.of(context).size.width / 2 + 20,
          //         child: TextField(
          //           maxLines: line,
          //           controller: control,
          //           keyboardType: type,
          //           style: TextStyle(color: Color(0xFF000000)),
          //           cursorColor: Color(0xFF9b9b9b),
          //           decoration: InputDecoration(
          //             focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(20),
          //                 borderSide: BorderSide(color: Color(0xFFFFFFFF))),
          //             enabledBorder: UnderlineInputBorder(
          //                 borderRadius: BorderRadius.circular(20),
          //                 borderSide: BorderSide(color: Color(0xFFFFFFFF))),
          //             hintText: "Type here",
          //             hintStyle: TextStyle(
          //                 color: Color(0xFF9b9b9b),
          //                 fontSize: 15,
          //                 fontFamily: "sourcesanspro",
          //                 fontWeight: FontWeight.w300),
          //             contentPadding:
          //                 EdgeInsets.only(left: 20, bottom: 10, top: 10,right: 10),
          //             fillColor: Color(0xFFFFFFFF),
          //             filled: true,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container showPriceContainer(String label, String field) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////////////label///////////
          Container(
          //  width: MediaQuery.of(context).size.width,
            //height: 10,
             margin: EdgeInsets.only(left: 20, top: 15, bottom: 8),
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
           // padding: const EdgeInsets.only(left: 10, right: 10),
             padding: const EdgeInsets.only(left: 12, right: 10, top: 5, bottom: 8),
            child: Card(
              elevation: 4,
            //  margin: EdgeInsets.only(right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width/2+20,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
  ///////////////  image  picker ////////////////
             _isImage? 
      Center(child: CircularProgressIndicator(),):Container(
              child: _buildButtonIcon()),

          /////////////   photo kaj kore na /////
          // Stack(
          //   children: <Widget>[
          //     Container(
          //       margin: EdgeInsets.only(bottom: 1.0, top: 10),
          //       child: GestureDetector(
          //         //onTap: () => imagePicker.showDialog(context),a
          //         child: new Center(
          //             child: _image == null
          //                 ? new Stack(
          //                     children: <Widget>[
          //                       new Container(
          //                         child: Column(
          //                           children: <Widget>[
          //                             Container(
          //                               decoration: BoxDecoration(
          //                                   shape: BoxShape.rectangle),
          //                               child: Image.asset(
          //                                 "assets/images/landscape.png",
          //                                 height: 120,
          //                                 width: 150,
          //                                 fit: BoxFit.cover,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Positioned(
          //                         child: Container(
          //                             width: 35,
          //                             height: 35,
          //                             margin:
          //                                 EdgeInsets.only(top: 100, left: 135),
          //                             decoration: new BoxDecoration(
          //                               shape: BoxShape.circle,
          //                               color: Color(0xFF01D56A),
          //                             ),
          //                             child: Icon(
          //                               Icons.photo_camera,
          //                               color: Color(0xFFFFFFFF),
          //                             )),
          //                       )
          //                     ],
          //                   )
          //                 : Stack(
          //                     children: <Widget>[
          //                       Container(
          //                         height: 120.0,
          //                         width: 150.0,
          //                         decoration: new BoxDecoration(
          //                           color: const Color(0xff7c94b6),
          //                           shape: BoxShape.rectangle,
          //                           image: new DecorationImage(
          //                             image: new ExactAssetImage(_image.path),
          //                             fit: BoxFit.cover,
          //                           ),
          //                         ),
          //                       ),
          //                       Positioned(
          //                         child: Container(
          //                             width: 35,
          //                             height: 35,
          //                             margin:
          //                                 EdgeInsets.only(top: 90, left: 125),
          //                             decoration: new BoxDecoration(
          //                               shape: BoxShape.circle,
          //                               color: Color(0xFF01D56A),
          //                             ),
          //                             child: Icon(
          //                               Icons.photo_camera,
          //                               color: Color(0xFFFFFFFF),
          //                             )),
          //                       )
          //                     ],
          //                   )),
          //       ),
          //     ),
          //   ],
          // ),


          SizedBox(height: 10),
       
       
       //  state == PhotoCrop.picked?Container():
          productEntryContainer("Name", "Type Here", TextInputType.text,
              itemNameController, 1),
     //   state == PhotoCrop.picked?Container(): 
         productEntryContainer("Price", "Type Here",
              TextInputType.number, productPriceController,1),
       //  state == PhotoCrop.picked?Container():
            productEntryContainer("Quantity", "Type Here",
              TextInputType.number, quantityController,1),


                  /////////// tag field //////

                  // Container(
                  //  // margin: EdgeInsets.only(top: 15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       ////////  tag /////////
                  //       Container(
                  //        width: MediaQuery.of(context).size.width/2-80,
                  //         //height: 35,
                  //        margin: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  //         child: Text(
                  //           "Tags",
                  //           textAlign: TextAlign.left,
                  //           style: TextStyle(
                  //               color: Color(0xFF000000),
                  //               fontFamily: "grapheinpro-black",
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //       ),

                  //       ////////  tag textfield /////////

                  //       Expanded(
                  //                                 child: Container(
                  //            padding: const EdgeInsets.only(left: 12, right: 10, top: 3, bottom: 2),
                  //           child: Card(
                  //             elevation: 6,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(20),
                  //             ),
                  //             child: Container(
                  //               width: MediaQuery.of(context).size.width/2+20,
                  //               height: 85,
                  //               child: SingleChildScrollView(
                  //                 scrollDirection: Axis.vertical,
                  //                     child: TextField(
                  //                   maxLines: 2,
                  //                 //  maxLength: 50,
                  //                   style: TextStyle(color: Color(0xFF000000)),
                  //                   keyboardType: TextInputType.text,
                  //                   controller: tagController,
                  //                   cursorColor: Color(0xFF9b9b9b),
                  //                   decoration: InputDecoration(
                  //                     focusedBorder: OutlineInputBorder(
                  //                         borderRadius: BorderRadius.circular(20),
                  //                         borderSide: BorderSide(color: Color(0xFFFBFBFB))),
                  //                     enabledBorder: UnderlineInputBorder(
                  //                         borderRadius: BorderRadius.circular(20),
                  //                         borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                  //                     hintText: "Type here",
                  //                     hintStyle: TextStyle(
                  //                         color: Color(0xFF9b9b9b),
                  //                         fontSize: 12,
                  //                         fontFamily: "standard-regular",
                  //                         fontWeight: FontWeight.w400),
                  //                     contentPadding:
                  //                         EdgeInsets.only(left: 20, bottom: 10, top: 7, right: 12),
                  //                     fillColor: Color(0xFFFFFFFF),
                  //                     filled: true,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  /////////// description field //////

              // state == PhotoCrop.picked?Container(): 
                Container(
                   // margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ////////  tag /////////
                        Container(
                          width: MediaQuery.of(context).size.width/2-80,
                          //height: 35,
                         margin: EdgeInsets.only(left: 30, top: 10, bottom: 8),
                          child: Text(
                            "Description",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: "grapheinpro-black",
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                        ////////  Description textfield /////////

                        Expanded(
                                                  child: Container(
                             padding: const EdgeInsets.only(left: 12, right: 10, top: 5, bottom: 8),
                            child: Card(
                              elevation: 0.2,
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
                                width: MediaQuery.of(context).size.width/2+20,
                                height: 120,

                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: TextField(
                                                         style: TextStyle(color: Color(0xFF000000)),
                                    keyboardType: TextInputType.text,
                                    controller: descriptionController,
                                    maxLength: 250,
                                    maxLines: 3,
                                    cursorColor: Color(0xFF9b9b9b),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Color(0xFFFBFBFB))),
                                      enabledBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                                      hintText: "Type here",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 14,
                                          fontFamily: "standard-regular",
                                          fontWeight: FontWeight.w400),
                                      contentPadding:
                                          EdgeInsets.only(left: 20, bottom: 10, top: 12, right: 12),
                                      fillColor: Color(0xFFFFFFFF),
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

   //     state == PhotoCrop.picked?Container(): 
         Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Navigation()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 25),

                    ///////////////// "delete"///////////////
                    child: Text(
                      "Cancel",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          //decoration: TextDecoration.underline,
                          fontFamily: "standard-regular",
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                /////////////// add Button///////////////
                  
                  Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF01d56a).withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      //width: 150,
                      height: 42,
                      margin: EdgeInsets.only(right: 20),
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Icon(
                            //   Icons.add,
                            //   color: Colors.white,
                            // ),
                            Container(
                            
                              child: Text(
                                _isLoading ? 'Adding...' : 'Add',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'MyriadPro',
                                  fontWeight: FontWeight.normal,
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
                        onPressed: _isLoading ? null :_handleUpload,
                      )),
                // Container(
                //   margin: EdgeInsets.only(right: 20),
                //   padding: EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
                //   child: FlatButton(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //     color: Color(0xFF01D56A),
                //     disabledColor: Colors.grey,
                //     //                     onPressed: (){
                //     //                        Navigator.push(
                //     // context,
                //     // new MaterialPageRoute(
                //     //     builder: (context) => Home()));
                //     //                     },

                //     onPressed: _isLoading ? null : _handleUpload,
                //     child: Text(_isLoading ? "Adding..." : "Add"),

                //     // child: Text("Done"),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // @override
  // userImage(File _image) async {
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
    } 
    else {
   
         imagePath = null;   
     
    }

       setState(() {
 _isImage = false; 
});
  }
  void _handleUpload() async {
    if (itemNameController.text.isEmpty) {
      return _showMsg("Item Name is empty");
    } else if (productPriceController.text.isEmpty) {
      return _showMsg("Product Price is empty");
    } else if (quantityController.text.isEmpty) {
      return _showMsg("Quantity is empty");
    }
    //  else if (tagController.text.isEmpty) {
    //   return _showMsg("Tags is empty");
    // } 
    else if (descriptionController.text.isEmpty) {
      return _showMsg("Description is empty");
    }

    setState(() {
      _isLoading = true;
    });

    // cannaGrowFeeController.text =
    //     (double.parse(productPriceController.text) * (0.15)).toString();
    // netSaleController.text = (double.parse(productPriceController.text) -
    //         double.parse(cannaGrowFeeController.text))
    //     .toString();
    // priceController.text =
    //     (double.parse(netSaleController.text) + double.parse(deliveryFee))
    //         .toString();
   double price = double.parse(productPriceController.text);
    var tagList = [];

    for (int i = 0; i < tagController.text.length; i++) {
      tagList = tagController.text.split(",");
    }


    var data = {
      'name': itemNameController.text,
      //'deliveryFee': '',
      'img': imagePath,
      'growId': shop_id,
      'price':price,
      'netPrice': netSaleController.text,
      'tags': "tagList",
      'description': descriptionController.text,
      'productPrice': productPriceController.text,
      'eta': '1 hr 30 min',
      'quantity': quantityController.text,
    };
   print(data);
    var res = await CallApi().postData(data, 'app/items');
    var body = json.decode(res.body);
    // print(body);

    if (body['success']==true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      localStorage.setString('item', json.encode(body['item']));

      store.dispatch(addProducts(data));

      itemNameController.text = "";
      //deliveryFeeController.text = "";
      cannaGrowFeeController.text = "";
      productPriceController.text = "";
      netSaleController.text = '';
      priceController.text = "";
      quantityController.text = "";
      tagController.text = "";
      descriptionController.text = "";

      // Navigator.push(
      //     context, new MaterialPageRoute(builder: (context) => Navigation()));
   _showHintMsg();
   
    } else {
      return _showMsg("Something is wrong");
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
                                "Product has been uploaded successfully! ",
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
 
  
Widget _buildButtonIcon() {
    if (state == PhotoCrop.free){
    return GestureDetector(

      onTap: (){
        _pickImage();
      },
          child: Stack(
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        // border: Border(
                                        //   bottom: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   top: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   left: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   right: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        // ),
                                        shape: BoxShape.rectangle),
                                    child: Image.asset(
                                      'assets/images/medicine_icon.PNG',
                                      height: 110,
                                      width: 150,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                                      Positioned(
                              child: Container(
                                  width: 35,
                                  height: 35,
                                  margin: EdgeInsets.only(top: 80, left: 140),
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

                         Container(
                                child: Column(
                                  children: <Widget>[
                                 Container(
                                    decoration: BoxDecoration(
                                        // border: Border(
                                        //   bottom: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   top: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   left: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   right: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        // ),
                                        shape: BoxShape.rectangle),
                                    child: Image.file(
                                     imageFile,
                                      height: 110,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                          // Container(
                          //    padding: EdgeInsets.only(top: 100, bottom: 100),
                          //   child: Center(child:CircularProgressIndicator())),
                          //  Image.file(imageFile),
                        ],
                      ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                Container(
                 
              // padding: EdgeInsets.all(8),
               decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF01d56a).withOpacity(0.8),
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
                    color: Color(0xFF01d56a).withOpacity(0.8),
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
                                        // border: Border(
                                        //   bottom: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   top: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   left: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        //   right: BorderSide(
                                        //       width: 5, color: Colors.blue[100]),
                                        // ),
                                        shape: BoxShape.rectangle),
                                    child: Image.file(
                                     imageFile,
                                      height: 110,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ],
                                ),
                              ),
          Positioned(
                              child: Container(
                                  width: 35,
                                  height: 35,
                                  margin: EdgeInsets.only(top: 80, left: 130),
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
      return Container(
       // color: Colors.red,
      );
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
