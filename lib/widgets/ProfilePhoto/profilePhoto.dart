


import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class ProfilePhoto extends StatefulWidget {
  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> with TickerProviderStateMixin,ImagePickerListener {



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
                
                    alignment: Alignment.center,
                  
                    child:
                     Stack(
                      children: <Widget>[

                        Container(
                                
                                margin: EdgeInsets.only(bottom: 8.0),
                                child: GestureDetector(
        //onTap: () => imagePicker.showDialog(context),
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
                                    'assets/images/nen.jpg',
                                    height: 85,
                                    width: 85,
                                    fit: BoxFit.cover,
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

              Positioned(
                        child: Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.only(top: 60, left: 60),
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