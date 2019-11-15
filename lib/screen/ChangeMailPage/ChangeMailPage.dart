import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class ChangeMailPage extends StatefulWidget {
  @override
  _ChangeMailPageState createState() => _ChangeMailPageState();
}

class _ChangeMailPageState extends State<ChangeMailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Email'),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.greenAccent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 15.0, top: 10.0, right: 15.0, bottom: 40),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      margin: EdgeInsets.only(bottom: 10, top: 30),
                      alignment: Alignment.center,
                      //height: 70,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blue,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Your current Email',
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

                    ChangeMailForm()
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

class ChangeMailForm extends StatefulWidget {
  @override
  _ChangeMailFormState createState() => _ChangeMailFormState();
}

class _ChangeMailFormState extends State<ChangeMailForm> {
  _showMsg(msg) {
    //
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

  TextEditingController newEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userData;
  var dispensaryData;
   var passJson;

  bool _isLoading = false;

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  void _getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    passJson = localStorage.getString('pass');

    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });

    // print(passJson);
    // print("before");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0),
        //color: Colors.red,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 0),
              // height: 100,
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ///////////////// Old mail text  Start///////////////
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green[400].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        userData != null ? '${userData['email']}' : '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "grapheinpro-black",
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  /////////////////Old mail text  Start///////////////

                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(bottom: 10, top: 0),
                    alignment: Alignment.centerLeft,
                    //height: 70,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.blue,
                    child: Text(
                      'Enter your new email and password',
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

                  ///////////////// New mail Textfield  Start///////////////
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      obscureText: false,
                      controller: newEmailController,
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
                              Icons.mail,
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
                        hintText: "New Email",
                      ),
                    ),
                  ),

                  ///////////////// New Password Textfield  End///////////////

                  ///////////////// Confirm Textfield  Start///////////////
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: TextField(
                      controller: passwordController,
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
                        hintText: "Password",
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
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: FlatButton(
                        child: Text(
                          _isLoading?'Submitting....':'Submit',
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
                            borderRadius: new BorderRadius.circular(20.0)),
                        onPressed: _isLoading?null: _submit,
                        disabledColor: Colors.grey,
                      )),

                  ///////////////// Submit Button  End///////////////
                ],
              ),
            )
          ],
        ));
  }

 

    void _submit() async {
   
      if (passwordController.text.isEmpty) {
      return _showMsg("Password is Empty");
      }
      else if (passwordController.text != passJson) {
      return _showMsg("Password doesn't match");
    } else if (newEmailController.text.isEmpty) {
      return _showMsg("Enter new email");
    }


    var userdata = {
      'name': '${userData['name']}',
      'email': newEmailController.text,
      'img': "_image",
      'phone': '${userData['phone']}',
      'id': '${userData['id']}',
      'country': '${userData['country']}',
      'state': '${userData['state']}',
      'birthday': '${userData['birthday']}',
    };

    setState(() {
      _isLoading = true;
    });

    var res = await CallApi().postData(userdata, 'app/userEdit');
    var body = json.decode(res.body);
    print(body);
    
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.setString('user', json.encode(body['user']));
   
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Navigation()));
    } else {     

      _showMsg("Email Exits");
    } 

    setState(() {
      _isLoading = false;
    });
  }
}
