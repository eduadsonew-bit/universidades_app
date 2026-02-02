import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Necesario para usar json.decode
import '../model/university_model.dart';

class UniversityPageProvider extends ChangeNotifier {
  List<University> universities = [];
  bool isLoading = false;
  bool isGridView = false;

  Future<void> fetchUniversities() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(
          "https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json");

    
      final response = await http.get(url);

      if (response.statusCode == 200) {
        
        final List<dynamic> data = json.decode(response.body);

        
        universities =
            data.map((jsonItem) => University.fromJson(jsonItem)).toList();
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  
  void toggleLayout() {
    isGridView = !isGridView;
    notifyListeners();
  }

  void updateUniversity(University updatedUni) {
    final index = universities.indexWhere((u) => u.name == updatedUni.name);
    if (index != -1) {
      universities[index] = updatedUni;
      notifyListeners();
    }
  }
}
