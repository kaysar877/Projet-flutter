import 'package:flutter/material.dart';
import '../widgets/app_popup_menu_button.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
        actions: const [AppPopupMenuButton(currentRoute: '/products')],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_bag, size: 64),
              const SizedBox(height: 16),
              Text('Bienvenue à la page des produits!', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Découvrez notre catalogue de produits.', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
