import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _methodChannel = MethodChannel("training.horizons.com/deviceinfo");
  String _deviceInfo = '';

  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      deviceInfo = "Failed to get device info: '${e.message}'";
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListTile(
          title: const Text("Device info:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          subtitle: Text(_deviceInfo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
