import 'package:cannagrowdev/ImportFile/ImportPages.dart';

ThunkAction<AppState> showAllProductsData = (Store<AppState> store) async {
  // var res = await CallApi().getData('app/items');
  // var collection = json.decode(res.body);
  // var allProductItems = ShowProductJson.fromJson(collection);

  store.dispatch(ShowItem(store.state.allItemsData));
};

ThunkAction<AppState> addProducts(d) => (Store<AppState> store) async {
      store.dispatch(new AddItem(d));
    };

ThunkAction<AppState> showSingleProductData(d) =>
    (Store<AppState> store) async {
      store.dispatch(new ShowSingleItem(d));
    };

ThunkAction<AppState> updateProducts(d, id) => (Store<AppState> store) async {
      if (store.state.data.id == id) {

      //  print(store.state.data.tags);
        //List<Tags> tags = store.state.data.tags;
     //  int index = 0;

      //   for (var d in d['tags']) {
      //     tags[index].keyword = d;

      //     print(tags[index].keyword);

      //     index++;
      //   }

      //  print(tags);
       // store.state.data.id = d['id'];                
        store.state.data.name = d['name'];
        store.state.data.deliveryFee = d['deliveryFee'];
        store.state.data.price = d['price'];
        store.state.data.quantity = d['quantity'];
        //store.state.data.tags = d['tags'];
        store.state.data.description = d['description'];
        store.state.data.productPrice = d['productPrice'];
        store.state.data.img = d['img'];
      }

      store.dispatch(UpdateItem(store.state.data));
    };
