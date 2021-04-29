import 'dart:async';
// import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image/firestore_service.dart';

import 'model/cart.dart';
import 'model/grocery.dart';

class AppState extends ChangeNotifier {
 String _customerId;
  List<GroceryProduct> _groceryProductList = [];
  List<GroceryProduct> get groceeryProductList => _groceryProductList;
  List<Cart> _cartProductsList = [];
  List<Cart> get cartProductList => _cartProductsList;

    int _orderSlotSelected = 0;
  var _limitStockList = <int>[];
  int _couponDiscount = 0;
  set couponDiscountSet(value) {
    _couponDiscount = value;
    notifyListeners();
  }
    bool _userExistsDb;
  bool get userExistsDb => _userExistsDb;
  bool _limitedStockWarn = false;
  bool get limitedStockWarn => _limitedStockWarn;
  set limitedStockWarnSet(bool value) {
    _limitedStockWarn = value;
  }
 
  FirestoreService firestoreService = FirestoreService();
  
  AppState() {
    print("AppState Initialized");
    // fetchCartItems();
    getGroceryProduct();
    
    //firestoreService.getCurrentTime();
  }
  
  Future<List<GroceryProduct>> getGroceryProduct() async {
    try {
      _groceryProductList= await firestoreService.getGroceryProduct();
      print("groceryproduct ${_groceryProductList.length}");
      print("groceryproduct ${_groceryProductList[0].productName}");
      return _groceryProductList;
    } catch (e) {
      print("Error while fetching grocery product: $e");
      return null;
    }

  }

  fetchCartItems() {
    var response = firestoreService.getCartItems(userId: _customerId);

    response.listen((event) {
      _cartProductsList = event;
      _limitStockList.clear();
      _cartProductsList.forEach((element) {
        if (element.stockAvailable < element.productQty ||
            element.stockAvailable == 0) {
          _limitedStockWarn = true;
          _limitStockList.add(0);
          notifyListeners();
          print("Limited Stock empty: $_limitStockList ");
        } else {
          _limitStockList.add(1);
          print("Limited Stock not empty: $_limitStockList ");
          _limitedStockWarn = false;
          notifyListeners();
        }
      });
    });
  }

  Future<int> addToCart(Cart cartItem) async {
    print("product category: ${cartItem.productCategory}");
    //CODE - 1: success, 2: supermarketIsDifferent, 3:something went wrong try again
    var response = await firestoreService.addToCart("0GidzxgE33RvMiosd2P0aJ1kDr93" ,cartItem);
    // switch (response) {
    //   case 1:
    //     return 1;
    //     break;
    //   case 2:
    //     return 2;
    //     break;
    //   default:
    //     return 3;
    // }
  }

  Future<bool> resetCartItems() async {
    print("reset cart functionality invoke");
    return await firestoreService.resetCart(_customerId);
  }

  
}
