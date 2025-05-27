import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SimpleLoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class SimpleLoginPage extends StatefulWidget {
  @override
  _SimpleLoginPageState createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String welcomeText = '';

  void login() {
    String id = idController.text.trim();
    String name = nameController.text.trim();

    if (id.isNotEmpty && name.isNotEmpty) {
      setState(() {
        welcomeText = 'Welcome $name (ID: $id)';
      });
    } else {
      setState(() {
        welcomeText = 'Please enter both ID and Name';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Student ID'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              welcomeText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
