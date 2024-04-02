import 'package:flutter/material.dart';

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
  List<LinkItem> links = [
    LinkItem(url: 'https://example.com', title: 'Example', category: 'Tutorial'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Link Saver'),
      ),
      body: ListView.builder(
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
              onTap: () => _showLinkDetails(links[index]),
            ),
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
    // Open a dialog to add a new link
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Link"),
          content: Text("Implement your link adding functionality here."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showLinkDetails(LinkItem link) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(link.title),
          content: Text("URL: ${link.url}\nCategory: ${link.category}"),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
