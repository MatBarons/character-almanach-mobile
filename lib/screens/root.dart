import 'package:character_almanach_mobile/screens/home.dart';
import 'package:character_almanach_mobile/screens/settings.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _navigate(String route) {
    _navigatorKey.currentState!.pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => _navigate('/'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _navigate('/settings'),
          ),
        ],
      ),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          Widget page;

          switch (settings.name) {
            case '/':
              page = const HomePage();
              break;
            case '/settings':
              page = const SettingsPage();
              break;
            default:
              page = const HomePage();
          }

          return MaterialPageRoute(
            builder: (_) => page,
            settings: settings,
          );
        },
      ),
    );
  }
}