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

class LinkSaverHome extends StatefulWidget {
  @override
  _LinkSaverHomeState createState() => _LinkSaverHomeState();
}

class _LinkSaverHomeState extends State<LinkSaverHome> {
  List<LinkItem> links = [
    LinkItem(url: 'https://example.com', title: 'Example', category: 'Tutorial'),
    // Add more dummy links here for demonstration
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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement link adding functionality
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class LinkItem {
  String url;
  String title;
  String category;

  LinkItem({required this.url, required this.title, required this.category});
}
