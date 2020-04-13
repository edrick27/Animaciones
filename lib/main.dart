import 'package:flutter/material.dart';


import 'package:animate_example/src/page/painga1_page.dart';
 

void main() => runApp(MyApp());
 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate App',
      home: Pagina1Page()
    );
  }
}