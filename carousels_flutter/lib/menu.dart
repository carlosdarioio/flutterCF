import 'package:carousels_flutter/carousel_slider.dart';
import 'package:carousels_flutter/carousel_gooeyx.dart';
import 'package:carousels_flutter/carousel_xmobile.dart';
import 'package:carousels_flutter/carousel_xmulti.dart';
import 'package:flutter/material.dart';

class menu_drawer extends StatelessWidget {
  const menu_drawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Mostrando Carousels',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
          ),
          ListTile(
            title: Text('carousel_pro'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Carousel_slider()));
            },
          ),
          ListTile(
            title: Text('gooey_carousel'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => XCarouselGooey()));
            },
          ),
          ListTile(
            title: Text('flutter_multi_carousel'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CarouselxMulti()));
              // ...
            },
          ),
          ListTile(
            title: Text('flutter_mobile_carousel'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MobileCarousel()));

              // ...
            },
          ),
        ],
      ),
    );
  }
}
