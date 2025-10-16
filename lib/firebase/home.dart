import 'package:basic_flutter/firebase/drawer.dart';
import 'package:flutter/material.dart';
import '../api/User.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore CRUD Example')),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: service.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final users = snapshot.data!;
          return ListView(
            children: users.map((user) {
              return ListTile(
                title: Text(user['name']),
                subtitle: Text('Age: ${user['age']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => service.deleteUser(user['id']),
                ),
                onTap: () => service.updateUser(
                    user['id'], '${user['name']}!', user['age'] + 1),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => service.addUser('User ${DateTime.now().second}', 20),
        child: const Icon(Icons.add),
      ),
    );
  }
}
