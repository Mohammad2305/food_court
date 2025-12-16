import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences dataSaver;

  // initialize the data cache
  static Future<void> initialData() async {
    dataSaver = await SharedPreferences.getInstance();
  }

  // save the data
  static Future<bool> setData(String key, dynamic value) async {
    if(value is int){
      await dataSaver.setInt(key, value);
      return true;
    }
    else if(value is double){
      await dataSaver.setDouble(key, value);
      return true;
    }
    else if(value is bool){
      await dataSaver.setBool(key, value);
      return true;
    }
    else if(value is String){
      await dataSaver.setString(key, value);
      return true;
    }
    else{
      return false;
    }
  }

  // get data
  static dynamic getData(String key){
    return dataSaver.get(key);
  }

  // remove data item
  static void deleteData(String key){
    dataSaver.remove(key);
  }

  // clear data item
  static Future<void> clearData() async {
    await dataSaver.clear();
  }
}