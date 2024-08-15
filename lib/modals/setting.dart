import 'package:shared_preferences/shared_preferences.dart';

class Setting {
  Setting({this.useDarkTheme = false});
  bool useDarkTheme;

  static Future<Setting> initialize() async {
    //For each new setting we have to setup like this :(
    final pref = await SharedPreferences.getInstance();

    final setting = Setting(useDarkTheme: pref.getBool("useDarkTheme")!);
    return setting;
  }

  void save() async {
    final pref = await SharedPreferences.getInstance();

    pref.setBool("useDarkTheme", useDarkTheme);
  }
}
