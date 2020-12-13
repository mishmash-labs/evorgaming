import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  UserData(this._prefs) {
    loadPreferences();
  }

  String _userId;
  final String _userIdPrefs = 'userid';

  bool _loggedIn;
  final String _loggedInPrefs = 'loggedin';
  final SharedPreferences _prefs;

  void loadPreferences() {
    _userId = _prefs.getString(_userIdPrefs) ?? "";
    _loggedIn = _prefs.getBool(_loggedInPrefs) ?? false;
  }

  String get userId => _userId;

  bool get loggedIn => _loggedIn;

  SharedPreferences get prefs => _prefs;

  set userId(String id) {
    _prefs.setString(_userIdPrefs, id);
    _userId = id;
  }

  set loggedIn(bool li) {
    _prefs.setBool(_loggedInPrefs, li);
    _loggedIn = li;
  }
}
