import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TODO1 extends StatelessWidget {
  const TODO1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            Colors.black
          ],
        ),
      ),
      child: Column(
        children: [
          Container(child: Text("TODO", style:TextStyle(fontSize: 100,color: Colors.white),),)
        ],
      ),
    ));
  }
}
