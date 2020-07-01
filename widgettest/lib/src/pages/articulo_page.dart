import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

// My Own Imports
//import 'package:go_kart/pages/product/product_details.dart';

//import 'package:go_kart/Animation/slide_left_rout.dart';

//import 'package:go_kart/pages/wishlist.dart';
//import 'package:go_kart/functions/passDataToProduct.dart';

//import 'package:go_kart/pages/order_payment/delivery_address.dart';
import 'package:widgettest/Animation/slide_left_rout.dart';
import 'package:widgettest/functions/passDataToProduct.dart';
import 'package:widgettest/src/pages/cart.dart';
import 'package:widgettest/src/widgets/product_details.dart';

/*
Listado de interesados:
best_offer_grid  | cats en inicio
a
top_offers | lista de subs cats
a
women_wears |lista de articulos
a
get_products |get json de art (esta aparte 0o)
a
X AQUI VAS
ProductPage! | visualizando articulo
*/

class ProductPage extends StatefulWidget {
  final PassDataToProduct productData;

  ProductPage({Key key, this.productData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool favourite = false;
  int cartItem = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productData.title),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.push(context, SlideLeftRoute(page: WishlistPage()));
            },
          ),
          IconButton(
            icon: Badge(
              badgeContent: Text('zz$cartItem'),
              badgeColor: Theme.of(context).primaryColorLight,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context, SlideLeftRoute(page: CartPage())); //carrito
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF1F3F6),
      body: ProductDetails(data: widget.productData),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonTheme(
                minWidth: ((width) / 2),
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  onPressed: () {
                    setState(() {
                      cartItem++;
                    });
                  },
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              /*ButtonTheme(
                // minWidth: ((width - 60.0) / 2),
                minWidth: ((width) / 2),
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, SlideLeftRoute(page: Delivery()));
                  },
                  color: Theme.of(context).primaryColor,
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
