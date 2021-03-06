library Footer;

import 'package:angular/angular.dart';
import 'package:angulardart_translate_filter/angulardart_translate_filter.dart';

@Component(
  selector: 'footer',
  templateUrl: 'footer.html',
  useShadowDom: false
)
class Footer{
  @NgOneWay('activeLocale')
  Map activeLocale;

  Translate translate;
  Footer(this.translate){
    activeLocale = translate.getActiveLocale;
  }
}