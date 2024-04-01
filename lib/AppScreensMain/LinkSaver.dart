import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkSaver extends StatefulWidget {
  const LinkSaver({super.key});

  @override
  State<LinkSaver> createState() => _LinkSaverState();
}

class _LinkSaverState extends State<LinkSaver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Saver'),
      ),
      body: const Center(
        child: Text('This is the link saver page'),
      ));
  }
}
