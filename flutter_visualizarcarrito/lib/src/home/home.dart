import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/carrito.dart';
import 'package:flutter_getjsonlist/service/home_service.dart';
import 'package:flutter_getjsonlist/src/subCats/subcats.dart';

import 'package:provider/provider.dart';

//pusiste inicio pero es Lista de productos
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<HomeCategoriesService>(context).headlines;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mall504'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.developer_board),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Carrito()))
                    .then((value) {
                  setState(() {
                    // refresh state of Page1
                  });
                });
              }),
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      body: Container(
        child: GridView.builder(
            itemCount: headlines.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: Column(
                children: <Widget>[
                  new InkResponse(
                    child: FadeInImage(
                      image: NetworkImage('${headlines[index].picture}'),
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      fit: BoxFit.cover,
                      height: 100.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SubCats(catid: '${headlines[index].id}')),
                      );
                    },
                  ),
                  ListTile(
                    //leading: Icon(Icons.photo_album),
                    title: Text(
                        '${headlines[index].id}-${headlines[index].name}',
                        style: TextStyle(fontSize: 14.0)),
                  )
                ],
              ));
            }),
      ),
    );
  }
}
