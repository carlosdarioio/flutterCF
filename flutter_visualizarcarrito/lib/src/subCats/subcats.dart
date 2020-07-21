import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/carrito.dart';
import 'package:flutter_getjsonlist/inicio.dart';
import 'package:flutter_getjsonlist/service/home_service.dart';
import 'package:flutter_getjsonlist/service/products_service.dart';

import 'package:provider/provider.dart';

//pendiente definir que se requiere mandar cat id
class SubCats extends StatefulWidget {
  final String catid;
  const SubCats({Key key, @required this.catid}) : super(key: key);

  @override
  _SubCatsState createState() => _SubCatsState();
}

class _SubCatsState extends State<SubCats> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getprovider(String txt) async {
    await Provider.of<HomeCategoriesService>(context).getArticulosxCarrito(txt);
  }

  @override
  Widget build(BuildContext context) {
    getprovider(widget.catid);
    final headlines = Provider.of<HomeCategoriesService>(context).carrito;
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
                            builder: (context) => Inicio(
                                  catid: headlines[index].id,
                                )), //pusisteinicio pero es lista de art
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
