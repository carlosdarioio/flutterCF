import 'package:carousels_flutter/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';

//https://pub.dev/packages/flutter_multi_carousel
class CarouselxMulti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('flutter_multi_carousel'),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: menu_drawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Text(
              "multi_carousel",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: Carousel(
                height: 350.0,
                width: 350,
                initialPage: 3,
                allowWrap: false,
                type: Types.slideSwiper,
                onCarouselTap: (i) {
                  print("onTap $i");
                },
                indicatorType: IndicatorTypes.bar,
                arrowColor: Colors.black,
                axis: Axis.horizontal,
                showArrow: true,
                children: List.generate(
                    7,
                    (i) => Center(
                          child: Container(
                              color:
                                  Colors.greenAccent.withOpacity((i + 1) / 7)),
                        ))),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
