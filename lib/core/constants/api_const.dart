class APIConst {
  static const String apiURL = "https://192.168.1.128:7177/";
  static String loginUrl(String serverName)=>'$apiURL/$serverName/api/mobile/tokens';
}
