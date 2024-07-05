class UtilitySupport {

  static bool isValidUrl(String url) {
    try {
      final uri = Uri.tryParse(url);
      return uri != null && uri.host.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static String? checkUrl(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter Url';
    } else {
      if (isValidUrl(val)) {
        return null;
      } else {
        return 'Please enter valid url';
      }
    }
  }

}