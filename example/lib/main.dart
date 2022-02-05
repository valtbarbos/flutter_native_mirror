import 'package:flutter/material.dart';

import 'pages/entrypoint.dart';
import 'pages/method_channel_callbacks.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tests'),
          ),
          body: const TabBarView(
            children: [
              EntrypointProtobuf(),
              MethodChannelCallbacks(),
            ],
          ),
        ),
      ),
    );
  }
}
