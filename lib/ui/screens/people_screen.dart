import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class peopleScreen extends StatefulWidget {
  const peopleScreen({super.key});

  @override
  State<peopleScreen> createState() => _peopleScreenState();
}

class _peopleScreenState extends State<peopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'People Screen',
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {

          return Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListTile(
              title: Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                  Icons.arrow_circle_right_sharp,
                color: Colors.white,
              ),
              subtitle: Text(
                'Hello thier',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.white
                ),
              ),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/images/img.png'),
              ),
            ),

          );
          
        },),
      ),
    );
  }
}
