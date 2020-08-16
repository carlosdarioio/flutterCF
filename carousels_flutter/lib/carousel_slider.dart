import 'package:carousels_flutter/menu.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//enlace //https://pub.dev/packages/carousel_pro
class Carousel_slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('carousel_prox'),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: menu_drawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Text(
              "carousel_pro",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
              height: 150.0,
              width: 300.0,
              child: Carousel(
                images: [
                  NetworkImage(
                      'https://androidayuda.com/app/uploads-androidayuda.com/2019/10/pokemon.jpg'),
                  NetworkImage(
                      'https://4.bp.blogspot.com/-6LljjYdpjcw/UtWzeB5oBII/AAAAAAAABl8/OpKBIDoO9Ek/w400/descarga.jpg'),
                  NetworkImage(
                      'https://www.vhv.rs/dpng/d/593-5930064_dart-programming-language-icon-hd-png-download.png'),
                ],
              )),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
