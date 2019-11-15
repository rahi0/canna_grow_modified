import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageCropper',
      home: MyHomePage(
        title: 'ImageCropper',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _MyHomePageState extends State<MyHomePage> {
  AppState state;
  File imageFile;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
         child: _buildButtonIcon(),
        // child:GestureDetector(
        //   onTap: (){
        //       if (state == AppState.free)
        //     _pickImage();
        //   else if (state == AppState.picked)
        //     _cropImage();
        //   else if (state == AppState.cropped) _clearImage();
        //   },
        //           child: _buildButtonIcon(),
                  
        // )
        //child: imageFile != null ? Image.file(imageFile) : Container(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (state == AppState.free)
      //       _pickImage();
      //     else if (state == AppState.picked)
      //       _cropImage();
      //     else if (state == AppState.cropped) _clearImage();
      //   },
      //   child: _buildButtonIcon(),
      // ),
    );
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free){
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
                    ),
    );
    }
     // return Icon(Icons.add);
    else if (state == AppState.picked)
      return Column(
        children: <Widget>[
          imageFile != null ? Image.file(imageFile) : Container(),
          IconButton(
            icon: Icon(Icons.crop),
            onPressed: (){
_cropImage();
            },
          ) 
        ],
      );//Icon(Icons.crop);
    else if (state == AppState.cropped)
      return Stack(
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
                                    child: Image.file(imageFile,
                                      height: 85,
                                      width: 85,
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
                    );// imageFile != null ? Image.file(imageFile) : Container(); //Icon(Icons.clear);
    else
      return Container();
  }

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        state = AppState.picked;
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
        state = AppState.cropped;
      });
    }
  }

  Future<Null> _saveImage() async {

  }

  void _clearImage() {
   // imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }
}