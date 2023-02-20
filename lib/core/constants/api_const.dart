class APIConst {
  static const String apiURL = "https://lider.hdd.uz/";

  static String tokenUrl(String serverName) => "${apiURL}api/mobile/tokens";
  static String currentUser = 'api/mobile/Users/current';
}
