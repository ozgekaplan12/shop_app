import 'package:flutter/material.dart';

/// Account settings. Written accessibly; the scanner should report nothing here.
class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.email, required this.statusMessage});

  final String email;
  final String statusMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Image.asset(
                'assets/avatar.png',
                width: 96,
                height: 96,
                semanticLabel: 'Profile photo of the signed-in user',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              email,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),

            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.notifications_off),
              title: const Text('Mute notifications'),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Open notification settings',
                onPressed: _openNotificationSettings,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Change password'),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Open password settings',
                onPressed: _openPasswordSettings,
              ),
            ),

            const SizedBox(height: 24),
            Semantics(
              label: 'Sign out of your account',
              button: true,
              child: GestureDetector(
                onTap: _signOut,
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  color: Colors.red.shade700,
                  child: const Text(
                    'Sign out',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Semantics(
              liveRegion: true,
              child: Text(
                statusMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openNotificationSettings() {}
  void _openPasswordSettings() {}
  void _signOut() {}
}
