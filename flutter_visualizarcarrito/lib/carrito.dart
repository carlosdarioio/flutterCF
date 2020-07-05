import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/model/order_api_model.dart';
import 'package:flutter_getjsonlist/pagar.dart';
import 'package:flutter_getjsonlist/service/products_service.dart';
import 'package:provider/provider.dart';

class Carrito extends StatefulWidget {
  const Carrito({Key key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

//X AQUI VAS PENDIENTE DEFINIR ID DE ARTICULOS A CARGARR
//PARA MOSTRAR LISRA DE ARTICULOS
class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    double widthFull = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //OrderApi().cliente.orderItem.removeAt(index);
    final carrito = Provider.of<ProductsService>(context).carrito;
    int cartItem = carrito.length;
    double cartTotal = 0;
    for (int i = 0; i < carrito.length; i++) {
      cartTotal += (double.parse(carrito[i].price) *
          int.parse(carrito[i].stockquantity));
      //se agrego esto para aser test de post al servicio!!!
      OrderItem xOrderItem = new OrderItem();
      xOrderItem.productId = int.parse(carrito[i].id);
      xOrderItem.quantity = int.parse(carrito[i].stockquantity);
      OrderApi().actores3.add(xOrderItem);
      OrderApi().cliente.orderItem = OrderApi().actores3;
    }
    OrderApi().cliente.orderTotal = cartTotal.toString();

    // No Item in Cart AlertDialog Start Here
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text(
              "Alert",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("No Item in Cart"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    // No Item in Cart AlertDialog Ends Here

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.developer_board), onPressed: null),
          //IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: widthFull,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: ((widthFull) / 2),
                height: 50.0,
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Total: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' L. $cartTotal',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: ((widthFull) / 2),
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Pagar', //Pay Now
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    (cartTotal == 0)
                        ? _showDialog()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pagar())).then((value) {
                            setState(() {
                              // refresh state of Page1
                            });
                          });
                  },
                  color: (cartTotal == 0)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: carrito.length,
            itemBuilder: (BuildContext context, int index) {
              final item = carrito[index];
              return Container(
                child: Card(
                    elevation: 3.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 120.0,
                              height: ((height - 200.0) / 4.0),
                              child: Image(
                                image: NetworkImage('${item.picture}'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${item.name}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Price:',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'L. ${item.price}',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text: 'Cantidad:  ',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '  ${item.stockquantity}', //pendiente agregar cantidad q el lleva
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.blue)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    child: Container(
                                      color: Colors.grey,
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        'Remover',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        //cartItemList.removeAt(index);
                                        double quan =
                                            double.parse(item.stockquantity);
                                        double pric = double.parse(item.price);
                                        cartItem--;
                                        cartTotal = cartTotal -
                                            (quan * pric); //item.price;
                                        carrito.removeAt(index);

                                        OrderApi().cliente.orderTotal =
                                            cartTotal.toString();
                                        //OrderApi().cliente.orderItem.removeAt(index);
                                      });

                                      // Then show a snackbar.
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text("Item Removed")));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
