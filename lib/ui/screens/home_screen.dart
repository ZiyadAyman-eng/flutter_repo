import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/dat_models/product_data_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductDataModel> mylist = [];
  
  Future<void> getProductData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if(response.statusCode == 200){
      Map<String,dynamic> data = jsonDecode(response.body);
      List<dynamic> productList = data['products'];
      for(Map<String,dynamic> item in productList){
        ProductDataModel p = ProductDataModel.fromMapJson(item);
        mylist.add(p);
      }

      setState(() {});
    }else{
      print('error${response.statusCode}');
      print('error${response.body}');
    }
  }

  @override
  void initState(){
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: mylist.length,
          padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 300,
            ),
            itemBuilder: (context, index){
              return Container(
                child:Stack(
                  children: [
                    Center(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 200,
                          width: 160,
                          child: Container(
                            child: mylist[index].imageUrl !=null
                              ?Image.network(mylist[index].imageUrl!, fit: BoxFit.cover,)
                              :Image.asset('assets/images/img_1.png', fit: BoxFit.cover,) ,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 65,
                        left: 7,
                        right: 7,
                        child: Text(
                          '${mylist[index].name ?? 'No Data'}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                    ),
                    Positioned(
                      bottom: 37,
                        left: 7,
                        right: 7,
                        child: Text(
                          '${mylist[index].description ?? 'No Data'}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 7,
                      right: 7,
                        child:Text(
                            'Price ${mylist[index].price ?? 'No Data'}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),


                    ),
                    Positioned(
                      bottom: 10,
                      right: 7,
                      child:Icon(
                        Icons.shopping_bag,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
        }
        )
      ),
      );
  }
}