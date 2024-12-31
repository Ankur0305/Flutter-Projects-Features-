import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Form with Validation"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormExample(),
        ),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String age = '';

  // Validate Name
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Validate Email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  // Validate Age
  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    return null;
  }

  // Form Submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted Successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue[50], // Background color of the form
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurple, width: 2), // Border around the form
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Field
            Center(
              child: Container(
                width: 300, // Adjust the width of the text field
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: validateName,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
            ),
            // Space between Name and Email
            SizedBox(height: 16.0),
            
            // Email Field
            Center(
              child: Container(
                width: 300, // Adjust the width of the text field
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: validateEmail,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
            ),
            // Space between Email and Age
            SizedBox(height: 16.0),

            // Age Field
            Center(
              child: Container(
                width: 300, // Adjust the width of the text field
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: validateAge,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
              ),
            ),

            // Space before the Submit button
            SizedBox(height: 24.0),

            // Centered Submit Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18.0, // Increase font size for larger button text
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent, // Button color
                    padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 32.0), // Larger button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
}
