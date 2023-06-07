import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_ambev/src/shared/services/local_storage/local_storage.dart';

class LocalStorageSharedPrefImpl extends LocalStorage {
  final SharedPreferences sharedPref;

  LocalStorageSharedPrefImpl({required this.sharedPref});

  @override
  Future load({required String key}) async {
    try {
      return sharedPref.get(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> remove({required String key})async {
    try {
      return await sharedPref.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> save({required String key, required value}) async{
    try {
      switch (value.runtimeType) {
        case String:
          return sharedPref.setString(key, value);
          case bool:
          return sharedPref.setBool(key, value);
          case double:
          return sharedPref.setDouble(key, value);
          case int:
          return sharedPref.setInt(key, value);
          case const (List<String>):
          return sharedPref.setStringList(key, value);
        default:
          throw('Tipo invalido!');
      }
      
      
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool contains({required String key}) {
    try {
      return sharedPref.containsKey(key);
    } catch (e) {
      rethrow;
    }
  }
}
