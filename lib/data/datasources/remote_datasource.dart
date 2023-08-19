import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesk_task_getx/data/dto_models/result_dto.dart';

class RemoteDatsource {
  Future<ResultDTO> getData(int page) async {
    const baseUrl = 'https://reqres.in/api/users?page=';
    final requestUrl = '$baseUrl$page';

    final response = await http.get(
      Uri.parse(requestUrl),
    );

    if (response.statusCode == 200) {
      return ResultDTO.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
