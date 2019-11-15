import 'package:cannagrowdev/screen/ProfilePage/ProfilePage.dart';
import 'package:cannagrowdev/screen/StorePage/storePage.dart';
import 'package:flutter/material.dart';

class WidgetListPage extends StatefulWidget {
  WidgetListPage({this.color, this.title});
  final MaterialColor color;
  final String title;

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  var bottomItemIndex;


  final List bottomItemList = [ShopPage(), ShopPage(), ShopPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    if (widget.title == "Home") {
      bottomItemIndex = bottomItemList[0];
    } else if (widget.title == "Store Front") {
      bottomItemIndex = bottomItemList[1];
    } 
    else if (widget.title == "Message") {
      bottomItemIndex = bottomItemList[2];
    }
    else if (widget.title == "Profile") {
      bottomItemIndex = bottomItemList[3];
    }
    return Scaffold(
        body: Container(
     // color: Colors.white,
      child: bottomItemIndex,
    ));
  }
}
