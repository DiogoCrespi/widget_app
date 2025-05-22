import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_app/homepage.dart';
import 'package:widget_app/newsdetailspage.dart';

void main() {
  runApp(const MyApp());
}

// 7. Categoria: Estilo
// Widget: Theme
// Demonstra alternância de tema claro/escuro usando ThemeMode e ThemeData
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demonstração de Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
        ),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF18191A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF23272A),
          foregroundColor: Colors.white,
          elevation: 0.5,
        ),
      ),
      themeMode: _themeMode,
      home: HomePage(onToggleTheme: _toggleTheme, themeMode: _themeMode),
    );
  }
}


