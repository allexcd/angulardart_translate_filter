library Content;

import 'package:angular/angular.dart';
import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';

@Component(
  selector: 'content',
  templateUrl: 'content.html',
  useShadowDom: false
)
class Content{
  @NgOneWay('activeLang')
  Map activeLang;
  
  TranslateConfig translateConfig;
  Content(this.translateConfig){
    activeLang = translateConfig.getActiveLang;
  }
}