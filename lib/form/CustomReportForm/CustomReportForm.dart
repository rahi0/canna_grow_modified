


import 'package:cannagrowdev/BottomApp/bottomApp.dart';
import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/api/api.dart';

class CustomReportForm extends StatefulWidget {
  var userData;
  var orderIdd;
  CustomReportForm(this.userData, this.orderIdd);
  @override
  _CustomReportFormState createState() => _CustomReportFormState();
}

class _CustomReportFormState extends State<CustomReportForm> {

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController msgController = TextEditingController();
  bool _isLoading = false;

   @override
  void initState() {
    _getUserInfo(); 
    super.initState();
  }


  
  void _getUserInfo() {
    nameController = TextEditingController(
        text:
            '${widget.userData['name'] == null ? '' : widget.userData['name']}');
   emailController = TextEditingController(
        text:
            '${widget.userData['email'] == null ? '' : widget.userData['email']}');
    
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

            //////////////Email///////////////
            Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
      Container(
      //width: 300,
      height: 30,
      margin: EdgeInsets.only(left: 20, top: 15),
      child: Text(
            "Email",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Color(0xFF000000),
            fontFamily: "sourcesanspro",
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
      ),
      Container(
      //width: 350,
      height: 40,
      child: TextField(
        controller: emailController,
            style: TextStyle(color: Color(0xFF000000)),
            cursorColor: Color(0xFF9b9b9b),
            decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
      enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
      hintText: "Enter email ",
      hintStyle: TextStyle(
      color: Color(0xFF9b9b9b),
      fontSize: 15,
      fontFamily: "sourcesanspro",
      fontWeight: FontWeight.w300),
      contentPadding:
      EdgeInsets.only(left: 20, bottom: 12, top: 12),
      fillColor: Color(0xFFFFFFFF),
      filled: true,
            ),
      ),
      ),
            ],
      ),
            ),

            //////////////Email end//////////


            //////////////FullName //////////

            Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
      Container(
      //width: 300,
      height: 30,
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
            "Full Name",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Color(0xFF000000),
            fontFamily: "sourcesanspro",
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
      ),
      Container(
      //width: 350,
      height: 40,
      child: TextField(
        controller: nameController,
            style: TextStyle(color: Color(0xFF000000)),
            cursorColor: Color(0xFF9b9b9b),
            decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
      enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
      hintText: "Enter Name ",
      hintStyle: TextStyle(
      color: Color(0xFF9b9b9b),
      fontSize: 15,
      fontFamily: "sourcesanspro",
      fontWeight: FontWeight.w300),
      contentPadding:
      EdgeInsets.only(left: 20, bottom: 12, top: 12),
      fillColor: Color(0xFFFFFFFF),
      filled: true,
            ),
      ),
      ),
            ],
      ),
            ),

      //////////////FullName end//////////
      





      /////////////////Message //////////

            Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
      Container(
      //width: 300,
      height: 30,
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
            "Message",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Color(0xFF000000),
            fontFamily: "sourcesanspro",
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
      ),
            Container(
           // height: 200,
            //color: Colors.blue,
            //padding: EdgeInsets.all(10.0),
            child: new ConstrainedBox(
      constraints: BoxConstraints(
            maxHeight: 200.0,
      ),
      child: new Scrollbar(
            child: new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: true,
      child: SizedBox(
          //  height: 200.0,
            child: new TextField(
              cursorColor: Colors.black,
              controller: msgController,
      maxLines: 5,
      decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
      enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFFFFFFF))),
            hintText: 'Add your text here',
            hintStyle: TextStyle(
      color: Color(0xFF9b9b9b),
      fontSize: 15,
      fontFamily: "sourcesanspro",
      fontWeight: FontWeight.w300),
      fillColor: Color(0xFFFFFFFF),
      filled: true,
      contentPadding:EdgeInsets.only(left: 20, bottom: 10, top: 15),
      ),
            ),
      ),
            ),
      ),
            ),
      ),
            ],
      ),
            ),

   Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(30, 10, 20, 20),
                    
                      child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      //           Navigator.push(
                                      // context,
                                      // new MaterialPageRoute(
                                      //   builder: (context) => Shop()
                                      // ));
                                    },
                                    child: Container(
                                      //padding: EdgeInsets.only(left: 20),
                                       child: Text(
                                                    'Back',
                                                    
                                                    textDirection: TextDirection.ltr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        //decoration: TextDecoration.underline,
                                                        fontFamily: 'MyriadPro',
                                                        fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                      //color: Colors.red,
                                    ),
                                  ),

                                  ///////////////// Add to cart Button  Start///////////////

                                  Container(
                                      decoration: BoxDecoration(
                                        color: Colors.greenAccent[400].withOpacity(0.8),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      //width: 150,
                                      height: 42,
                                      child: FlatButton(
                                        onPressed: _isLoading ? null : _sendButton,

                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(left: 15, right: 15),
                                              child: Text(
                                                        'Send',
                                                        textDirection: TextDirection.ltr,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17.0,
                                                            decoration: TextDecoration.none,
                                                            fontFamily: 'MyriadPro',
                                                            fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                            ),
                                          ],
                                        ),
                                        color: Colors.transparent,
                                        // elevation: 4.0,
                                        //splashColor: Colors.blueGrey,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(20.0)),
                                        
                                      )),

                                  ///////////////// Next In Button  End///////////////
                                ],
                              ),
                    ),
              ],
            )
            /////////////////Message end//////////
      ],
            ),
              ),
            ),



            ///////////////Stack Button/////////
         
          ],
        );
  }



  void _sendButton() async{



    if(nameController.text.isEmpty){
        return showMsg(context, "Name is empty");
        
      }
      else if(emailController.text.isEmpty){
        return showMsg(context, "Email is empty");
      }

      else if(msgController.text.isEmpty){
        return showMsg(context,"Message is empty");
      }
      


    setState(() {
       _isLoading = true;
    });
   
    
      var data = {
        'orderId' : widget.orderIdd,
        'name' : nameController.text,
        'email' : emailController.text,
        'description' : msgController.text,
     };

     print(data);
    
   
      var res = await CallApi().postData(data, 'app/growerreports');
    var body = json.decode(res.body);
    print(body);
    
    
        if(body['success']){
       
       _showDialog(body['message']);
        
      }
      else{
          showMsg(context, "Something is wrong");
        }


     setState(() {
        _isLoading = false;
     });


    
  }




  void _showDialog(msg) {
    // flutter defined function
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              backgroundColor: Colors.white,
              content: new Text(msg,
              style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                    ),
              ),
              //content: new Text("Alert Dialog body"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Done"),
                  onPressed: () {
                    Navigator.push(context, SlideLeftRoute(page: Navigation()));
                  },
                ),
              ],
            );
          },
        );
  }
}