

import 'package:cannagrowdev/ImportFile/ImportPages.dart';

import 'image_picker_dialog.dart';

class ImagePickerHandler {
  //ImagePickerDialog imagePicker;
  AnimationController _controller;
  ImagePickerListener _listener;

  //ImagePickerHandler(this._listener, this._controller);

  openCamera() async {
    //imagePicker.dismissDialog();
    // var image = await ImagePicker.pickImage(source: ImageSource.camera);
    // cropImage(image);
  }

  openGallery() async {
    //imagePicker.dismissDialog();
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // cropImage(image);
  }

  void init() {
    //imagePicker = new ImagePickerDialog(this, _controller);
    //imagePicker.initState();
  }

  Future cropImage(File image) async {
    // File croppedFile = await ImageCropper.cropImage(
    //   sourcePath: image.path,
    //   ratioX: 1.0,
    //   ratioY: 1.0,
    //   maxWidth: 512,
    //   maxHeight: 512,
    // );
    //_listener.userImage(croppedFile);
    print("this is the image path" + image.path);
  }

  showDialog(BuildContext context) {
    //imagePicker.getImage(context);
  }
}

abstract class ImagePickerListener {
  userImage(File _image);
}