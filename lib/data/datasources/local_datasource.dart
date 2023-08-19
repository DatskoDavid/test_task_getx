import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto_models/person_dto.dart';

const cachedPersonsList = 'cached_persons_list';

class LocalDatasource {
  final SharedPreferences sharedPreferences;

  LocalDatasource(this.sharedPreferences);

  Future<List<PersonDTO>> getPersonsFromCache() {
    final jsonPersonsList = sharedPreferences.getStringList(cachedPersonsList);

    return Future.value(jsonPersonsList
        ?.map((person) => PersonDTO.fromJson(json.decode(person)))
        .toList());
  }

  Future<void> personsToCache(List<PersonDTO> persons) {
    final List<String> jsonPersonsList =
        persons.map((person) => json.encode(person.toJson())).toList();

    sharedPreferences.setStringList(cachedPersonsList, jsonPersonsList);
    return Future.value(jsonPersonsList);
  }
}
