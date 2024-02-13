import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Implement your signup/authentication logic here
                // You can access entered data using _nameController.text, _emailController.text, _passwordController.text
                // For example, you can print the values to the console
                print('Name: ${_nameController.text}');
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            // Google Login Button
            GestureDetector(
              onTap: () {
                // Implement Google login logic here
                print('Login with Google');
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Icon(
                    Icons.g_translate,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Copyright text with clickable link
            GestureDetector(
              onTap: () {
                _launchURL('https://www.bugruster.live'); // Replace with your website URL
              },
              child: Container(
                child: Center(
                  child: Text(
                    '© BugRuster',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey, // Change the color as needed
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _launchURL(String url) async {
    await launch(url);
  }
}
