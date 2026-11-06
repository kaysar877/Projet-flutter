import 'package:flutter/material.dart';

/// Spécification de design centralisée — source unique partagée par
/// l'aperçu design (`/design`) et les outils de design (Figma).
class DesignRouteSpec {
  const DesignRouteSpec({
    required this.route,
    required this.pageName,
    required this.menuLabel,
    required this.appbarTitle,
    required this.icon,
    required this.iconName,
    required this.headline,
    required this.subtitle,
  });

  final String route;
  final String pageName;
  final String menuLabel;
  final String appbarTitle;
  final IconData icon;
  final String iconName;
  final String headline;
  final String subtitle;
}

/// Les 5 routes du TD, dans l'ordre du menu.
/// NB : l'AppBar « Vente » diffère du libellé menu « Ventes » (code réel).
const List<DesignRouteSpec> designRoutes = [
  DesignRouteSpec(
    route: '/',
    pageName: 'HomePage',
    menuLabel: 'Accueil',
    appbarTitle: 'Accueil',
    icon: Icons.home,
    iconName: 'home',
    headline: "Bienvenue à la page d'accueil!",
    subtitle: 'Commencez votre navigation ici.',
  ),
  DesignRouteSpec(
    route: '/products',
    pageName: 'ProductsPage',
    menuLabel: 'Produits',
    appbarTitle: 'Produits',
    icon: Icons.shopping_bag,
    iconName: 'shopping_bag',
    headline: 'Bienvenue à la page des produits!',
    subtitle: 'Découvrez notre catalogue de produits.',
  ),
  DesignRouteSpec(
    route: '/store',
    pageName: 'StorePage',
    menuLabel: 'Magasin',
    appbarTitle: 'Magasin',
    icon: Icons.store,
    iconName: 'store',
    headline: 'Bienvenue à la page du magasin!',
    subtitle: 'Visitez notre magasin en ligne.',
  ),
  DesignRouteSpec(
    route: '/sellers',
    pageName: 'SellersPage',
    menuLabel: 'Vendeurs',
    appbarTitle: 'Vendeurs',
    icon: Icons.people,
    iconName: 'people',
    headline: 'Bienvenue à la page des vendeurs!',
    subtitle: 'Retrouvez nos vendeurs partenaires.',
  ),
  DesignRouteSpec(
    route: '/sales',
    pageName: 'SalesPage',
    menuLabel: 'Ventes',
    appbarTitle: 'Vente',
    icon: Icons.attach_money,
    iconName: 'attach_money',
    headline: 'Bienvenue à la page des ventes!',
    subtitle: 'Suivez vos ventes et vos performances.',
  ),
];

/// Propriétés réelles de AppPopupMenuButton (lib/widgets/app_popup_menu_button.dart).
const List<(String, String)> popupMenuProps = [
  ('tooltip', '« Afficher les options »'),
  ('icon', 'more_vert · 24 · onSurfaceVariant'),
  ('elevation', '8'),
  ('offset', '(0, 8) depuis le bouton'),
  ('shape', 'RoundedRectangle r = 12'),
  ('constraints', 'minWidth 200 · maxWidth 260'),
  ('color', 'Colors.white (explicite)'),
  ('item', '48 px · ListTile 16/16'),
  ('initialValue', 'route courante → surlignée'),
  ('onSelected', 'Navigator.pushNamed(route)'),
  ('même route', 'no-op (menu se referme)'),
];

String designHexOf(Color c) {
  final rgb = c.value & 0xFFFFFF;
  return '#${rgb.toRadixString(16).padLeft(6, '0').toUpperCase()}';
}
