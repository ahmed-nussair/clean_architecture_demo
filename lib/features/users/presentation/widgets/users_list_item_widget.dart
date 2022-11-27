import 'package:flutter/material.dart';

class UsersListItemWidget extends StatelessWidget {
  final int userId;
  final String username;
  final String name;
  final Function(int) onTapped;
  const UsersListItemWidget({
    super.key,
    required this.userId,
    required this.username,
    required this.name,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTapped(userId);
      },
      title: Text(
        username,
        textAlign: TextAlign.center,
      ),
      subtitle: Text(
        name,
        textAlign: TextAlign.center,
      ),
    );
  }
}
