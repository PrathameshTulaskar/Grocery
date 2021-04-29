// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GroceryProduct {
  String productName;
  String productType;
  String price;
  String productId;

  GroceryProduct(
      {this.productName,
      this.price,
      this.productId,
      // this.productType
      this.productType,
     
      });
  GroceryProduct.fromJson(Map<String, dynamic> json)
      : productName = json['productName'],
       productType = json['productType'],
       price = json['price'],
       productId = json['productId'];
       

  GroceryProduct.fromSnapshot(DocumentSnapshot snapshot)
      : productName = snapshot.data()['productName'],
        productId = snapshot.id,
        price = snapshot.data()['price'],
        productType = snapshot.data()['productType'];
      
}
