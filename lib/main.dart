import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _formColor = Colors.white;
  bool _showChildForm = false;

  void _changeToRed() {
    setState(() {
      _formColor = Colors.red;
    });
  }

  void _changeToWhite() {
    setState(() {
      _formColor = Colors.white;
    });
  }

  void _changeToGreen() {
    setState(() {
      _formColor = Colors.green;
    });
  }

  bool changeColor(Color color) {
    setState(() {
      _formColor = color;
    });
    return true;
  }

  void _openNewForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewFormScreen()),
    );
  }

  void _showPopupMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Popup Message"),
          content: Text("This is a popup message!"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change App'),
        backgroundColor: Colors.purple[200],
      ),
      body: Container(
        color: _formColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(Colors.red, "Red Button"),
              SizedBox(height: 20),
              buildButton(Colors.green, "Green Button"),
              SizedBox(height: 20),
              buildButton(Colors.white, "White Button"),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _openNewForm, child: Text("New Form")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: _showPopupMessage, child: Text("PopUp")),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(Color color, String label) {
    return ElevatedButton(
      onPressed: () {
        changeColor(color);
      },
      child: Text(label),
    );
  }
}

class NewFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Form'),
        backgroundColor: Colors.yellow[200],
      ),
      body: Container(
        color: Colors.purple[400], // Set the background color to pink
        child: Center(
          child: Text(
            'This is a new form!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
