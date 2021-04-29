
// import 'package:contactlessMenuAdmin/provider/appState.dart';
import 'package:flutter/material.dart';
import 'package:image/appstate.dart';
import 'package:provider/provider.dart';

import 'fishProductTile.dart';
import 'model/cart.dart';
// import 'package:provider/provider.dart';

class Grocery extends StatefulWidget {
  Grocery({Key key}) : super(key: key);

  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  
  @override
  Widget build(BuildContext context) {
    String productName;
     final appState = Provider.of<AppState>(context);
    // appState.twinkle = this.id;
    String dropdownValue = 'One';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Padding(
          padding:const EdgeInsets.symmetric(vertical:12.0,horizontal:8.0),
          child:Column(
            children: [
              Container(
                height:100,
                width:MediaQuery.of(context).size.width *0.98,
                decoration:BoxDecoration(
                  boxShadow:[
                    BoxShadow(offset:Offset(-1,1),color:Colors.grey[300])],
                    color:Colors.grey[50],
                    borderRadius:BorderRadius.only(
                      topRight:Radius.circular(18.0),
                      bottomRight:Radius.circular(18.0),

                    ),
                ),
                    child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/splash.png")
                              
                              ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lays",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                             SizedBox(height:5),
                              Text("Rs. 5/-"),

                        DropdownButton<String>(
    value: dropdownValue,
    icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.deepPurple
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    // onChanged: (String ? newValue) {
    //   setState(() {
    //     dropdownValue = newValue!;
    //   });
    // },
    items: <String>['One', 'Two', 'Free', 'Four']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
        );
      })
      .toList(),
  ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.680,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                               
                      //         ],
                      //       ),
                            
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
        ),

                ),

                ProductTile(
                  productPieces: "22",
                  productPrice: "500",
                  productTitle: "Ashirwaad Atta",
                ),
                 Column(
                          children: List<Widget>.generate(appState.groceeryProductList.length,(index)
                    
                      {
                        print('productName is not${appState.groceeryProductList[index].productName}');
                              productName=appState.groceeryProductList[index].productName;
                        // var productExistsInCart = cartProductExistFishery(
                        //     snapshot.data[index], cartItems);
                        return  Column(children: [
                          
                          
         ProductTile(
           
           productTitle:appState.groceeryProductList[index].productName,
           productPrice:appState.groceeryProductList[index].price,
          //  addToCart:() async {
          //                   if (newFishvendor(business.businessId, cartItems)) {
          //                     print(
          //                         "supermarketExists... reset cart to add products and show warning\n Id: ${business.businessId}");
          //                     AwesomeDialog(
          //                         context: context,
          //                         dialogType: DialogType.WARNING,
          //                         headerAnimationLoop: false,
          //                         animType: AnimType.TOPSLIDE,
          //                         title: 'Items already in cart',
          //                         desc:
          //                             'Your cart contains itmes from a different vendor. Would you like to reset your cart?',
          //                         btnCancelOnPress: () {
          //                           //Navigator.of(context).pop();
          //                         },
          //                         // btnOkColor: blackColor,
          //                         // btnCancelColor: blackColor,
          //                         btnOkText: "RESET",
          //                         btnOkOnPress: () async {
          //                           //appState.deliveryMethodSet = false;

          //                           await appState.resetCartItems();
          //                         })
          //                       ..show();
          //                   } else if (!productExistsInCart.productExist) {
          //                     var response = await appState.addToCart(Cart(
          //                         fishBusiness: true,
          //                         originalPrice:
          //                             snapshot.data[index].originalPrice,
          //                         productCategory:
          //                             snapshot.data[index].productCat,
          //                         productId: snapshot.data[index].productId,
          //                         productImg: snapshot.data[index].imageUrl,
          //                         productName: snapshot.data[index].productName,
          //                         productPrice: snapshot.data[index].price,
          //                         productQty: 1,
          //                         productWeight:
          //                             snapshot.data[index].productWeight,
          //                         stockAvailable:
          //                             snapshot.data[index].stockAvailable,
          //                         businessId: business.businessId,
          //                         weightType: 'Kg'));
          //                     switch (response) {
          //                       case 1:
          //                         print("success");
          //                         setState(() {
          //                           productExistsInCart =
          //                               cartProductExistFishery(
          //                                   snapshot.data[index], cartItems);
          //                         });

          //                         //Navigator.pushReplacementNamed(context, '/storepage', arguments: supermarketDetail);
          //                         break;
          //                       default:
          //                         print("something went wrong try again toast");
          //                         final error = SnackBar(
          //                           content: Text(
          //                               'Something went wrong... try again.'),
          //                           backgroundColor: Colors.red,
          //                         );
          //                         //Scaffold.of(context).hideCurrentSnackBar();
          //                         ScaffoldMessenger.of(context).showSnackBar(error);
          //                     }
          //                   }
          //                 },
         addToCart:()async{
           
            await appState.addToCart(Cart(
                                  // fishBusiness: true,
                                  // originalPrice:
                                  //     snapshot.data[index].originalPrice,
                                  // productCategory:
                                  //     snapshot.data[index].productCat,
                                  // productId: snapshot.data[index].productId,
                                  // productImg: snapshot.data[index].imageUrl,
                                  productName: appState.groceeryProductList[index].productName,
                                  price:appState.groceeryProductList[index].price,
                                  // productPrice: snapshot.data[index].price,
                                  // productQty: 1,
                                  // productWeight:
                                  //     snapshot.data[index].productWeight,
                                  // stockAvailable:
                                  //     snapshot.data[index].stockAvailable,
                                  // businessId: business.businessId,
                                  weightType: 'Kg'));
                              
                             
                            
                      }
         ),
         // Text(appState.productCategory[index].name)
                        ]
    ,);

                      }   ),
                        ),
                       
           
           
            ],
          )
          )
        )
    );
   
  }
}
