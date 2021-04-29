class Cart {

  String productName;
  String productImg;
  String price;
  int productQty;
  String businessId;
  String productCategory;
  int productPrice;
  int originalPrice;
  String productId;
  double productWeight;
  String weightType;
  int stockAvailable;
  Cart(
      {
      
      this.productName,
      this.price,
      this.productImg,
      this.productCategory,
      this.productPrice,
      this.productQty,
      this.businessId,
      this.productId,
      this.productWeight,
      this.weightType,
      this.originalPrice,
      this.stockAvailable});
  Cart.fromJson(Map<String, dynamic> json)
      : 
      
      productName = json['productName'],
        productImg = json['productImg'],
        productQty = json['productQty'] as int,
        productCategory = json['productCat'],
        businessId = json['businessId'] ?? json['supermarketId'],
        productId = json['productId'],
        price = json['price'],
        productPrice = json['price'] as int,
        productWeight = double.parse(json['productWeight'].toString()),
        originalPrice = json['originalPrice'] as int,
        weightType = json['weightType'],
        stockAvailable = json['stockAvailable'];

}
