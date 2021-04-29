// import 'package:image/model/cart.dart';
// import 'package:quickyshop_customer/models/models/cart.dart';
// import 'package:quickyshop_customer/models/models/cartProductExist.dart';
// import 'package:quickyshop_customer/models/models/fishProduct.dart';
// import 'package:quickyshop_customer/models/models/product.dart';

// import 'model/cartProductExist.dart';

// CartProductExist cartProductExist(Product product,List<Cart> cartItemList){
//     for (var item in cartItemList) {
//       if(product.productId == item.productId)
//       return CartProductExist(currentQty: item.productQty,productExist: true);
//     }
//     return CartProductExist(currentQty: 0,productExist: false);
//   }
// CartProductExist cartProductExistFishery(FishProduct product,List<Cart> cartItemList){
//     for (var item in cartItemList) {
//       if(product.productId == item.productId)
//       return CartProductExist(currentQty: item.productQty,productExist: true);
//     }
//     return CartProductExist(currentQty: 0,productExist: false);
//   }
//   bool newSupermarket(String supermatketId,List<Cart> cartItemList){
//      for (var item in cartItemList) {
//       if(supermatketId != item.businessId)
//       return true;
//     }
//     return false;
//   }
//   bool newFishvendor(String businessId,List<Cart> cartItemList){
//      for (var item in cartItemList) {
//       if(businessId != item.businessId)
//       return true;
//     }
//     return false;
//   }