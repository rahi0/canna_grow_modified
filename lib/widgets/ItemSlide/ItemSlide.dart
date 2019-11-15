import 'package:cannagrowdev/ImportFile/ImportPages.dart';

class ItemSlide extends StatefulWidget {
  final item;
  final itemCount;
  ItemSlide(this.item, this.itemCount);

  @override
  _ItemSlideState createState() => _ItemSlideState();
}

class _ItemSlideState extends State<ItemSlide> {

  
  final List swipePage = [];
  int itemIndex = 0, setIndex = 0;
  @override
  void initState() {
    _showList();
    super.initState();
  }

  void _showList() {
    for (var d in store.state.allItemsData) {
      itemIndex++;
      if (d.id == widget.item.id) {
        setState(() {
          setIndex = itemIndex - 1;
        });
      }
    }
    var count = setIndex; 
    var remain = setIndex - 1; 
    var matchIndex = 0;
    // print(remain); 

    for (int i = setIndex; i < widget.itemCount; i++) {
      swipePage.add(ItemPage(store.state.allItemsData[i]));
    }
  
  } 

  // void _update(int index){
  //   setState(() { 
  //    setIndex = index; 
  //    print(index);
  //   });
  // }
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder( 
          //// pageView for swipe
          scrollDirection: Axis.horizontal,
          //onPageChanged: _update,
          itemBuilder: (context, position) => swipePage[position],
          itemCount: swipePage.length,
        ),
      ),
    );
  }
}
