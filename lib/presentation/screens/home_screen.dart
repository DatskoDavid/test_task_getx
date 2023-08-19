import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tesk_task_getx/data/datasources/local_datasource.dart';
import 'package:tesk_task_getx/data/datasources/remote_datasource.dart';
import 'package:tesk_task_getx/domain/controllers/home_screen_controller.dart';
import 'package:tesk_task_getx/domain/repositories/person_repository.dart';
import 'package:tesk_task_getx/platform/network_info.dart';
import 'package:tesk_task_getx/presentation/screens/person_details_screen.dart';
import 'package:tesk_task_getx/presentation/widgets/page_button.dart';
import 'package:tesk_task_getx/presentation/widgets/person_card.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(
        () {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: FutureBuilder(
                  future: PersonRepository(
                    remoteDatsource: RemoteDatsource(),
                    localDatasource: LocalDatasource(),
                    networkInfo: NetworkInfo(
                      InternetConnectionChecker(),
                    ),
                  ).getAllPersons(controller.page.value),
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

                    final persons = snapshot.data!;

                    return ListView.separated(
                      itemCount: 6,
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 10),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageButton(
                    page: 1,
                    onTap: () => controller.page.value = 1,
                  ),
                  const SizedBox(width: 15),
                  PageButton(
                    page: 2,
                    onTap: () => controller.page.value = 2,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
