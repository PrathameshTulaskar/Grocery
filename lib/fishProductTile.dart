import 'package:flutter/material.dart';


class ProductTile extends StatelessWidget {
  final String productId;
  final String productImg;

  final String productTitle;
  final String productPieces;
  final String productPrice;
 final Function addToCart;
  final Function addToCartBtnClick;
  const ProductTile(
      {Key key,
      this.productImg,
      this.addToCart,
      this.productPieces,
      this.productTitle,
      this.productPrice,
      this.addToCartBtnClick,
     
      this.productId});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    // print(
    //     "product exist in cart : ${cartProductExist.productExist} || Product Quantity: ${cartProductExist.currentQty} || Product Id : $productId || Product Name: $productTitle");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Container(
        // height: 100.0,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(-1, 1), color: Colors.grey[300])
          ],
          color: Colors.blue[50],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0)),
        ),
        child: Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 100.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/splash.png")
                        ))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
  //                          DropdownButton<String>(
  //   value: dropdownValue,
  //   icon: Icon(Icons.arrow_downward),
  //   iconSize: 24,
  //   elevation: 16,
  //   style: TextStyle(
  //     color: Colors.deepPurple
  //   ),
  //   underline: Container(
  //     height: 2,
  //     color: Colors.deepPurpleAccent,
  //   ),
  //   // onChanged: (String ? newValue) {
  //   //   setState(() {
  //   //     dropdownValue = newValue!;
  //   //   });
  //   // },
  //   items: <String>['One', 'Two', 'Free', 'Four']
  //     .map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(value),
  //       );
  //     })
  //     .toList(),
  // ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rs.$productPrice/kg"),
                              SizedBox(width:MediaQuery.of(context).size.width*0.20),
                              ElevatedButton(onPressed: addToCart, child: Text("Add To cart"))
                            ],
                          ),

                         

                          
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.680,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           productPieces == "0"
                  //               ? Text('1 Piece')
                  //               : Text('$productPieces Pieces'),
                  //           productPieces == "0"
                  //               ? Text('Rs.$productPrice/fish')
                  //               : Text('Rs.$productPrice/kg'),
                  //         ],
                  //       ),
                  //       !(cartProductExist.productExist)
                  //           ? AddToCartFishery(
                  //               addToCartBtnClick: addToCartBtnClick)
                  //           : FishquatityAdjustment(
                  //               appState: appState,
                  //               cartProductExist: cartProductExist,
                  //               productId: productId,
                  //             )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToCartFishery extends StatelessWidget {
  const AddToCartFishery({
    Key key,
    @required this.addToCartBtnClick,
  }) : super(key: key);

  final Function addToCartBtnClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addToCartBtnClick,
      child: Container(
        width: 125,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0))),
        child: Center(
          child: Text("ADD TO CART",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white)),
        ),
      ),
    );
  }
}

class FishquatityAdjustment extends StatelessWidget {
  const FishquatityAdjustment({
    Key key,
    // @required this.appState,
    // @required this.cartProductExist,
    @required this.productId,
    // @required this.supermarketDetail,
  }) : super(key: key);
  // final NearbySupermarket supermarketDetail;
  // final AppState appState;
  // final CartProductExist cartProductExist;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () async {
              // await appState.minusQuantity(
              //     cartProductExist.currentQty.toString(), productId);
              //Navigator.pushReplacementNamed(context, '/storepage', arguments: supermarketDetail);
            },
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4.0)),
              child: Icon(
                Icons.remove,
                size: 15.0,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("",
            // Text(cartProductExist.currentQty.toString() ?? "",
                style: Theme.of(context).textTheme.subtitle1),
          ),
          InkWell(
            onTap: () async {
              // await appState.addQuantity(
              //     cartProductExist.currentQty.toString(), productId);
              //Navigator.pushReplacementNamed(context, '/storepage', arguments: supermarketDetail);
            },
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  // color: blueColor, 
                  borderRadius: BorderRadius.circular(4.0)),
              child: Icon(Icons.add, size: 15.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
