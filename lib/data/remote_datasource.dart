import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesk_task_getx/data/dto_models/result_dto.dart';

class RemoteDatsource {
  static Future<ResultDTO> getData() async {
    const baseUrl = 'https://reqres.in/api/users?page=2';
    // final requestUrl = baseUrl + word;

    final response = await http.get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {
      return ResultDTO.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
