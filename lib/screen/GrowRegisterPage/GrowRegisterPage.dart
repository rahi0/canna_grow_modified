



import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class GrowRegisterPage extends StatefulWidget {
  @override
  _GrowRegisterPageState createState() => _GrowRegisterPageState();
}

class _GrowRegisterPageState extends State<GrowRegisterPage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            child: Card(
              margin: EdgeInsets.only(left: 15, top: 35, right: 15, bottom: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                 
                 
                      GrowRegisterForm(),


                      
                       
                      ],
                    ),
                  ),
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     new MaterialPageRoute(
                        //         builder: (context) => LogIn()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                       
                            //   margin: EdgeInsets.only(left:20),
                              IconButton(
                        icon: Icon(
                          Icons.cancel,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        //
                        //size: 30,
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
