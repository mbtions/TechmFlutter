import 'package:flutter/material.dart';
import 'package:networkingdemo/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User name and username
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                user.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('@${user.username}'),
            ),
            const Divider(),
            // Email
            Row(
              children: [
                const Icon(Icons.email, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(child: Text(user.email)),
              ],
            ),
            const SizedBox(height: 8),
            // Phone
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(child: Text(user.phone)),
              ],
            ),
            const SizedBox(height: 8),
            // Website
            Row(
              children: [
                const Icon(Icons.link, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(child: Text(user.website)),
              ],
            ),
            const SizedBox(height: 16),
            // Address
            Text(
              '📍 ${user.address.street}, ${user.address.suite}, ${user.address.city} - ${user.address.zipcode}',
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 16),
            // Company Info
            Text(
              '🏢 ${user.company.name}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              '"${user.company.catchPhrase}"',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
