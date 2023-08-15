import 'package:flutter/material.dart';
import 'package:tesk_task_getx/data/remote_datasource.dart';
import 'package:tesk_task_getx/presentation/widgets/person_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test task'),
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

          return ListView.separated(
            itemCount: 6,
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                child: Divider(),
              );
            },
            itemBuilder: (context, index) {
              return PersonCard(
                avatar: snapshot.data!.data[index].avatar,
                name:
                    '${snapshot.data!.data[index].firstName} ${snapshot.data!.data[index].lastName}',
                email: snapshot.data!.data[index].email,
              );
            },
          );
        },
      ),
    );
  }
}
