import 'package:flutter/material.dart';
import '../widgets/app_popup_menu_button.dart';

class SellersPage extends StatelessWidget {
  const SellersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendeurs'),
        actions: const [AppPopupMenuButton(currentRoute: '/sellers')],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.people, size: 64),
              const SizedBox(height: 16),
              Text('Bienvenue à la page des vendeurs!', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Retrouvez nos vendeurs partenaires.', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
