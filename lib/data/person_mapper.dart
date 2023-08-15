import '../domain/models/person.dart';
import 'dto_models/person_dto.dart';

class PersonMapper {
  static Person fromDTO(PersonDTO personDTO) {
    return Person(
      id: personDTO.id.toInt(),
      email: personDTO.email,
      firstName: personDTO.firstName,
      lastName: personDTO.lastName,
      avatar: personDTO.avatar,
    );
  }
}
