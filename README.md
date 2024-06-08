# CODEV Project - Troover Admin

Troover's Administration Page, written in Dart, realized during the CODEV project at Polytech Lyon.

## Run the project

To run the project:
- Install the Flutter SDK on your computer
- Add the flutter SDK (path to the `bin` folder) in your PATH variables

You can follow the steps described  [here](https://codelabs.developers.google.com/codelabs/flutter-codelab-first).

In VS Code:
- Install the `Flutter` extensions
- Make sure VS Code knows where the Flutter SDK is located
- Launch the following command to make sure you have all the packages needed (you can use the VS Code interface to do so, using `Ctrl+Shift+P` on Windows, or `Cmd+Shift+P` on MacOS, and then type in the command)
```sh
flutter doctor
```
- If needed, please download and add the other packages before continuing

- Finally, run the following commands to initialize the project
```sh
flutter clean
flutter pub get
```
Normally, you should not be having any errors at this point.

The last step is to launch the `lib/main.dart` file, using the `Start Debugging` icon at the top. As Flutter uses hot reloading, you should not need to click again on this button during you development.

## General Structure

The important files and folders are the following:
- `assets/`: Contains every images used in the project
- `lib/`: Contains every .dart files, see *Continuing the Development* for more details
- `pubspec.yaml`: Contains this project's settings and specifications, you should only modify the `dependencies` or `flutter/assets` categories

## Continuing the Development

**Please create a new branch per additional feature developed, and open a Merge Request to add it on the `main` branch.**

### Code Organization

In the `lib/` folder, you'll find various sub-folders:
- `config/`: Contains the routes of the app
- `localization/`: Contains the JSON lang files
- `models/`: Contains the models of the app
- `pages/`: Contains all pages/screens of the app, also organized in sub-folders
- `providers/`: Contains the providers/viewmodels of the app
- `samples/`: Contains samples of data to be used if the back is not completed
- `services/`: Contains the services of the app, mainly used by the controllers or for the API connection
- `themes/`: Contains the color palette and the color themes for the app
- `utils/`: Contains some utils functions and classes
- `widgets/`: Contains all custom widgets of the app, mainly used within one or multiple pages

If you add new entries in the `pages/`, `widgets/` or any other sub-folder, please use the file with the same name as the sub-folder (so `pages/_pages.dart` and `widgets/_widgets.dart` for instance) to export your files, specifying which classes to export using the `show` keyword.

Example: 
```dart 
export 'navigation_item.dart' show NavigationItem;
```
> This line will only export NavigationItem from the file `navigation_item.dart`.

Then, please import those export files if needed elsewhere instead of each files individually, to reduce the total number of imports per file. 

---

## TODOs

- Tester si tous les objets ont bien des méthodes ajout/mise à jour/suppression fonctionnelles
- Fix les dépendances entre objets (ex: pouvoir ajouter un ou plusieurs domains à une demande)
- Gérer les contraintes de clé étrangères comme erreurs pour avertir l'utilisateur (lors de la suppression notamment)
- Réutiliser ces modèles et cette architecture pour le projet principal, car meilleurs et plus clairs/optimisés