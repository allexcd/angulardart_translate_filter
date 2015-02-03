part of Translate;

Map activeLocale = {
    "langCode": null,
    "langMap": {
    }
};
List langsListConfig;
Map localeFilesConfig;

abstract class LocaleMap {
  _setLocaleMap(url) {
    return HttpRequest.getString(url).then((String response) {
      activeLocale["langMap"] = JSON.decode(response);
    });
  }
}

class TranslateSetup extends LocaleMap {
  TranslateSetup({String activeLangCode, List langsList, Map localeFiles}) {
    _setLocaleMap(localeFiles["prefix"] + activeLangCode.toLowerCase() + localeFiles["suffix"]).then((_) {
      activeLocale["langCode"] = activeLangCode; //triggers the filter
    });
    langsListConfig = langsList;
    localeFilesConfig = localeFiles;
  }
}

@Injectable()
class TranslateConfig extends LocaleMap {
  void setActiveLang(String lang) {
    _setLocaleMap(localeFilesConfig["prefix"] + lang.toLowerCase() + localeFilesConfig["suffix"]).then((_) {
      activeLocale["langCode"] = lang;
    });
  }
}

@Injectable()
class Translate {
  List get langsList => langsListConfig;

  Map get getActiveLocale => activeLocale;

  String doTranslate(String key) {
    return ObjectSearch.getPropertyValue(key, activeLocale["langMap"]).toString();
  }
}