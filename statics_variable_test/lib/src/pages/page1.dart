import 'package:flutter/material.dart';
import 'package:statics_variable_test/src/models/global_class_test.dart';
import 'package:statics_variable_test/src/pages/page2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    if (Glob().account != "onPressed_depage2") {
      // Glob().account = "johanacct1_page1";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('txt pagina1 ${Glob().account}'),
            new FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.red,
              elevation: 3.0,
              onPressed: () {
                Glob().account = "1onPressed_depage1";
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()))
                    .then((value) {
                  setState(() {
                    // refresh state of Page1
                  });
                });
              },
              child: Icon(Icons.access_time),
            ),
            new FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Colors.red,
              elevation: 3.0,
              onPressed: () {
                Glob().account = "2onPressed_depage1";
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()))
                    .then((value) {
                  setState(() {
                    // refresh state of Page1
                  });
                });
              },
              child: Icon(Icons.access_time),
            ),
          ],
        ),
      ),
    );
  }
}
