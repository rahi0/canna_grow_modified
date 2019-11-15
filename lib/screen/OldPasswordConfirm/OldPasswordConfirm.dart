import 'package:cannagrowdev/ImportFile/ImportPages.dart';


class OldPasswordConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Old Password'),
        centerTitle: true,
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

        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 30, top: 30),
          alignment: Alignment.center,
          //height: 70,
          width: MediaQuery.of(context).size.width,
         // color: Colors.blue,
          child: Row(
            children: <Widget>[
              Expanded(
                                    child: Text(
                  'To reset your password, please enter your Old Password. We will verify it for this account.',
                  //textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'sourcesanspro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        

        /////////// Form Start//////////
        
        OldPasswordForm()
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



class OldPasswordForm extends StatefulWidget {
  @override
  _OldPasswordFormState createState() => _OldPasswordFormState();
}

class _OldPasswordFormState extends State<OldPasswordForm> {

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
   TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      //color: Colors.red,
      child: Column(children: <Widget>[
        Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
               // height: 100,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[


                    ///////////////// Old PAssword Textfield  Start///////////////
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
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
                                    Icons.person,
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
                          hintText: "Password",
                        ),
                      ),
                    ),

                    /////////////////Old PAssword Textfield  End///////////////


                          
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

  _submit(){
     if(passwordController.text.isEmpty){
        return _showMsg("Password is empty");
      }

      Navigator.push(context, SlideLeftRoute(page: ChangePassword()));
      
      setState(() {
        passwordController.text = "";
      });

  }
 


}