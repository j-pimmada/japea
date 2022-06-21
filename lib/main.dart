import 'package:flutter/material.dart';
import 'package:japea/states/authen.dart';

//constructor method (ชื่อเดียวกับคลาส จะรันเป็น method แรก)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    ); //container > materialApp
  }
}
