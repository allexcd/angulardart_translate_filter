# angulardart_translate_filter

AngularDart i18n translate filter

How to use the example provided
-------------------------------

- Create a new Dart project. (Open DartEditor - File - New Project)
- Open pubspec.yaml file
- Add these lines to pubspec.yaml:

```dart
dependencies:
  angular: '>=1.1.0 <2.0.0'
  browser: '>=0.10.0+2 <0.11.0'
  web_components: '>=0.10.1 <0.11.0'
  angulardart_translate_filter: any
```
- Run pub get. Wait for dependencies to be loaded.
- Copy example directory to the root of your project
- Copy "lib/components" directory to the "lib" directory of your project
- Right click your project name and choose Refresh using DartEditor
- Open example/main.dart file and change these lines:

```dart
import 'package:angulardart_translate_filter/components/header.dart';
import 'package:angulardart_translate_filter/components/footer.dart';
import 'package:angulardart_translate_filter/components/content.dart';
```

to

```dart
import 'package:yourProjectName/components/header.dart';
import 'package:yourProjectName/components/footer.dart';
import 'package:yourProjectName/components/content.dart';
```

Open pubspec.yaml file, add these lines at the end and then save it:

```dart
transformers:
- angular:
    html_files:
      - lib/components/header.html
```

Right click on index.html file and choose "Run in Dartium"

### See main.dart for service setup:

```dart
  TranslateConfig translateConfig = new TranslateConfig();
  translateConfig.localeSetup = {
    "activeLang": "En", //starting language
    "localeFiles": {"prefix": 'i18n/lang-', "suffix": '.json'}, //locale files prefix + suffix
    "langsList": ['En', 'Ro'] //the list used for creating languages menu
  };
```

How to use the filter inside your app
-------------------------------------

- Add dependencies to pubspec.yaml

```dart
dependencies:
  angular: '>=1.1.0 <2.0.0'
  browser: '>=0.10.0+2 <0.11.0'
  web_components: '>=0.10.1 <0.11.0'
  angulardart_translate_filter: any
```

or load the package via DartEditor (open pubspec.yaml file, click on "Overview" tab, click on the "Add" button and search for "angulardart_translate_filter"

- Open your main.dart file and setup the i18n filter and import dependencies:
```dart
import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';
```

- Add the filter to the app module:

```dart
class AppModule extends Module{
  AppModule(){
    bind(Translate);
    ...
  }
}
```

- Configure the filter:

```dart
  TranslateConfig translateConfig = new TranslateConfig();
  translateConfig.localeSetup = {
    "activeLang": "En", //starting language
    "localeFiles": {"prefix": 'i18n/lang-', "suffix": '.json'}, //locale files prefix + suffix
    "langsList": ['En', 'Ro'] //the list used for creating languages menu
  };
```

### Use the filter in your components:

- Open your component dart file and import the dependencies required for the filter to work: "angular" and "angulardart_translate_filter"

```dart
    import 'package:angular/angular.dart';
    import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';
```

- load the filter inside your component's controller:

```dart
    class yourConstructor{
        @NgOneWay('activeLang')
        Map activeLang;
        TranslateConfig translateConfig;

        yourConstructor(this.translateConfig){
            activeLang = translateConfig.getActiveLang;
        }
    }
```

- Use the filter inside your component's html file:

```dart
    {{'key' | translate:{'lang':activeLang.langCode} }}
```

### Reference
https://pub.dartlang.org/packages/angulardart_translate_filter