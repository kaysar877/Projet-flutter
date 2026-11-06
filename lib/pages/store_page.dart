import 'package:flutter/material.dart';
import '../widgets/app_popup_menu_button.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magasin'),
        actions: const [AppPopupMenuButton(currentRoute: '/store')],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.store, size: 64),
              const SizedBox(height: 16),
              Text('Bienvenue à la page du magasin!', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Visitez notre magasin en ligne.', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
