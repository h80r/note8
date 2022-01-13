import 'package:flutter/material.dart';

class SettingsCanvas extends StatelessWidget {
  const SettingsCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.dark_mode),
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text('Create Backup'),
            onTap: () {},
          ),
          AboutListTile(
            icon: const Icon(Icons.info),
            applicationIcon: SizedBox(
              width: 50,
              child: Image.asset('assets/launcher/icon.png'),
            ),
            applicationVersion: '0.2.1',
            aboutBoxChildren: const [
              Text('Created by:'),
              Text('h80r'),
              Text('thaisclxt'),
            ],
          ),
        ],
      ),
    );
  }
}
