import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:boring_flutter_app/res/strings/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';

abstract class BusRepository {

  Future<List<BusInfo>> getBusRoute(String stopId);

  //This API takes a 6-digit bus stop ID and returns the respective bus stop information
  
  Future<List<Bus>> getBusStop(String stopId);

  /*  This API takes a Citybus/New World First Bus company ID 
  and the company’s operating bus route number
  and returns the respective route information.*/
  Future<List<Bus>> getBusRouteStop(String companyId);

  /* This API takes a Citybus/New World First Bus company ID, bus stop ID and the
  company’s operating bus route number; then it returns the “estimated time of arrival” (ETA)
  information of the respective route at that stop.
  (Remark: May return 1 or 2 ETA data and at most 3 ETA data will be provided.) 
  */
  Future<List<Bus>> getBusETA(String companyId, String stopId, String route);


}

class BusRepositoryImpl implements BusRepository {
  @override
  Future<List<Bus>> getBusETA(
    String companyId,
    String stopId,
    String route,
  ) async {
    var response =
        await http.get(AppStrings.busUrl + "citybus-nwfb/eta/NWFB/001357/$route");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = BusETA.fromJson(data);
      return result.data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Bus>> getBusStop(
    String company_id,
  ) async {
    var response =
        await http.get(AppStrings.busUrl + "citybus-nwfb/eta/CTB/001145/11");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = BusETA.fromJson(data);
      return result.data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Bus>> getBusRouteStop(
    String company_id, // NWFB    CTB
  ) async {
    var response =
        await http.get(AppStrings.busUrl + "citybus-nwfb/eta/CTB/001145/11");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = BusETA.fromJson(data);
      return result.data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<BusInfo>> getBusRoute(
    String company_id, // NWFB    CTB
  ) async {
    var response =
        await http.get(AppStrings.busUrl + "citybus-nwfb/route/CTB");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = ApiResultBusRoutesModel.fromJson(data);
      return  result.data;
    } else {
      throw Exception();
    }
  }
}
