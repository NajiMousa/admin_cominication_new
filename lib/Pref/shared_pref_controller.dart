import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



enum PrefKeys {
  lang,
  lat,
  long,
  permisin,
  typeUser,
  login,
  editProfile,
  phone,
  name,
  image
}
enum PrefKeysUser {
  name,
  dis,
  birthday,
  gender,
  email,
  lat,
  long,
  image,
  address,
  phone,
  id,
  token,
  DateSup,
  typeSup,
  IDNumber
}

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setLanguage({required String lang}) async {
    await _sharedPreferences.setString(PrefKeys.lang.toString(), lang);
  }

  Future<void> setType({required String typeUser}) async {
    await _sharedPreferences.setString(PrefKeys.typeUser.toString(), typeUser);
  }

  Future<void> setphone({required String phone}) async {
    await _sharedPreferences.setString(PrefKeys.phone.toString(), phone);
  }

  Future<void> setname({required String name}) async {
    await _sharedPreferences.setString(PrefKeys.name.toString(), name);
  }

  Future<void> setImage({required String image}) async {
    await _sharedPreferences.setString(PrefKeys.image.toString(), image);
  }

  Future<void> setPermision() async {
    await _sharedPreferences.setBool(PrefKeys.permisin.toString(), true);
  }

  Future<void> setEditProfile() async {
    await _sharedPreferences.setBool(PrefKeys.editProfile.toString(), true);
  }

  Future<void> setlogin() async {
    await _sharedPreferences.setBool(PrefKeys.login.toString(), true);
  }

  String get language =>
      _sharedPreferences.getString(PrefKeys.lang.toString()) ?? 'ar';

  String get phone =>
      _sharedPreferences.getString(PrefKeys.phone.toString()) ?? '';

  String get name =>
      _sharedPreferences.getString(PrefKeys.name.toString()) ?? '';

  bool get permisin =>
      _sharedPreferences.getBool(PrefKeys.permisin.toString()) ?? false;

  bool get editProfile =>
      _sharedPreferences.getBool(PrefKeys.editProfile.toString()) ?? false;

  bool get login =>
      _sharedPreferences.getBool(PrefKeys.login.toString()) ?? false;

  String get typeUser =>
      _sharedPreferences.getString(PrefKeys.typeUser.toString()) ?? "BasedUser";

  String get image =>
      _sharedPreferences.getString(PrefKeys.image.toString()) ?? "";

  Future<void> setCuruntLocation(
      {required double lat, required double long}) async {
    await _sharedPreferences.setDouble(PrefKeys.lat.toString(), lat);
    await _sharedPreferences.setDouble(PrefKeys.long.toString(), long);
  }



  Future<void> setlogout() async {
    await _sharedPreferences.clear();
    //  await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), false);
  }
}
