import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/inicio.dart';
import 'package:flutter_getjsonlist/service/home_service.dart';
import 'package:flutter_getjsonlist/service/products_service.dart';
import 'package:flutter_getjsonlist/src/home/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ProductsService()),
        ChangeNotifierProvider(create: (_) => new HomeCategoriesService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'desicion',
        initialRoute: 'inicio',
        routes: {
          '/': (BuildContext context) => Inicio(),
          'inicio': (BuildContext context) => Home(),
        },
      ),
    );
  }
}
