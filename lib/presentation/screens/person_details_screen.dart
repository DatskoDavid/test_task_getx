import 'package:flutter/material.dart';

class PersonDetailsScreen extends StatelessWidget {
  final int id;
  final String avatar;
  final String name;
  final String email;

  const PersonDetailsScreen({
    Key? key,
    required this.id,
    required this.avatar,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Person Details'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(avatar),
              ),
              const SizedBox(height: 30),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'ID:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 53),
                        Text(
                          id.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Email:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
