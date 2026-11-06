import 'package:flutter/material.dart';
import 'pages/design_preview_page.dart';
import 'pages/home_page.dart';
import 'pages/products_page.dart';
import 'pages/store_page.dart';
import 'pages/sellers_page.dart';
import 'pages/sales_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupMenuButton - TD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/products': (context) => const ProductsPage(),
        '/store': (context) => const StorePage(),
        '/sellers': (context) => const SellersPage(),
        '/sales': (context) => const SalesPage(),
        '/design': (context) => const DesignPreviewPage(),
      },
    );
  }
}
