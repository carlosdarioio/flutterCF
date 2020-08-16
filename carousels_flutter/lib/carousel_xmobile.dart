import 'package:carousels_flutter/menu.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobile_carousel/carousel.dart';
import 'package:flutter_mobile_carousel/default_carousel_item.dart';

//enlace https://pub.dev/packages/flutter_mobile_carousel
class MobileCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('carousel_proxx'),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: menu_drawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Text(
              "MobileCarousel",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ),
          const SizedBox(height: 10.0),
          Carousel(
              rowCount: 2,
              children: [
                'Item 1',
                'Item 2',
                'Item 3',
                'Item 4',
                'Item 5',
                'Item 6',
              ].map((String itemText) {
                return DefaultCarouselItem(itemText);
              }).toList()),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
