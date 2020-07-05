import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/carrito.dart';
import 'package:flutter_getjsonlist/service/products_service.dart';
import 'package:provider/provider.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<ProductsService>(context).headlines;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de productos'),
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
                      print(index);
                    },
                  ),
                  ListTile(
                    //leading: Icon(Icons.photo_album),
                    title: Text('${headlines[index].name}',
                        style: TextStyle(fontSize: 14.0)),
                    subtitle: Text('L. ${headlines[index].price}',
                        style: TextStyle(fontSize: 11.0)),
                  )
                ],
              ));
            }),
      ),
    );
  }
}
