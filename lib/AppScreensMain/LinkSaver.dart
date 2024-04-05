import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool isSelected;
  DocumentSnapshot doc;

  LinkItem({
    required this.url,
    required this.title,
    required this.category,
    this.isSelected = false,
    required this.doc,
  });
}

class LinkSaverHome extends StatefulWidget {
  @override
  _LinkSaverHomeState createState() => _LinkSaverHomeState();
}

class _LinkSaverHomeState extends State<LinkSaverHome> {
  final DatabaseService _databaseService = DatabaseService();
  List<LinkItem> selectedLinks = [];
  TextEditingController urlController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Link Saver'),
        actions: [
          if (selectedLinks.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _deleteSelectedLinks,
            ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _databaseService.getAllLinks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          var links = snapshot.data?.docs.map((doc) {
            return LinkItem(
              url: doc['url'],
              title: doc['title'],
              category: doc['category'],
              doc: doc,
            );
          }).toList() ?? [];

          return ListView.builder(
            itemCount: links.length,
            itemBuilder: (context, index) {
              return Card(
                color: links[index].isSelected ? Colors.blueGrey[700] : null,
                child: ListTile(
                  title: Text(links[index].title, style: TextStyle(color: Colors.white)),
                  subtitle: Text(links[index].url, style: TextStyle(color: Colors.grey)),
                  trailing: Checkbox(
                    value: links[index].isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        links[index].isSelected = value!;
                        if (value) {
                          selectedLinks.add(links[index]);
                        } else {
                          selectedLinks.removeWhere((element) => element.doc.id == links[index].doc.id);
                        }
                      });
                    },
                  ),
                  onLongPress: () {
                    setState(() {
                      links[index].isSelected = !links[index].isSelected;
                      if (links[index].isSelected) {
                        selectedLinks.add(links[index]);
                      } else {
                        selectedLinks.removeWhere((element) => element.doc.id == links[index].doc.id);
                      }
                    });
                  },
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

  void _deleteSelectedLinks() async {
    for (var link in selectedLinks) {
      await _databaseService.deleteLink(link.doc.id);
    }
    setState(() {
      selectedLinks.clear();
    });
  }
}
