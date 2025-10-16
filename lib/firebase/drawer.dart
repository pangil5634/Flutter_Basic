import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // MyAppState import

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    final user = appState.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Welcome!'),
            accountEmail: Text(user?.email ?? '로그인되지 않음'),
            currentAccountPicture:
                user?.photoURL != null && user!.photoURL!.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL!),
                      )
                    : const CircleAvatar(
                        child: Icon(Icons.person, size: 40),
                      ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Provider.of<MyAppState>(context, listen: false)
                  .clearUser(); // 🔹 상태 초기화
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
