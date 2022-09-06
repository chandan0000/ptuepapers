import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilsController extends ChangeNotifier {
  UtilsController() {
    getTheme();
  }

  //! theme utils
  bool tDark = false;
  void darkTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isDark', value);
    tDark = value;
    notifyListeners();
  }

  void getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isDark = sharedPreferences.getBool('isDark');
    tDark = isDark ?? false;
    notifyListeners();
  }

//! bottom utils
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
