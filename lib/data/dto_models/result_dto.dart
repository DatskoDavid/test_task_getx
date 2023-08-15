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
}
