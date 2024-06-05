import 'dart:convert';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/connect.dart';
import 'package:project_team_3/models/cource/cource.dart';
import 'package:http/http.dart' as http;
import 'package:project_team_3/models/detail_cource/detail_cource.dart';

class CourceController extends GetxController {
  final String apiConnect = APINum;
  final courceSearch = Cource().obs;
  Future<Cource> showData() async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiCource";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final cource = Cource.fromMap(jsonData);
        return cource;
      } else {
        print("Response Failed : ${response.statusCode}");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      e.printError();
      throw Exception('Failed to load data');
    }
  }

  Future<DetailCource> detailCource(int id) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiCource/$id";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData =
            json.decode(response.body.toString()) as Map<String, dynamic>;
        final cource = DetailCource.fromMap(jsonData);
        return cource;
      } else {
        print("Response Failed : ${response.statusCode}");
        throw Exception('Failed to load data 2');
      }
    } catch (e) {
      e.printError();
      throw Exception('Failed to load data 1');
    }
  }

  Future<Cource> searchCource(String query) async {
    try {
      final String apiUrl =
          "http://$apiConnect/api/search/cource?search=$query";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final cource = Cource.fromMap(jsonData);
        courceSearch.value = cource;
        return cource;
      } else {
        print("Response Failed : ${response.statusCode}");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception("Faild to load data");
    }
  }
}
