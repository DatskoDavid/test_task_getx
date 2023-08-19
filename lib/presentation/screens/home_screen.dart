import 'package:flutter/material.dart';
import 'package:tesk_task_getx/data/datasources/remote_datasource.dart';
import 'package:tesk_task_getx/presentation/screens/person_details_screen.dart';
import 'package:tesk_task_getx/presentation/widgets/person_card.dart';

import '../../data/dto_models/person_dto.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  late final List<PersonDTO> persons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: RemoteDatsource().getData(2),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          persons = snapshot.data!.data;

          return ListView.separated(
            itemCount: 6,
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                child: Divider(),
              );
            },
            itemBuilder: (context, index) {
              return PersonCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonDetailsScreen(
                        id: persons[index].id.toInt(),
                        avatar: persons[index].avatar,
                        name:
                            '${persons[index].firstName} ${persons[index].lastName}',
                        email: persons[index].email,
                      ),
                    ),
                  );
                },
                avatar: persons[index].avatar,
                name:
                    '${persons[index].firstName} ${persons[index].lastName}',
                email: persons[index].email,
              );
            },
          );
        },
      ),
    );
  }
}
