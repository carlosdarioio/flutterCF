import 'package:flutter/material.dart';
import 'package:statics_variable_test/src/models/global_class_test.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Glob().account = "johanacct1_page1";
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('txt pagina2 ${Glob().account}'),
            FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 3.0,
              onPressed: () {
                Glob().account = "onPressed_depage2";
                Navigator.pop(context);
                //Navigator.push(context, CartPage());
              },
              child: Icon(Icons.access_alarms),
            ),
          ],
        ),
      ),
    );
  }
}
