import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../DatabaseFiles/DataBase.dart';

void main() {
  runApp(LinkSaver());
}

class LinkSaver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Link Saver',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LinkSaverHome(),
    );
  }
}

class LinkItem {
  String url;
  String title;
  String category;

  LinkItem({required this.url, required this.title, required this.category});
}

class LinkSaverHome extends StatefulWidget {
  @override
  _LinkSaverHomeState createState() => _LinkSaverHomeState();
}

class _LinkSaverHomeState extends State<LinkSaverHome> {
  final DatabaseService _databaseService = DatabaseService();
  String selectedCategory = 'General'; // Default category or dynamic selection
  TextEditingController urlController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Link Saver'),
      ),
      body: StreamBuilder(
        stream: _databaseService.getLinks(selectedCategory),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('StreamBuilder Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          var links = snapshot.data?.docs.map((doc) => LinkItem(
            url: doc['url'],
            title: doc['title'],
            category: doc['category'],
          )).toList() ?? [];
    if (links != null) {
      print('Fetched ${links.length} links');
    }

          return ListView.builder(
            itemCount: links.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(links[index].title, style: TextStyle(color: Colors.white)),
                  subtitle: Text(links[index].url, style: TextStyle(color: Colors.grey)),
                  trailing: Chip(
                    label: Text(links[index].category),
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewLink,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  void _addNewLink() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Link"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter Title"),
              ),
              TextField(
                controller: urlController,
                decoration: InputDecoration(hintText: "Enter URL"),
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(hintText: "Enter Category"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                if (urlController.text.isNotEmpty &&
                    titleController.text.isNotEmpty &&
                    categoryController.text.isNotEmpty) {
                  _databaseService.addLink({
                    'url': urlController.text,
                    'title': titleController.text,
                    'category': categoryController.text,
                  });
                  urlController.clear();
                  titleController.clear();
                  categoryController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}