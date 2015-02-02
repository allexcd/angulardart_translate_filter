import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';

import 'package:angulardart_translate_filter/components/header.dart';
import 'package:angulardart_translate_filter/components/footer.dart';
import 'package:angulardart_translate_filter/components/content.dart';

class AppModule extends Module{
  AppModule(){
    bind(Translate);
    bind(TranslateConfig);
    bind(TranslateFormatter);
    bind(Header);
    bind(Footer);
    bind(Content);
  }
}

void main(){
  TranslateConfig translateConfig = new TranslateConfig();
  translateConfig.localeSetup = {
    "activeLang": "En",
    "localeFiles": {"prefix": 'i18n/lang-', "suffix": '.json'},
    "langsList": ['En', 'Ro']
  };
  
  applicationFactory().addModule(new AppModule()).run();
}