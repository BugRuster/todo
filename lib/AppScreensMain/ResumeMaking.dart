import 'package:flutter/material.dart';

void main() {
  runApp(ResumeForm());
}

class ResumeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResumeFormPage(),
    );
  }
}

class ResumeFormPage extends StatefulWidget {
  @override
  _ResumeFormPageState createState() => _ResumeFormPageState();
}

class _ResumeFormPageState extends State<ResumeFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store form values
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _address = '';
  String _college = '';
  String _degree = '';
  String _branch = '';
  String _graduationYear = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add email format validation if needed
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // Add phone number format validation if needed
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) {
                  _address = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'College'),
                onSaved: (value) {
                  _college = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Degree'),
                onSaved: (value) {
                  _degree = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Branch'),
                onSaved: (value) {
                  _branch = value;
                },
              ),
              TextFormField(
                decoration:
                InputDecoration(labelText: 'Graduation Year (yyyy)'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your graduation year';
                  }
                  // Add graduation year format validation if needed
                  return null;
                },
                onSaved: (value) {
                  _graduationYear = value;
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Process the form data here (e.g., save to database)
                    // Display a confirmation message or navigate to the next screen
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Submitted'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Your resume details have been saved.'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
