import 'package:flutter/material.dart';
import 'package:widgettest/src/pages/subcats_page.dart';

//clase para listar imagenes con titulo y subtitulo
// en crossAxisCount podes definir cuantas queres x columna

class BestOfferGrid extends StatelessWidget {
  final bestOffers = [
    {
      'title': 'Most Affordable Mobile',
      'image': 'assets/best_offer/best_offer_3.jpg'
    },
    {
      'title': 'Mobile under ₹7000',
      'image': 'assets/best_offer/best_offer_1.jpg'
    },
    {
      'title': 'Best Deals on Laptop',
      'image': 'assets/best_offer/best_offer_2.jpg'
    },
    {
      'title': 'Most Affordable Mobile',
      'image': 'assets/best_offer/best_offer_3.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(bestOffer) {
      final item = bestOffer;
      return InkWell(
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 12.0,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.cover,
                ),
              ),
              new Padding(
                padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'item.name txttttttttttttt',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFD73C29),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'item.category txttttttttttttttt',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          //clase q abririas sub cats / TopOffers
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopOffers(title: '${item['title']}')),
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.all(0.0),
      alignment: Alignment.center,
      width: width - 20.0,
      //height: 120.0,
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: List.generate(bestOffers.length, (index) {
          return getStructuredGridCell(bestOffers[index]);
        }),
      ),
    );
  }
}
