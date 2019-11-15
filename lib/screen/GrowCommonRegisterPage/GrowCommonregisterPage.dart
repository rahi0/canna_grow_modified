




import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class GrowCommonRegisterPage extends StatefulWidget {
  @override
  _GrowCommonRegisterPageState createState() => _GrowCommonRegisterPageState();
}

class _GrowCommonRegisterPageState extends State<GrowCommonRegisterPage> {

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
              child: SingleChildScrollView(
         
          child: Card(
            margin: EdgeInsets.only(left: 15, top: 35, right: 15, bottom: 10),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                        GrowCommonRegisterForm(),
                    
              
                  ],
                ),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      //   Navigator.push(
                      // context,
                      // new MaterialPageRoute(
                      //   builder: (context) => LogIn()
                      // ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.cancel,
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
