import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  UserData(this._prefs) {
    loadPreferences();
  }

  bool _loggedIn;
  final String _loggedInPrefs = 'loggedin';
  final SharedPreferences _prefs;
  String _userId;
  final String _userIdPrefs = 'userid';
  final String _userNumberID = 'userNumID';
  int _userNumID;

  void loadPreferences() {
    _userId = _prefs.getString(_userIdPrefs) ?? "";
    _loggedIn = _prefs.getBool(_loggedInPrefs) ?? false;
    _userNumID = _prefs.getInt(_userNumberID) ?? 0;
  }

  String get userId => _userId;

  bool get loggedIn => _loggedIn;

  int get userNumID => _userNumID;

  SharedPreferences get prefs => _prefs;

  set userId(String id) {
    _prefs.setString(_userIdPrefs, id);
    _userId = id;
  }

  set loggedIn(bool li) {
    _prefs.setBool(_loggedInPrefs, li);
    _loggedIn = li;
  }

  set userNumID(int uid) {
    _prefs.setInt(_userNumberID, uid);
    _userNumID = uid;
  }
}
