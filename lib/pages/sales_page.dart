import 'package:flutter/material.dart';
import '../widgets/app_popup_menu_button.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vente'),
        actions: const [AppPopupMenuButton(currentRoute: '/sales')],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.attach_money, size: 64),
              const SizedBox(height: 16),
              Text('Bienvenue à la page des ventes!', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Suivez vos ventes et vos performances.', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
