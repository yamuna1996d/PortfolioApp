import 'package:flutter/material.dart';
import '../screens/portfolio_screen.dart';
import 'theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _mode = ThemeMode.light; // ✅ Now state variable

  void _toggleTheme() {
    setState(() {
      _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yamuna G',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: PortfolioPage(
        onToggleTheme: _toggleTheme,
        isDark: _mode == ThemeMode.dark,
      ),
    );
  }
}
