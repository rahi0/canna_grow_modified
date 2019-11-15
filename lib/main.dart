
import 'package:cannagrowdev/screen/loginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'BottomApp/bottomApp.dart';
import 'ImportFile/ImportPages.dart';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   
    statusBarColor: Color(0xFF51b382)// status bar color
  ));
 runApp(CannaGrow());
}

int index = 0;

final store = Store<AppState>(reducer, initialState: AppState(
    allItemsData: [],
     data: {},
     notificationCount:0,
     connection: true,
    reviewList: [],
    avgReview: 0.0,
    orderList: [],
    orderDetails: [],
    notifiCheck: true,
    notiList: [],
    isOrder: false,
    isProduct: false,
    isHome: false,
    isShop: false
), middleware: [thunkMiddleware]);

class CannaGrow extends StatefulWidget {

  
  @override
  _CannaGrowState createState() => _CannaGrowState();
}

class _CannaGrowState extends State<CannaGrow> {


    bool _isLoggedIn = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }
  void _checkIfLoggedIn() async{
      // check if token is there
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');
      print(token);
      if(token!= null){
         setState(() {
            _isLoggedIn = true;
         });
      }
  }
  @override
  Widget build(BuildContext context) {
     // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return  StoreProvider<AppState>( 
      store: store,
      
          child: MaterialApp(
           
          debugShowCheckedModeBanner: false, 
          home:  
            _isLoggedIn?
            StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, items) =>  Navigation()) : LogIn()) 
        
    );
      
   
  }
}



// Name:CannaGrowKey
// Key ID:UML336BS8V



