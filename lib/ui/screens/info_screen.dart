import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoScreen extends StatefulWidget {
  const infoScreen({super.key});

  @override
  State<infoScreen> createState() => _infoScreenState();
}

class _infoScreenState extends State<infoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Info Screen',
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: CircleAvatar(
                  radius: 200,
                  backgroundColor: Colors.blue,
                ),
              ),
              Positioned(
                bottom: -100,
                right: -100,
                child: CircleAvatar(
                  radius: 200,
                  backgroundColor: Colors.lightGreen,
                ),
              ),
              Positioned(
                top: -20,
                right: -132,
                child: CircleAvatar(
                  radius: 200,
                  backgroundColor: Colors.red.withOpacity(0.9),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Image.asset('assets/images/img.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
