import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Medels/Artical.dart';

class SecondScreen extends StatelessWidget {
  List<Artincal> list = [];
  SecondScreen({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Text(list[index].title , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(list[index].urlToImage),
                ),
                  Text(list[index].description)
              ],
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
