import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/models/cource/cource.dart';
import 'package:http/http.dart' as http;
import 'package:project_team_3/models/cource/datum.dart';

class CourceController extends GetxController {
  final String apiConnect = "192.168.1.15:80";
  Future<Cource> showData() async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiCource";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Datum cources = Datum.fromJson(response.body);
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
}
