import 'package:flutter/material.dart';

class OTAUpdateScreen extends StatelessWidget {
  final String currentVersion = '1.0.0';
  final String newVersion = '1.1.0';

  const OTAUpdateScreen({super.key});

  void checkForUpdate(BuildContext context) {
    final hasUpdate = currentVersion != newVersion;
    final message = hasUpdate
        ? 'New Version $newVersion Available!'
        : 'Your software is up to date.';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('OTA Update'),
        content: Text(message),
        actions: [
          if (hasUpdate)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Update Now'),
            ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTA Updates'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => checkForUpdate(context),
          child: const Text('Check for Updates'),
        ),
      ),
    );
  }
}
