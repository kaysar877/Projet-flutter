import 'package:flutter/material.dart';

import '../design/design_spec.dart';
import '../widgets/app_popup_menu_button.dart';
import 'home_page.dart';
import 'products_page.dart';
import 'sellers_page.dart';
import 'sales_page.dart';
import 'store_page.dart';

/// Page d'aperçu du design system, rendue avec le thème réel de l'app.
/// Accessible via le route « /design » (entrée « Aperçu design » du menu).
class DesignPreviewPage extends StatelessWidget {
  const DesignPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aperçu design'),
        actions: const [AppPopupMenuButton(currentRoute: '/design')],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _SectionTitle('Design tokens'),
          _TokensCard(),
          SizedBox(height: 24),
          _SectionTitle('Type scale — Roboto'),
          _TypeScaleCard(),
          SizedBox(height: 24),
          _SectionTitle('Écrans — aperçu miniature (code réel)'),
          _MiniScreens(),
          SizedBox(height: 24),
          _SectionTitle('Composant — AppPopupMenuButton'),
          _AnatomyCard(),
          SizedBox(height: 24),
          _SectionTitle('Essayer le menu (comportement réel)'),
          _LiveMenuDemo(),
          SizedBox(height: 24),
          _SectionTitle('Flux & routes'),
          _RoutesCard(),
          SizedBox(height: 24),
          _ObservationCard(),
          SizedBox(height: 16),
          _FigmaCard(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _DesignCard extends StatelessWidget {
  const _DesignCard({required this.child, this.padding = const EdgeInsets.all(16)});

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: child,
    );
  }
}

class _TokensCard extends StatelessWidget {
  const _TokensCard();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final highlight = Theme.of(context).highlightColor;
    final rows = <(String, Color, String)>[
      ('surface (AppBar + corps)', cs.surface, 'échantillonné'),
      ('onSurface (titres, textes)', cs.onSurface, ''),
      ('onSurfaceVariant (icônes)', cs.onSurfaceVariant, ''),
      ('primary', cs.primary, 'fromSeed(Colors.blue)'),
      ('primaryContainer', cs.primaryContainer, ''),
      ('onPrimaryContainer', cs.onPrimaryContainer, ''),
      ('surfaceContainerHighest', cs.surfaceContainerHighest, ''),
      ('surfaceContainer (menus M3)', cs.surfaceContainer, 'défaut M3'),
      ('menu — color explicite', Colors.white, 'color: Colors.white'),
      ('highlight (item actif)', highlight, 'Theme.highlightColor'),
      ('icônes corps (défaut)', const Color(0xDD000000), 'kDefaultIconDarkColor'),
      ('error', cs.error, ''),
    ];

    return _DesignCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (name, color, note) in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 26,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: cs.outlineVariant),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      note.isEmpty ? name : '$name  ·  $note',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    designHexOf(color),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'RobotoMono',
                          color: cs.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          Text(
            'Seed : Colors.blue · #2196F3 — ColorScheme.fromSeed, thème clair',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _TypeScaleCard extends StatelessWidget {
  const _TypeScaleCard();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final samples = <(TextStyle?, String, String)>[
      (tt.headlineMedium, 'headlineMedium', '28/36 · w400'),
      (tt.titleLarge, 'titleLarge', '22/28 · w400 · AppBar'),
      (tt.bodyLarge, 'bodyLarge', '16/24 · items du menu'),
      (tt.bodyMedium, 'bodyMedium', '14/20 · sous-titre'),
      (tt.labelLarge, 'labelLarge', '14/20 · w500'),
    ];
    return _DesignCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (style, name, meta) in samples)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Roboto Aa',
                    style: style?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    '$name  ·  $meta',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _MiniScreens extends StatelessWidget {
  const _MiniScreens();

  Widget _pageAt(int index) {
    switch (index) {
      case 1:
        return const ProductsPage();
      case 2:
        return const StorePage();
      case 3:
        return const SellersPage();
      case 4:
        return const SalesPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 524,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        itemCount: designRoutes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, i) {
          final spec = designRoutes[i];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 216,
                height: 460,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: 390,
                    height: 844,
                    child: AbsorbPointer(child: _pageAt(i)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${(i + 1).toString().padLeft(2, '0')} · ${spec.menuLabel}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                spec.route,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'RobotoMono',
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnatomyCard extends StatelessWidget {
  const _AnatomyCard();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return _DesignCard(
      child: Wrap(
        spacing: 28,
        runSpacing: 24,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OpenMenuMock(),
              const SizedBox(height: 10),
              Text(
                '200 × 256 · rayon 12 · élévation 8',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
          SizedBox(
            width: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (k, v) in popupMenuProps)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 108,
                          child: Text(k,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          child: Text(v,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: cs.onSurfaceVariant)),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Représentation statique du menu ouvert, aux mesures réelles du composant.
class _OpenMenuMock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final highlight = Theme.of(context).highlightColor;
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          for (final spec in designRoutes)
            Container(
              height: 48,
              color: spec.route == '/' ? highlight : Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(spec.icon, size: 24, color: cs.onSurfaceVariant),
                  const SizedBox(width: 16),
                  Text(
                    spec.menuLabel,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Démo interactive : un écran 390 px de large avec le vrai
/// AppPopupMenuButton ; la sélection change l'écran affiché.
class _LiveMenuDemo extends StatefulWidget {
  const _LiveMenuDemo();

  @override
  State<_LiveMenuDemo> createState() => _LiveMenuDemoState();
}

class _LiveMenuDemoState extends State<_LiveMenuDemo> {
  String _route = '/';

  void _onPick(BuildContext menuContext, String route) {
    if (route == '/design') {
      Navigator.pushNamed(menuContext, '/design');
      return;
    }
    setState(() => _route = route);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final spec = designRoutes.firstWhere((r) => r.route == _route);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Container(
        width: 390,
        height: 500,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: cs.outlineVariant),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text(spec.appbarTitle),
              actions: [
                AppPopupMenuButton(
                  currentRoute: _route,
                  onRouteSelected: (route) => _onPick(context, route),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(spec.icon, size: 64, color: const Color(0xDD000000)),
                      const SizedBox(height: 16),
                      Text(
                        spec.headline,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        spec.subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoutesCard extends StatelessWidget {
  const _RoutesCard();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return _DesignCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Routes nommées (lib/main.dart)',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('ROUTE',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: cs.onSurfaceVariant)),
              ),
              Expanded(
                flex: 2,
                child: Text('PAGE',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: cs.onSurfaceVariant)),
              ),
              Expanded(
                child: Text('MENU',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: cs.onSurfaceVariant)),
              ),
              Expanded(
                child: Text('APPBAR',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: cs.onSurfaceVariant)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (final spec in designRoutes)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: cs.outlineVariant.withOpacity(0.4))),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(spec.route,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: 'RobotoMono',
                              color: cs.primary,
                            )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(spec.pageName,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Expanded(
                    child: Text(spec.menuLabel,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Expanded(
                    child: Text(spec.appbarTitle,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ObservationCard extends StatelessWidget {
  const _ObservationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6C96B)),
      ),
      child: Text(
        'Observation : l\'AppBar affiche « Vente » (sales_page.dart) alors que le menu '
        'affiche « Ventes » (app_popup_menu_button.dart) — à harmoniser.',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: const Color(0xFF7A6100)),
      ),
    );
  }
}

class _FigmaCard extends StatelessWidget {
  const _FigmaCard();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Design Figma : design/figma-design.svg — glissez-déposez ce fichier dans Figma '
        'pour obtenir des calques vectoriels éditables (mesures et couleurs issues de ce '
        'thème réel). Les ombres d\'élévation peuvent être à recréer en « Effects ».',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: cs.onPrimaryContainer),
      ),
    );
  }
}
