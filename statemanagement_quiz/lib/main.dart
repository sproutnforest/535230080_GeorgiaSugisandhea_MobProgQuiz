import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentTheme = 1;
  int currentFont = 1;

  Color modeonebutton = Color(0xFFD19C1D);
  Color modeonebar = Color(0xFF472C1B);
  Color modeoneback = Color(0xFF1B512D);

  Color modetwobutton = Color(0xFFF2DC5D);
  Color modetwobar = Color(0xFFA76D60);
  Color modetwoback = Color(0xFF566246);

  Color modethreebutton = Color(0xFFFF8966);
  Color modethreebar = Color(0xFF6B0F1A);
  Color modethreeback = Color(0xFF31081F);

  void themeone() {
    setState(() {
      currentTheme = 1;
    });
  }

  void themetwo() {
    setState(() {
      currentTheme = 2;
    });
  }

  void themethree() {
    setState(() {
      currentTheme = 3;
    });
  }

  void fontone() {
    setState(() {
      currentFont = 1;
    });
  }

  void fonttwo() {
    setState(() {
      currentFont = 2;
    });
  }

  void fontthree() {
    setState(() {
      currentFont = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color barColor;
    Color backgroundColor;
    Color buttonColor;
    TextStyle textFont;

    if (currentTheme == 1) {
      buttonColor = modeonebutton;
      barColor = modeonebar;
      backgroundColor = modeoneback;
    } else if (currentTheme == 2) {
      buttonColor = modetwobutton;
      barColor = modetwobar;
      backgroundColor = modetwoback;
    } else {
      buttonColor = modethreebutton;
      barColor = modethreebar;
      backgroundColor = modethreeback;
    }

    if (currentFont == 1) {
      textFont = GoogleFonts.lato();
    } else if (currentFont == 2) {
      textFont = GoogleFonts.lato();
    }

    return MaterialApp(
      theme: ThemeData(
        primaryColor: barColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
            color: barColor,
            titleTextStyle:
                TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom your own page!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pick your color theme: ', // Custom text added here
                style: TextStyle(
                  color: Colors.white, // Change font color
                  fontSize: 24, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(buttonColor),
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 3, 3)), // Text color
                ),
                onPressed: themeone,
                child: Text('Vintage Theme'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(buttonColor),
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 3, 3)), // Text color
                ),
                onPressed: themetwo,
                child: Text('Salmon Sushi Theme'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(buttonColor),
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 3, 3)), // Text color
                ),
                onPressed: themethree,
                child: Text('Choco n Wine Theme'),
              ),
              SizedBox(height: 40),
              const Text(
                'Pick your font: ', // Custom text added here
                style: TextStyle(
                  color: Colors.white, // Change font color
                  fontSize: 24, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(buttonColor),
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 3, 3)), // Text color
                ),
                onPressed: themeone,
                child: Text('Vintage Theme'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(buttonColor),
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 3, 3)), // Text color
                ),
                onPressed: themetwo,
                child: Text('Salmon Sushi Theme'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(buttonColor),
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 3, 3)), // Text color
                ),
                onPressed: themethree,
                child: Text('Choco n Wine Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
