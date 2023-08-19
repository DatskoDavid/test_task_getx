import 'package:tesk_task_getx/data/datasources/local_datasource.dart';
import 'package:tesk_task_getx/data/datasources/remote_datasource.dart';
import 'package:tesk_task_getx/platform/network_info.dart';

import '../../data/dto_models/person_dto.dart';

class PersonRepository {
  final RemoteDatsource remoteDatsource;
  final LocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  PersonRepository({
    required this.remoteDatsource,
    required this.localDatasource,
    required this.networkInfo,
  });

  Future<List<PersonDTO>> getAllPersons() async {
    if (await networkInfo.isConnected) {
      final remotePersons = await remoteDatsource.getData(2);
      localDatasource.personsToCache(remotePersons.data);
      return remotePersons.data;
    } else {
      final localPersons = await localDatasource.getPersonsFromCache();
      return localPersons;
    }
  }
}
