import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MSG_What());
}

class MSG_What extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Send WhatsApp Message'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              sendWhatsAppMessage();
            },
            child: Text('Send Message on WhatsApp'),
          ),
        ),
      ),
    );
  }
}

void sendWhatsAppMessage() async {
  // Replace '1234567890' with the recipient's phone number (including country code)
  String phoneNumber = '1234567890';

  // Replace 'Hello%20World' with the message text (URL encoded)
  String messageText = 'Hello%20World';

  // Construct the WhatsApp message URL
  String url = 'https://wa.me/$phoneNumber?text=$messageText';

  // Launch the WhatsApp application with the specified message
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch WhatsApp');
  }
}
