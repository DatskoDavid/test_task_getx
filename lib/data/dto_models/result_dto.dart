import 'package:tesk_task_getx/data/dto_models/person_dto.dart';

class ResultDTO {
  final num page;
  final num perPage;
  final num total;
  final num totalPages;
  final List<PersonDTO> data;

  ResultDTO({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ResultDTO.fromJson(Map<String, dynamic> json) {
    final personsJson = json['data'] as List;

    final personsList = personsJson
        .map(
          (item) => PersonDTO.fromJson(item),
        )
        .toList();

    return ResultDTO(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: personsList,
    );
  }
}
