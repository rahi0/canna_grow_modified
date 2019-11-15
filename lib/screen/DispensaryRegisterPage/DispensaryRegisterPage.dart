


import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class DispensaryRegisterPage extends StatefulWidget {
  @override
  _DispensaryRegisterPageState createState() => _DispensaryRegisterPageState();
}

class _DispensaryRegisterPageState extends State<DispensaryRegisterPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
                  backgroundColor: Colors.white,
      //backgroundColor: Colors.grey[200],
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
                onPressed: (){

                       goFirst
                            ? Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => LogIn()))
                            : 

                            Navigator.of(context).pop();
                            // Navigator.push(
                            //     context,
                            //     new MaterialPageRoute(
                            //         builder: (context) => Navigation()));

          },
            );
          },
        ),
        title: Text(
          'Add Shop',
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
              //margin: EdgeInsets.only(top: 20),
              child: Stack(
                children: <Widget>[
                  
            ///////////Form/////////
                  DispensaryRegisterForm(),

                                 ],
              ),
            ),
          ),
        )
        );
  }
}

