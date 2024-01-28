import 'package:flutter/material.dart';
import 'package:shopping/ui/dashboard/dashboard_page.dart';
import 'package:shopping/ui/home/home_page.dart';
import 'package:shopping/ui/utils/Pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Pages.DASHBOARD,
      routes: {
        Pages.HOME: (context) => const HomePage(),
        Pages.DASHBOARD: (context) => const DashboardPage(),
      },
    );
  }
}
