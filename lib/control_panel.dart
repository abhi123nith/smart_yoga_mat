import 'package:flutter/material.dart';

class ControlPanelScreen extends StatelessWidget {
  const ControlPanelScreen({super.key});

  void startWarmUp() {
    debugPrint("Warm-Up Mode Started");
  }

  void beginRelaxation() {
    debugPrint("Relaxation Mode Started");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Panel'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startWarmUp,
              child: const Text('Start Warm-Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: beginRelaxation,
              child: const Text('Begin Relaxation Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
