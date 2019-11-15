import 'package:cannagrowdev/ImportFile/ImportPages.dart';
import 'package:cannagrowdev/JsonModel/ShowOrderModel/ShowOrderModel.dart';

var orderData;
  
class OrderRequest extends StatefulWidget {
  @override
  _OrderRequestState createState() => _OrderRequestState();
}

class _OrderRequestState extends State<OrderRequest> {

  bool _isLoading = false;
   // var orderData;
bool _dispensaryIsEmpty = true;

  @override
  void initState() {
     store.dispatch(ConnectionCheck(true));
      _getUserInfo();
    // store.state.orderList.length>0? null:  _showOrderRequest();
     store.state.isOrder==true? null:  _showOrderRequest();
    bottomNavIndex = 2;
    super.initState();
  }


 var userData;
  var dispensaryData;

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var dispensaryJson = localStorage.getString('dispensary');
    var user = json.decode(userJson);
    var dispensary;
    if (dispensaryJson != null) {
      dispensary = json.decode(dispensaryJson);
    } else {
      dispensary = null;
    }

    setState(() {
      userData = user;
    });

    if (dispensary == null) {
      _dispensaryIsEmpty = true;
    } else {
      setState(() {
        dispensaryData = dispensary;
        _dispensaryIsEmpty = false;
        //  print(dispensaryData);
      });

     
    }
  }
  Future <void> _showOrderRequest() async {
    

  
    setState(() {
      _isLoading = true;
    });

    var res = await CallApi().getData('app/ordersSeller');
    var collection = json.decode(res.body);
    var allOrderRequest = ShowOrderModel.fromJson(collection); 
   // print(allOrderRequest);
    
 if (!mounted) return;
    setState(() {
       orderData = allOrderRequest.order;
      _isLoading = false;
    });

  store.dispatch(OrderList(orderData));
  store.dispatch(OrderCheck(true));
  //print( orderData.length);
  // print(orderData);
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Colors.white,
           appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Order',
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Color(0xFF01d56a).withOpacity(0.8),
              fontFamily: "sourcesanspro",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
        body: SafeArea(
                  child:  
              //     _dispensaryIsEmpty
              // ?   Center(
              //         child:Container(
              //       width: 200,
              //       height: 200,
              //       decoration: new BoxDecoration(
                       
              //       shape: BoxShape.rectangle,
              //       image: new DecorationImage(
              //         fit: BoxFit.fill,
              //         image: new AssetImage('assets/images/empty.png'),
              //       )))):
                    _isLoading?       _dispensaryIsEmpty
              ?   Center(
                      child:Container(
                    width: 200,
                    height: 200,
                    decoration: new BoxDecoration(
                       
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/empty.png'),
                    )))):Center(
                    child: 
                    CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    )
                     ): RefreshIndicator(
                          onRefresh: _showOrderRequest,
                  child:  orderData==null || orderData.length<1? 
                    Stack(
                      children: <Widget>[
                        Center(
                          child: Container( 
                    width: 200,
                    height: 200,
                    decoration: new BoxDecoration(
                           
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage('assets/images/empty.png'),
                    ))),
                        ),
                         ListView(
                     physics: const AlwaysScrollableScrollPhysics(),
                  )
                      ],
                    ):
                    SingleChildScrollView(
                         physics: const AlwaysScrollableScrollPhysics(),
                      child:Padding(
                                       padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                                      child:// _isLoading?CircularProgressIndicator():
                                       
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: 
                                          _showOrder()
                                        ),
                                    ),
                    ),
                 
                     ),    
        ),
      );
  }

   List<Widget> _showOrder() {
    

    List<Widget> list = [];
   // int checkIndex=0;
    for (var d in store.state.orderList) {
       // checkIndex = checkIndex+1;
    

     // print(d.orderdetails.length);
     //   print(d.status);

      list.add(
      OrderBuyerRequest(d)
      );
    }

    return list;
  }
}