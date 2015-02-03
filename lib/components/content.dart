library Content;

import 'package:angular/angular.dart';
import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';

@Component(
  selector: 'content',
  templateUrl: 'content.html',
  useShadowDom: false
)
class Content{
  @NgOneWay('activeLocale')
  Map activeLocale;
  
  Translate translate;
  Content(this.translate){
    activeLocale = translate.getActiveLocale;
  }
}