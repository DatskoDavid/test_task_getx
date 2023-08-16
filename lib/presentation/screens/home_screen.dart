import 'package:flutter/material.dart';
import 'package:tesk_task_getx/data/remote_datasource.dart';
import 'package:tesk_task_getx/presentation/screens/person_details_screen.dart';
import 'package:tesk_task_getx/presentation/widgets/person_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: RemoteDatsource.getData(),
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

          final personData = snapshot.data!.data;

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
                        id: personData[index].id.toInt(),
                        avatar: personData[index].avatar,
                        name:
                            '${personData[index].firstName} ${personData[index].lastName}',
                        email: personData[index].email,
                      ),
                    ),
                  );
                },
                avatar: personData[index].avatar,
                name:
                    '${personData[index].firstName} ${personData[index].lastName}',
                email: personData[index].email,
              );
            },
          );
        },
      ),
    );
  }
}
