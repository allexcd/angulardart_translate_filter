library ObjectSearch;

class ObjectSearch {
  static getPropertyValue(String propertyChain, Map map) {

    List split(String propertyChain) {
      return propertyChain.split('.');
    }

    getPropertyValue(List properties, Map map) {
      if (properties != null && map != null) {
        var value = map;

        properties.forEach((property) {
          value = value[property];
        });

        return value;
      }
    }

    return getPropertyValue(split(propertyChain), map);
  }
}