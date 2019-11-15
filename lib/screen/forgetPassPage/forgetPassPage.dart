import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class ForgetPassword extends StatefulWidget {
  final data;
  ForgetPassword(this.data);
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

   
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
        //backgroundColor: Colors.white,
        body: SafeArea(
                  child: Container(
      child: SingleChildScrollView(
              child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0, bottom: 40),
              child: Column(
                children: <Widget>[

                //  VerifyEmail(),
 
      
        

        /////////// Form Start//////////
        
        ForgetPassForm(widget.data)
        ///////////Form end///////////
                ],
              ),
            ),
      ),
    ),
        ));
  }
}








/////////



class ForgetPassForm extends StatefulWidget {
  final tokendata;
  ForgetPassForm(this.tokendata);
  @override
  _ForgetPassFormState createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {

    _showMsg(msg) { //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
   }

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 70),
      //color: Colors.red,
      child: Column(children: <Widget>[
        Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 0),
               // height: 100,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[


                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(bottom: 10, top: 0),
                        alignment: Alignment.centerLeft,
                        //height: 70,
                        width: MediaQuery.of(context).size.width,
                      // color: Colors.blue,
                        child: Text(
                            'Enter your new password',
                            //textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'sourcesanspro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),

                    ///////////////// New Password Textfield  Start///////////////
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: TextField(
                        obscureText: true,
                        controller: newPasswordController,
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green[300].withOpacity(0.2),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          bottomLeft: Radius.circular(40))),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                  )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                          
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontFamily: "sourcesanspro",
                              fontWeight: FontWeight.normal),
                          contentPadding:
                              EdgeInsets.only(left: 20, bottom: 12, top: 12),
                          fillColor: Colors.green[200].withOpacity(0.5),
                          filled: true,
                          hintText: "New Password",
                        ),
                      ),
                    ),

                    ///////////////// New Password Textfield  End///////////////
                    



                    ///////////////// Confirm Textfield  Start///////////////
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green[300].withOpacity(0.2),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          bottomLeft: Radius.circular(40))),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                  )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFFFFFFFF))),
                          
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontFamily: "sourcesanspro",
                              fontWeight: FontWeight.normal),
                          contentPadding:
                              EdgeInsets.only(left: 20, bottom: 12, top: 12),
                          fillColor: Colors.green[200].withOpacity(0.5),
                          filled: true,
                          hintText: "Confirm Password",
                        ),
                      ),
                    ),

                    ///////////////// Confirm Textfield  End///////////////


                          
                  ],
                ),
              ),
              
              
              
              Container(
                alignment: Alignment.centerLeft,
                //height: 90,
                width: MediaQuery.of(context).size.width,
                //color: Colors.yellow,
                child: Column(
                  children: <Widget>[


                                  ///////////////// Submit Button  Start///////////////
                    



                    Container(
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.topLeft,
                          stops: [0.1, 0.4, 0.6, 0.9],
                          colors: [
                            Colors.greenAccent[400],
                            Colors.greenAccent[400],
                            Colors.tealAccent[400],
                            Colors.tealAccent[700],
                          ],
                        ), ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 45,
                                  child: FlatButton(
                                    child: Text(
                                      'Submit',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'MyriadPro',
                                          fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    color: Colors.transparent,
                                    //elevation: 4.0,
                                    //splashColor: Colors.blueGrey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    onPressed: _submit,
                                  )),

                                  ///////////////// Submit Button  End///////////////



                                 

                  ],
                ),
              )
      ],)
    );
  }

  _submit() async{
     if (newPasswordController.text.isEmpty){
        return _showMsg("New Password is empty");
      }
      else if (confirmPasswordController.text.isEmpty){
        return _showMsg("Confirm Password is empty");
      }

      else if(newPasswordController.text != confirmPasswordController.text){
        return _showMsg("Password doesn't match");
      }

 
      var data = {
      'token': widget.tokendata, 
      'password' : newPasswordController.text        
    };

    var res = await CallApi().postData(data, 'auth/resetForgotPassword');
    var body = json.decode(res.body);
    print(body);
    if(body['success']==true){
      _changePass();
   

      
    }
     else{     
     
      showMsg(context,"Error");
    }
      
     
  }

         void _changePass() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(5),
          title: 
              Text(
                                "Your Password has been changed.Now you can login with your new password",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "grapheinpro-black",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
              actions: <Widget>[
                Container(
               alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent[400],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              // width: MediaQuery.of(context).size.width/3,
                              height: 30,
                              margin: EdgeInsets.only(bottom: 15, right: 10),
                              child: OutlineButton(
                                  color: Colors.greenAccent[400],
                                  child: new Text(
                                    "Ok",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    
                                Navigator.push(context, SlideLeftRoute(page: LogIn()));
                                  },
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 0.5),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0))))]

     
        );
      },
    );
  }


}