# TD Flutter - PopupMenuButton

## Lancer l'application

```
flutter pub get
flutter run
```

## Fonctionnement

Le widget `PopupMenuButton` est placé dans les `actions` de l'`AppBar` via `AppPopupMenuButton`. La propriété `itemBuilder` construit la liste des `PopupMenuItem`, chacun avec une valeur unique (route). La sélection est gérée par `onSelected`, qui appelle `Navigator.pushNamed` vers la page correspondante. `initialValue` indique la page actuelle. Les propriétés `tooltip`, `icon`, `elevation`, `offset`, `shape`, `constraints` et `color` personnalisent l'apparence.

## Fichiers principaux

- `lib/main.dart` : point d'entrée et routes.
- `lib/widgets/app_popup_menu_button.dart` : menu réutilisable.
- `lib/pages/*_page.dart` : pages de l'application.
