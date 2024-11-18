import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: themeManager.getBarColor,
        scaffoldBackgroundColor: themeManager.getBackgroundColor,
        appBarTheme: AppBarTheme(
          color: themeManager.getBarColor,
          titleTextStyle: themeManager.getTextStyle.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: themeManager.getTextStyle,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

class ThemeManager extends ChangeNotifier {
  int _currentTheme = 1;
  int _currentFont = 1;

  // Theme configurations
  final Map<int, Color> _buttonColors = {
    1: Color(0xFFD19C1D),
    2: Color(0xFFF2DC5D),
    3: Color(0xFFFF8966),
  };

  final Map<int, Color> _barColors = {
    1: Color(0xFF472C1B),
    2: Color(0xFFA76D60),
    3: Color(0xFF6B0F1A),
  };

  final Map<int, Color> _backgroundColors = {
    1: Color(0xFF1B512D),
    2: Color(0xFF566246),
    3: Color(0xFF31081F),
  };

  // Font configurations
  final Map<int, TextStyle> _fontStyles = {
    1: GoogleFonts.lato(),
    2: GoogleFonts.roboto(),
    3: GoogleFonts.poppins(),
  };

  // Getters
  Color get getButtonColor => _buttonColors[_currentTheme]!;
  Color get getBarColor => _barColors[_currentTheme]!;
  Color get getBackgroundColor => _backgroundColors[_currentTheme]!;
  TextStyle get getTextStyle => _fontStyles[_currentFont]!;

  // Setters
  void setTheme(int theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void setFont(int font) {
    _currentFont = font;
    notifyListeners();
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the homepage!',
              style: themeManager.getTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Go to Settings',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pick your color theme:',
              style: themeManager.getTextStyle.copyWith(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => themeManager.setTheme(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Vintage Theme',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => themeManager.setTheme(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Salmon Sushi Theme',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => themeManager.setTheme(3),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Choco n Wine Theme',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Pick your font:',
              style: themeManager.getTextStyle.copyWith(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => themeManager.setFont(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Lato',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => themeManager.setFont(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Roboto',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => themeManager.setFont(3),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeManager.getButtonColor,
              ),
              child: Text(
                'Poppins',
                style: themeManager.getTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
