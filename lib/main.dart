import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/ui/screens/button_NB.dart';


void main(){
  runApp(NewApp());
}

class NewApp extends StatelessWidget{
  const NewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonNb(),
    );
  }
}

