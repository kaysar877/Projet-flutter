import 'package:flutter/material.dart';

class AppPopupMenuButton extends StatelessWidget {
  const AppPopupMenuButton({
    super.key,
    required this.currentRoute,
    this.onRouteSelected,
  });

  final String currentRoute;

  /// Si fourni, remplace la navigation réelle (utilisé par l'aperçu design).
  final void Function(String route)? onRouteSelected;

  static const List<_MenuOption> _options = [
    _MenuOption(route: '/', label: 'Accueil', icon: Icons.home),
    _MenuOption(route: '/products', label: 'Produits', icon: Icons.shopping_bag),
    _MenuOption(route: '/store', label: 'Magasin', icon: Icons.store),
    _MenuOption(route: '/sellers', label: 'Vendeurs', icon: Icons.people),
    _MenuOption(route: '/sales', label: 'Ventes', icon: Icons.attach_money),
    _MenuOption(route: '/design', label: 'Aperçu design', icon: Icons.palette),
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: currentRoute,
      tooltip: 'Afficher les options',
      icon: const Icon(Icons.more_vert),
      elevation: 8,
      offset: const Offset(0, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 260),
      color: Colors.white,
      onSelected: (String value) {
        if (value == currentRoute) return;
        final handler = onRouteSelected;
        if (handler != null) {
          handler(value);
          return;
        }
        Navigator.pushNamed(context, value);
      },
      itemBuilder: (BuildContext context) {
        return _options
            .map(
              (option) => PopupMenuItem<String>(
                value: option.route,
                child: ListTile(
                  leading: Icon(option.icon),
                  title: Text(option.label),
                ),
              ),
            )
            .toList();
      },
    );
  }
}

class _MenuOption {
  const _MenuOption({
    required this.route,
    required this.label,
    required this.icon,
  });

  final String route;
  final String label;
  final IconData icon;
}
