import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:convert' as convert;

import 'package:image/model/grocery.dart';

import 'model/cart.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  
  Future<List<GroceryProduct>> getGroceryProduct() async {
  
  try {
      var response = await _db
        .collection("grocery/products/ourGroceryProducts").where("productType",isEqualTo:"grocery")
        .get();
        print("response in the firebase is ${[response]}");
    // return response.docs.map((e) => GroceryProduct.fromSnapshot(e)).toList();
    return response.docs.map((e) => GroceryProduct.fromSnapshot(e)).toList();
    } catch (e) {
      print("Error while fetching grocery product: $e");
      return null;
    }

  
}

Stream<List<Cart>> getCartItems({String userId}) {
    // var userId;
    // userData.currentUser().then((value) {
    //   userId = value.uid;
    // }).catchError((onError){
    //   print("error fetching user Id on cart : $onError");

    // });
    if (userId != null) {
      print("get cart item stream fired with USer Id: $userId");
      var response = _db
          .collection("grocery/cart/customerList/$userId/cartProductList")
          .snapshots();
      return response.map(
          (event) => event.docs.map((e) => Cart.fromJson(e.data())).toList());
    } else {
      return null;
    }
  }

  Future<void> quantityAddMinus(
      String productId, int productQty, String userId) async {
    await _db
        .collection("grocery/cart/customerList/$userId/cartProductList")
        .doc(productId)
        .update({
      'productQty': productQty,
    });
  }

  Future<void> deleteProductInCart(String productId, String userId) async {
    await _db
        .collection("grocery/cart/customerList/$userId/cartProductList")
        .doc(productId)
        .delete();
  }

  Future<int> addToCart(String customerID, Cart cartItem) async {
    //CODE - 1: success, 2: supermarketIsDifferent, 3:something went wrong
    try {
      // var checkSupermarket =
      //     await checkSupermarketProducts(cartItem.supermarketId, customerID);
      // if (checkSupermarket == 1) {
      _db
          .collection("grocery/cart/customerList/$customerID/cartProductList")
          .doc(cartItem.productId)
          .set({
        'productName': cartItem.productName,
        'productQty': 1,
        'price': cartItem.productPrice,
        'productImg': cartItem.productImg,
        'businessId': cartItem.businessId,
        // 'productCat': cartItem.productCategory,
        'productId': cartItem.productId,
        // 'originalPrice': cartItem.originalPrice,
        // 'weightType': cartItem.weightType,
        // 'productWeight': cartItem.productWeight,
        'stockAvailable': cartItem.stockAvailable,
        
      });
      return 1;
      //}
      // else {
      //   print("different Supermarket available... its not the same!!");
      //   return 2;
      // }
    } catch (err) {
      print("ERROR WHILE ADDING PRODUCT TO CART: $err");
      return 3;
    }
  }

  Future<bool> updateOrderStatus(String documentId, String paymentStatus,
      String paymentId, String paymentMethod, bool couponAllowed) async {
    try {
      await _db.collection("grocery/orders/orderList").doc(documentId).update({
        'paymentStatus': paymentStatus,
        'paymentId': paymentId,
        'paymentMethod': paymentMethod,
      });
      return true;
    } catch (e) {
      print("error while updating order: $e");
      return false;
    }
  }

  Future<bool> resetCart(String customerID) async {
    print("reset cart request with customer cid :$customerID");
    try {
      var response = await _db
          .collection("grocery/cart/customerList/$customerID/cartProductList")
          .get();
      response.docs.forEach((element) async {
        await element.reference.delete();
      });
      return true;
    } catch (e) {
      print("error while reset cart: $e");
      return false;
    }
  }

}
