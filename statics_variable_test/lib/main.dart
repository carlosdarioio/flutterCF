import 'package:flutter/material.dart';
import 'package:statics_variable_test/src/models/global_class_test.dart';
import 'package:statics_variable_test/src/pages/page1.dart';
//testiando pasar valores
//y editando ver si cambian en nuevas ventanas
//asi como en la inicial

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas ${Glob().account}',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Page1(),
      },
    );
  }
}
