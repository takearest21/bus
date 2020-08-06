import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:boring_flutter_app/res/strings/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class BusRepository {
  Future<List<Bus>> getBus(String company_id);
}

class BusRepositoryImpl implements BusRepository {

  @override
  Future<List<Bus>> getBus(String company_id,) async {
    
    var response = await http.get(AppStrings.busUrl+"citybus-nwfb/route/CTB/107");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception();
    }
  }

}

