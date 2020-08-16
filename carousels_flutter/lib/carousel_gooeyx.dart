import 'package:carousels_flutter/menu.dart';
import 'package:carousels_flutter/widget/content_card.dart';
import 'package:flutter/material.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';
//import 'package:gooey_carousel/widget/content_card.dart';

//enlace ///https://pub.dev/packages/gooey_carousel
class XCarouselGooey extends StatelessWidget {
  static final String path = "lib/src/pages/todo/todo_home3.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('gooey_carousel'),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: menu_drawer(),
      body: Stack(children: <Widget>[
        GooeyCarousel(
          children: <Widget>[
            ContentCard(
              color: 'Yellow',
              altColor: Color(0xFF904E93),
              title: "Pokemon Yellow",
              subtitle:
                  'Pensar que esta es la tercera edición de los primeros videojuegos de pokémon del género RPG para Game Boy.',
            ),
            ContentCard(
              color: 'Blue',
              altColor: Color(0xFFFFB138),
              title: "Pokemon Zafiro",
              subtitle:
                  'La primer región en la cual me lance por mi parte desde el inicio, como primer meta intente conseguir todos los pokemones y cuando estaba tan cerca de lograrlo por desgracia me robaron el gameboy.',
            ),
            ContentCard(
              color: 'Red',
              altColor: Color(0xFF4259B2),
              title: "Este carousel abarca \ntodo el cuerpo",
              subtitle: 'Para mas infotmacion buscar gooey_carousel.',
            ),
          ],
        ),
      ]),
    );
  }
}
