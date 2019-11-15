

import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class EditShopPage extends StatefulWidget {
  @override
  _EditShopPageState createState() => _EditShopPageState();
}

class _EditShopPageState extends State<EditShopPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

    appBar: AppBar(
        //elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF01d56a),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        title: Text(
          'Edit Shop',
          style: TextStyle(
            color: Color(0xFF01d56a),
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
             // margin: EdgeInsets.only(top: 10),
              child: Stack(
                children: <Widget>[
                  
            ///////////Form/////////
                  EditShopForm(),

                                 ],
              ),
            ),
          ),
        )
        // body: SafeArea(
        //           child: SingleChildScrollView(
        //             child: Container(
        //       margin: EdgeInsets.only(top: 20),
        //       child: Stack(
        //         children: <Widget>[
                  
        //     ///////////Form/////////
        //           EditShopForm(),

           
        //         ],
        //       ),
        //     ),
        //   ),
        // )
        );
  }
}



