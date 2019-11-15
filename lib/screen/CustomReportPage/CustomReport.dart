import 'package:cannagrowdev/ImportFile/ImportPages.dart';



class CustomReport extends StatefulWidget {
  final orderIdd;
  CustomReport(this.orderIdd);
  @override
  _CustomReportState createState() => _CustomReportState();
}

class _CustomReportState extends State<CustomReport> {

  var userData;
  bool _isLoaded = false;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }


  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson); 
    setState(() {
      userData = user;
      _isLoaded = true;
    });

    print(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
              child: CustomReportForm(userData, widget.orderIdd),
      ),
    );
  }
}