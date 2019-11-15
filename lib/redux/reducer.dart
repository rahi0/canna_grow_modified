import 'package:cannagrowdev/ImportFile/ImportPages.dart';



AppState reducer(AppState state, dynamic action){

  if(action is ShowItem){
    return state.copywith(
     allItemsData: action.showItem,    
    );
  }

  // else if(action is AddItem){
  //   return state.copywith(
  //    allItemsData: action.addItem,    
  //   );
  // }

  else if(action is ShowSingleItem){
    return state.copywith(
     data: action.showSingleItem  
    );
  }

    else if(action is UpdateItem){
    return state.copywith(  
     data: action.updateItem
    );
  }

  else if(action is NotificationCountAction){
    return state.copywith(
      notificationCount: action.notificationAction
    );
  }

   else if(action is ConnectionCheck){
    return state.copywith(
      connection: action.connectionAction
    );
  }
    else if(action is ReviewList){
    return state.copywith(
      reviewList: action.reviewList
    );
  }
    else if(action is AvgReview){
    return state.copywith(
      avgReview: action.avgReview
    );
  }
     else if(action is OrderList){
    return state.copywith(
      orderList: action.orderList
    );
  }
       else if(action is OrderDetailsInfo){
    return state.copywith(
      orderDetails: action.orderDetails
    );
  }

    else if(action is NotificationCheck){
  
    return state.copywith(
    notifiCheck: action.notifiCheck
    );
  }

 else if(action is NotificationList){
 
    return state.copywith(
    notiList: action.notiList
    );
  }
   else  if(action is OrderCheck){
  
    return state.copywith(
    isOrder: action.orderCheck
    );
  }
   else  if(action is ProductCheck){
  
    return state.copywith(
   isProduct: action.productCheck
    );
  }
   else  if(action is HomeCheck){
  
    return state.copywith(
    isHome: action.homeCheck
    );
  }
   else  if(action is ShopCheck){
  
    return state.copywith(
      isShop: action.shopCheck
    );
  }
  return state;
}