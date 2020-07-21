import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/carrito.dart';
import 'package:flutter_getjsonlist/service/home_service.dart';
import 'package:flutter_getjsonlist/service/products_service.dart';
import 'package:provider/provider.dart';

//pusiste inicio pero es Lista de productos
class Inicio extends StatefulWidget {
  const Inicio({Key key, this.catid}) : super(key: key);
  final catid;

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  void getProductList(String txt) async {
    await Provider.of<ProductsService>(context).getArticlesByCategory(txt);
  }

  @override
  Widget build(BuildContext context) {
    getProductList(widget.catid);
    final headlines = Provider.of<ProductsService>(context).listaArticulos;
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.catid} Lista de productos'),
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
