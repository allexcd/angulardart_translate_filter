library Header;

import 'package:angular/angular.dart';
import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';

@Component(
  selector: 'header',
  templateUrl: 'header.html',
  useShadowDom: false
)
class Header{
  Translate translate;
  TranslateConfig translateConfig;
  Header(this.translate, this.translateConfig);
}