import 'package:flutter/material.dart';
import 'package:todo/SignUp/SignUp_Page_Name.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:todo/AppScreensMain/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email field
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Login button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Login'),
              ),
              SizedBox(height: 8.0),

              // Login with Google button
              OutlinedButton.icon(
                onPressed: () {
                  // Add your Google login logic here
                },
                icon: Icon(Icons.g_translate),
                label: Text('Login with Google'),
              ),
              SizedBox(height: 8.0),

              // Sign Up button
              TextButton(
                onPressed: () {
                  print("button Pressed for SignUp Page");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('Sign Up'),
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
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch a URL
  _launchURL(String url) async {
    await launch(url);
  }
}
