import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/inicio.dart';
import 'package:flutter_getjsonlist/service/products_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ProductsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'desicion',
        initialRoute: '/',
        routes: {'/': (BuildContext context) => Inicio()},
      ),
    );
  }
}
