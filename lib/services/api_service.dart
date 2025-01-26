import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{

  static Future<http.Response> getworkoutFromworkoutAPI() async {
    var response = await http.get(Uri.parse("https://workoutapi.co/api/v2/workout?limit=250"));
    print("Response: ${response.body}");
    return response;
  }
  
  static Future<dynamic> getAbilitiesForworkout(String id) async{
    final response = await http.get(Uri.parse("https://workoutapi.co/api/v2/workout/$id"));
    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      var data = jsonDecode(response.body);
      print("data $data");
      return data;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }
}