import 'dart:async';
import 'dart:convert';
import 'dart:developer';
//import 'dart:convert'

import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/inicio.dart';
import 'package:flutter_getjsonlist/model/order_api_model.dart';

import 'package:http/http.dart' as http;

//import 'package:go_kart/pages/login.dart';
//import 'package:go_kart/pages/home.dart';

//My Own Imports
//import 'package:go_kart/Animation/fadeIn.dart';

class Pagar extends StatefulWidget {
  //Signup
  @override
  _PagarState createState() => _PagarState();
}

class _PagarState extends State<Pagar> {
  // Initially password is obscure
  bool _obscureText = true;
  bool _obscureText1 = true;

  // Toggles the password show status
  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _viewPassword1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //x aqui vas pone los valores a la clase global de manera manual
    //eso para aser el post al servicio y ver como responde
    OrderApi().cliente.billingAddressId = "99";
    OrderApi().cliente.cardCvv2 = "031";
    OrderApi().cliente.cardExpirationMonth = "07";
    OrderApi().cliente.cardExpirationYear = "21";
    OrderApi().cliente.cardName = "carlosdarioio";
    OrderApi().cliente.cardNumber = "4565419025310807";
    OrderApi().cliente.cardType = "Visa";
    OrderApi().cliente.customOrderNumber = "99";
    OrderApi().cliente.customerId = "99";
    OrderApi().cliente.id = "99";
    OrderApi().cliente.pickUpInStore = "0";
    OrderApi().cliente.shippingAddressId = "1";
    OrderApi().cliente.storeId = "1";

    OrderApi().cliente.orderTotal = "99";
    OrderApi().cliente.email = "cdfn3@hotmail.com";
    OrderApi().cliente.catid = "99";
    //OrderApi().cliente.orderTotal //ya esta calculado junto a articulos

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Pagar",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alatsi',
                    ),
                  ),
                  onTap: () {},
                ),
                Text(
                  'Mall504',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alatsi',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 50.0, left: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage('assets/img/no-image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Nombre',
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Tarjeta',
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Mes de vencimiento',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: _viewPassword,
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                        //obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Año de vencimiento',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: _viewPassword,
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                        //obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Card Code',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: _viewPassword1,
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                        obscureText: _obscureText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                InkWell(
                  child: Container(
                    height: 45.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey[300],
                      color: Colors.white,
                      borderOnForeground: false,
                      elevation: 5.0,
                      child: GestureDetector(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 7.0,
                              ),
                              InkWell(
                                child: Text(
                                  "Pagasr",
                                  style: TextStyle(
                                    fontFamily: 'Alatsi',
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  //accion de pago--------------------------------------
                                  createAlbumPOST('hay madre');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15.0,
                        fontFamily: 'Alatsi',
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: Text(
                        'Inicio',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18.0,
                          fontFamily: 'Alatsi',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Inicio()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void createAlbumPOST(String title) async {
    String gg = OrderApi().clientToJson(OrderApi().cliente);

    print('PostEmpezando $gg');
    final http.Response response = await http.post(
        'http://service.mall504.com/NopService.svc/xpostOrderCelphone',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: OrderApi().clientToJson(OrderApi()
            .cliente) // jsonEncode(<String, String>{      'title': title,    }),
        );
    //console log
    print('data: $response');
  }

  void createAlbumGET(String title) async {
    String gg = OrderApi().clientToJson(OrderApi().cliente);
    print('GetEmpezando $gg');
    final response = await http.get(
        'http://service.mall504.com/NopService.svc/xpostOrderCelphone/$gg');

    print('LASTdata: $response.body');
  }
//test post alolaaaaaaaaaaaaaaaaa
}
