import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String email;

  const PersonCard({
    Key? key,
    required this.avatar,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            foregroundImage: NetworkImage(
              avatar,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              const SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
