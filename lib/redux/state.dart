


class AppState {
  
  var allItemsData;
  var data;
  var notificationCount;
  bool connection;
  List reviewList;
  var avgReview;
  List orderList;
  List orderDetails;
  bool notifiCheck;
  List notiList;
  bool isOrder;
  bool isProduct;
  bool isHome;
  bool isShop;

  AppState({this.allItemsData, this.data,this.notificationCount,this.connection,this.reviewList, this.avgReview,this.orderList,
            this.orderDetails,this.notifiCheck,this.notiList,this.isOrder,this.isProduct,this.isHome, this.isShop});

  AppState copywith({allItemsData, data,notificationCount,connection,reviewList,avgReview,orderList,orderDetails,notifiCheck,notiList,
                         isOrder,isProduct,isHome,isShop}) {
    return AppState(
      orderList: orderList??this.orderList,
     allItemsData: allItemsData ?? this.allItemsData,
     data: data ?? this.data,
     notificationCount: notificationCount ?? this.notificationCount,
     connection: connection ?? this.connection,
     reviewList: reviewList??this.reviewList,
     avgReview: avgReview??this.avgReview,
     orderDetails:orderDetails??this.orderDetails,
     notifiCheck:notifiCheck??this.notifiCheck,
     notiList:notiList??this.notiList,
     isOrder: isOrder??this.isOrder,
     isProduct: isProduct??this.isProduct,
     isHome: isHome??this.isHome,
     isShop: isShop??this.isShop
      
    );
  }
}
