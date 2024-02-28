import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:todo/AppScreensMain/HomeScreen.dart';
import 'package:todo/AppScreensMain/MSG_What.dart';

void main() {
  runApp(OTPScreen());
}

class OTPScreen extends StatelessWidget {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OTP Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter OTP',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                controller: _otpController,
                length: 6,
                onChanged: (value) {
                  // Handle OTP changes
                },
                onCompleted: (value) {
                  // Handle OTP when all digits are entered
                  print('Completed: $value');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the entered OTP and proceed
                  String enteredOTP = _otpController.text;
                  // Add your validation logic here
                  if (enteredOTP == '123456') {
                    // Navigate to the next screen or perform the desired action
                    print('OTP is valid. Proceed to the next screen.');
                  } else {
                    print('Invalid OTP. Please try again.');
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MSG_What()),
                  );
                },
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

