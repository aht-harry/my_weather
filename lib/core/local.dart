import 'dart:convert';
import 'package:my_weather/Models/seach.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Local {
  Future<void> addToList(Town town) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('town_list');
    final data = prefs.getString('town_list');
    List<Town> list = [];
    if (data != null) {
      // list.add({
      //   'name': town.name,
      //   'country': town.country,
      //   'state': town.state,
      //   'localNames': town.localNames,
      //   'lat': town.lat,
      //   'lon': town.lon,
      // });
      // prefs.setString('town_list', jsonEncode(list));
    } else {
      list.add(town);
      list.map((e) {
        // print(e.country);
      });
      // prefs.setString('town_list', jsonEncode(list));
    }
  }

  Future<List<Town>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('town_list');
    if (data != null) {
      List<String> list = (jsonDecode(data!) as List<dynamic>)
          .map((e) => e.toString())
          .toList();
      if (list == null) {
        return [];
      }
      return [];
    }
    return [];
  }
}
