

import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class DispensaryCommonRegisterPage extends StatefulWidget {
  @override
  _DispensaryCommonRegisterPageState createState() => _DispensaryCommonRegisterPageState();
}

class _DispensaryCommonRegisterPageState extends State<DispensaryCommonRegisterPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
                  child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Stack(
              children: <Widget>[
                
          ///////////Form/////////
               DispensaryCommonRegisterForm(),
          ///////////Positioned Cross Button/////////
          
          // Container(
          //   margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       GestureDetector(
          //         onTap: (){
          //           Navigator.pop(context);
          //         },
          //                       child: Container(
          //           height: 30,
          //           width: 30,
          //           alignment: Alignment.center,
                   
          //           child: Icon(Icons.cancel, color: Colors.black,),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
              ],
            ),
          ),
        )
        );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       resizeToAvoidBottomPadding: false,
//       body: SafeArea(
//               child: SingleChildScrollView(
         
//           child: Card(
//             margin: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
//             elevation: 4,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             child: Stack(
//               children: <Widget>[
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[

//                       DispensaryCommonRegisterForm(),
                     
                    
              
//                   ],
//                 ),
//                 Positioned(
//                   child: InkWell(
//                     onTap: () {
//                       //   Navigator.push(
//                       // context,
//                       // new MaterialPageRoute(
//                       //   builder: (context) => LogIn()
//                       // ));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(
//                             Icons.cancel,
//                           ),
//                           onPressed: (){
//                             Navigator.pop(context);
//                           },
//                           //
//                           //size: 30,
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }


// }
