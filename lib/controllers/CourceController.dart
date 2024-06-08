import 'dart:convert';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/connect.dart';
import 'package:project_team_3/models/cource/cource.dart';
import 'package:http/http.dart' as http;
import 'package:project_team_3/models/detail_cource/detail_cource.dart';
import 'package:project_team_3/models/kelas/kelas.dart';
import 'package:project_team_3/models/materi/materi.dart';

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

  Future<DetailCource> detailCource(String id) async {
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

  Future<Materi> viewMateri(String id) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiCource/materi";
      final response =
          await http.post(Uri.parse(apiUrl), body: {"cource_id": id});
      final jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        Materi materiData = Materi.fromMap(jsonData);
        return materiData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Kelas> classRoom(String id) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiClass";
      final response =
          await http.post(Uri.parse(apiUrl), body: {"id_user": id});
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final kelasData = Kelas.fromMap(jsonData);
        return kelasData;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
