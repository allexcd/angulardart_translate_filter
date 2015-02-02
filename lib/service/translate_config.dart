part of Translate;

class TranslatePersistingData {
  static List langsList;
  static Map langMap;
  static Map localeFiles;
}

@Injectable()
class TranslateConfig extends TranslateLoader {
  Map _activeLang = {
    "langCode": null
  };

  void _setActiveLang(String lang) {
    _setActiveLocaleMap(TranslatePersistingData.localeFiles["prefix"] + lang.toLowerCase() + TranslatePersistingData.localeFiles["suffix"]).then((_) {
      _activeLang["langCode"] = lang;
    });
  }

  void _setLocaleFiles(Map setup) {
    TranslatePersistingData.localeFiles = setup;
  }

  void _setLangsList(List langs) {
    TranslatePersistingData.langsList = langs;
  }

  get setActiveLang => _setActiveLang;
  get getActiveLang => _activeLang;

  void set localeSetup(Map setup) {
    _setLocaleFiles(setup["localeFiles"]);
    _setLangsList(setup["langsList"]);
    _setActiveLang(setup["activeLang"]);
  }
}

class TranslateLoader {
  _setActiveLocaleMap(url) {
    return HttpRequest.getString(url).then((String response) {
      TranslatePersistingData.langMap = JSON.decode(response);
    });
  }
}

@Injectable()
class Translate {
  List get langsList => TranslatePersistingData.langsList;

  String doTranslate(String key) {
    return ObjectSearch.getPropertyValue(key, TranslatePersistingData.langMap).toString();
  }
}
