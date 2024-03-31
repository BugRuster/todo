import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TODO_1 extends StatefulWidget {
  const TODO_1({super.key});

  @override
  State<TODO_1> createState() => _TODO_1State();
}

class _TODO_1State extends State<TODO_1> {
  bool Personal = true, College = false, Home = false;
  bool suggest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          openBox();
        },
        child: Icon(
          Icons.add,
          color: Colors.blue,
          size: 35,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Welcome!",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "Anurag",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "Let's get started with your tasks !",
                style: TextStyle(fontSize: 20, color: Colors.white60),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Personal ? Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Personal",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ) : GestureDetector(
                  onTap: () {
                    setState(() {
                      Personal = true;
                      College = false;
                      Home = false;
                      setState(() {

                      });
                    });
                  },
                  child: Text(
                    "Personal",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                College ? Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "College",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ) : GestureDetector(
                  onTap: () {
                    setState(() {
                      Personal = false;
                      College = true;
                      Home = false;
                      setState(() {

                      });
                    });
                  },
                  child: Text(
                    "College",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Home ? Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ) : GestureDetector(
                  onTap: () {
                    setState(() {
                      Personal = false;
                      College = false;
                      Home = true;
                      setState(() {

                      });
                    });
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CheckboxListTile(
              activeColor: Colors.white,
              checkColor: Colors.blue,
              title: Text("Suggest me tasks"),
              value: suggest, onChanged: (newValues){
              setState(() {
                suggest = newValues!;
              });
            },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              activeColor: Colors.white,
              checkColor: Colors.blue,
              title: Text("Let's do some Code !"),
              value: suggest, onChanged: (newValues){
              setState(() {
                suggest = newValues!;
              });
            },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
      ),
    );
  }
  openBox() {
    return showDialog(context: context, builder: (context)=> AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(width: 20),
                Text("Add Task", style: TextStyle(fontSize: 20),),
              ],),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Task",
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
