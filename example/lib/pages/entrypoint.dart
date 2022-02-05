import 'package:flutter/material.dart';
import 'package:flutter_native_mirror_example/utils/helpers.dart';

class EntrypointProtobuf extends StatefulWidget {
  const EntrypointProtobuf({Key? key}) : super(key: key);

  @override
  State<EntrypointProtobuf> createState() => _EntrypointProtobufState();
}

class _EntrypointProtobufState extends State<EntrypointProtobuf> {
  late NativeChannelsCommunication native;

  @override
  void initState() {
    native = NativeChannelsCommunication();
    native.nativeInstanceId = null;
    native.lastInstances = <String, bool>{};
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    native.disposePlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.map),
            title: Text(
              '${native.platformVersion}\n',
              textAlign: TextAlign.left,
            ),
          ),
          for (var entry in native.lastInstances.entries)
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: Text('${entry.key}::${entry.value}'),
            ),
        ],
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () async {
            await native.initPlatformState();
            await native.testAvailableMethods();
            setState(() {});
          },
          child: Text('Init ${native.nativeInstanceId}'),
        ),
        TextButton(
          onPressed: () {
            native.disposePlatformState();
            setState(() {});
          },
          child: Text('Dispose ${native.nativeInstanceId}'),
        )
      ],
    );
  }
}
