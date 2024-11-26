import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceConnectionScreen extends StatefulWidget {
  @override
  _DeviceConnectionScreenState createState() => _DeviceConnectionScreenState();
}

class _DeviceConnectionScreenState extends State<DeviceConnectionScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;
  bool isConnected = false;

  Future<void> connectToDevice() async {
    try {
      // Check already connected devices
      List<BluetoothDevice> devices = await flutterBlue.connectedDevices;
      if (devices.isNotEmpty) {
        setState(() {
          connectedDevice = devices.first;
          isConnected = true;
        });
        return;
      }

      // If no device is connected, start scanning
      flutterBlue.startScan(timeout: Duration(seconds: 4));
      flutterBlue.scanResults.listen((results) async {
        for (ScanResult result in results) {
          if (result.device.name == "Smart Yoga Mat") {
            flutterBlue.stopScan(); // Stop scanning once the desired device is found
            await result.device.connect();
            setState(() {
              connectedDevice = result.device;
              isConnected = true;
            });
            return;
          }
        }
      });

      flutterBlue.stopScan(); // Ensure scanning stops after timeout or success
    } catch (e) {
      debugPrint('Error during Bluetooth connection: $e');
      setState(() {
        isConnected = false;
        connectedDevice = null;
      });
      // Optionally show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to device: $e')),
      );
    }
  }

  void disconnectFromDevice() {
    connectedDevice?.disconnect();
    setState(() {
      isConnected = false;
      connectedDevice = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Connection'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isConnected
                  ? 'Connected to ${connectedDevice?.name}'
                  : 'Not Connected',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isConnected ? disconnectFromDevice : connectToDevice,
              child: Text(isConnected ? 'Disconnect' : 'Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
