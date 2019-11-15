


import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class ShowProfilePhoto extends StatefulWidget {
  @override
  _ShowProfilePhotoState createState() => _ShowProfilePhotoState();
}

class _ShowProfilePhotoState extends State<ShowProfilePhoto> with TickerProviderStateMixin,ImagePickerListener {



/////
  File _image;
  AnimationController _controller;
  //ImagePickerHandler imagePicker;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // imagePicker=new ImagePickerHandler(this,_controller);
    // imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  ////// 

  @override
  Widget build(BuildContext context) {
    return  Container(
                 // margin: EdgeInsets.only(left: 80),
                    //color: Colors.red, 
                    alignment: Alignment.center,
                   // width: MediaQuery.of(context).size.width,
                    child:
                     Stack(
                      children: <Widget>[

                        Container(
                                margin: EdgeInsets.only(bottom: 8.0, top: 15),
                                child: GestureDetector(
       // onTap: () => imagePicker.showDialog(context),
        child: new Center(
          child: _image == null
              ? new Stack(
                  children: <Widget>[
                    new Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 5, color: Colors.blue[100]),
                                      top: BorderSide(
                                          width: 5, color: Colors.blue[100]),
                                      left: BorderSide(
                                          width: 5, color: Colors.blue[100]),
                                      right: BorderSide(
                                          width: 5, color: Colors.blue[100]),
                                    ),
                                    shape: BoxShape.circle),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/shop.jpg',
                                    height: 85,
                                    width: 85,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                                

                  ],
                )
              : Stack(
                children: <Widget>[
                  Container(
                height: 90.0,
                width: 90.0,
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  border: Border(
                                    bottom: BorderSide(
                                        width: 5, color: Colors.blue[100]),
                                    top: BorderSide(
                                        width: 5, color: Colors.blue[100]),
                                    left: BorderSide(
                                        width: 5, color: Colors.blue[100]),
                                    right: BorderSide(
                                        width: 5, color: Colors.blue[100]),
                                  ),
                                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    
                    image: new ExactAssetImage(_image.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

                ], 
              )
        ),
      ),
                              ),
                        
                      ],
                    ),
                  );
  }


  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}