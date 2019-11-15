

import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _dispensaryIsEmpty = true;
  var userData;
  var dispensaryData;
  var imgData;
  bool _isLoading = true;
  @override
  void initState() {
    _getUserInfo();
    bottomNavIndex = 3;
    super.initState();
  }

  void _getUserInfo() async { 
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');
 
    var user = json.decode(userJson);   

    
    setState(() {
      userData = user;
       userData['img']!=null? imgData ="https://www.dynamyk.biz"+'${userData['img']}': "";
      
    });
    
     if(dispensaryJson == null){
        _dispensaryIsEmpty = true;
    }
    else{
 var dispensary = json.decode(dispensaryJson);
    setState(() {
    
      dispensaryData = dispensary;
       _dispensaryIsEmpty = false;
    });
  
    }
  setState(() {
   _isLoading = false; 
  });

  print("image");
  print(userData['img']);

    // var dispensary = json.decode(dispensaryJson);
    // setState(() {
    //   userData = user;
    //   dispensaryData = dispensary;
    // });
  }
  Container profileContainer(String label, String text) {
    return Container(
      margin: EdgeInsets.only(top: 5,left: 20),
      padding: EdgeInsets.only(left: 0, right: 10),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ////////  name /////////
          Container(
             width: MediaQuery.of(context).size.width/3,
            margin: EdgeInsets.only(left: 20),
         
            //color: Colors.blue,
            child: Text(
              label,
              textAlign: TextAlign.left,
             style: TextStyle(
                  color: Color(0xFF343434),
                  fontFamily: "sourcesanspro", 
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),

          ////////  name textfield /////////

          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 25, top: 10, bottom: 10),
              //color: Colors.yellow,
              child: Text(
                text,
                style: TextStyle(
                      color: Color(0xFF505050), 
                      fontFamily: "sourcesanspro",
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                //  fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[200],
     // resizeToAvoidBottomPadding: false,
      //  appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: Colors.greenAccent,
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'Profile',
      //     textAlign: TextAlign.right,
      //     style: TextStyle(
      //         color: Colors.white,
      //         fontFamily: "sourcesanspro",
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
              child: _isLoading?Center(child: CircularProgressIndicator()) :
              SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

             
              //////// photo part //////////
              ///
          //    ShowProfilePhoto(),
              _isLoading?
      Container(
       
        child:Center(child: CircularProgressIndicator(),) ,) : Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   

                    ////////// photo/////////

                    Container(
                     margin: EdgeInsets.only( bottom: 25, top: 20),
                      child: Stack(
                        children: <Widget>[ 
                          Container(
                              height: 120,
                               width: 120,
                              decoration: new BoxDecoration(
                                 border: Border.all(
                                  
                                  width: 3,
                                    color:Color(0xFF01d56a).withOpacity(0.4),
                                    
                                  ),
                                  shape: BoxShape.circle),
                                  child: ClipOval(
                                      child:userData['img']== null
                               ?
                               
                                      Image.asset(
                                        
                                                  'assets/images/camera.png',
                                       // 'assets/img/camera.png',
                                       height: 120,
                               width: 120,
                                        fit: BoxFit.cover,
                                      ):
                              Image.network(
                                        
                                   imgData,
                                
                                        height: 120,
                               width: 120,
                                        fit: BoxFit.cover,
                                      )
                                // Image.asset(
                                        
                                //                   'assets/images/shop.jpg',
                                //        // 'assets/img/camera.png',
                                //         height: 100,
                                //         width: 100,
                                //         fit: BoxFit.cover,
                                //       )
                                      
                           
                                    )),

                          //////   camera icon  ////////////
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /////////// Form Start //////////

              ///////// name field //////
              profileContainer(
                  "Name", userData != null ? '${userData['name']}' : ''),

               profileContainer(
                  "Date of Birth",
                  userData != null
                      ? '${userData['birthday']}'
                      : ''),
            //   profileContainer("Business License",
            //     dispensaryData != null ? '${dispensaryData['license']}' : ''),
            //   profileContainer(
            //       "License Expiration Date",
            //     dispensaryData != null
            //           ? '${dispensaryData['licenseExpiration']}'
            //           : ''),
            //  profileContainer("Store's Address",
            //       dispensaryData != null ? '${dispensaryData['address']}' : ''),
              // profileContainer("Store's Latitude",
              //     dispensaryData != null ? '${dispensaryData['lat']}' : ''),
              // profileContainer("Store's Longitude",
              //     dispensaryData != null ? '${dispensaryData['lng']}' : ''),

              profileContainer(
                  "Phone", userData != null ? '${userData['phone']}' : ''),
            
              profileContainer(
                  "Email", userData != null ? '${userData['email']}' : ''),
                   profileContainer(
                  "State",
                  userData != null
                      ? '${userData['state']}'
                      : ''),
                       profileContainer(
                  "Country",
                  userData != null
                      ? '${userData['country']}'
                      : ''),
             
              
                Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ProfileBottom()
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: new FloatingActionButton(
          
      //     child: new Icon(Icons.map,
      //     color: Colors.white
      //     ),
      //     backgroundColor: Colors.greenAccent[400],
        
      //     onPressed: () {
      //       Navigator.push(
      //     context, new MaterialPageRoute(builder: (context) =>   ShowShopInMap()));

      //     },
        
      // ),
    );
  }
}

