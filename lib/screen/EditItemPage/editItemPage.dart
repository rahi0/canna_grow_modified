import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class EditItemPage extends StatefulWidget {
  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {

  

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
          'Edit Item',
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
                  EditItemForm(),

      
                ],
              ),
            ),
          ),
        )
        );
  }
}
