
import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
         appBar: AppBar(
        //elevation: 0,
        automaticallyImplyLeading: false,
              leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back_ios,color:Color(0xFF01d56a),),
        onPressed: () { 
          Navigator.of(context).pop();
        },
       
      );
    },
  ), 
        title: Text(
          'Add Item',
          style: TextStyle(
          color:Color(0xFF01d56a),
           // fontSize: 21.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
       // centerTitle: true,
      ),
        body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Stack(
                children: <Widget>[
                  
            ///////////Form/////////
                StoreForm(),

            ///////////Positioned Cross Button/////////
            
            // Container(
            //   margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
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
          ),
        )
        );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          backgroundColor: Colors.grey[200],
//         resizeToAvoidBottomPadding: false,
//           body: 
//           SafeArea(
//                       child: Container(
            
//                  child: Card(
//                     margin: EdgeInsets.only(left: 5, top: 10,right: 5, bottom: 10),
                    
                    
//                    elevation: 4,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(20)
//                    ),
//                    child: Stack(
//                      children: <Widget>[
                      
//                        SingleChildScrollView(
//                                               child: Container(
//                            padding: EdgeInsets.only(bottom: 10, top: 10),
//                           decoration: BoxDecoration(
//              color: Colors.grey[200],
//              borderRadius: BorderRadius.circular(20)
//                           ),
               
//                       child: StoreForm(),
//               ),
//                        ),

            
//                      ],
//                    ),
//                  ),
//                     ),
//           )

      
//     );
//   }
          
// }