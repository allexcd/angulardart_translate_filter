part of Translate;

@Formatter(
  name: 'translate'    
)
class TranslateFormatter{
  Translate translate;
  TranslateFormatter(this.translate);
  
  call(String key, [Map<String, Object> variables]){
    return translate.doTranslate(key);
  }
}