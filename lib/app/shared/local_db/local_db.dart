import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDB {
  List<String>? getListString(String key);
  Future put(String key, List<String> value);
}

class PrefsImpl implements LocalDB {
  final SharedPreferences sharedPreferences;

  PrefsImpl(this.sharedPreferences);

  @override
  Future put(String key, List<String> value) async {
    return await sharedPreferences.setStringList(key, value);
  }

  @override
  List<String>? getListString(String key) {
    return sharedPreferences.getStringList(key);
  }
}
