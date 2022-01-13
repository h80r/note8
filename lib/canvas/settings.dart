import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:note8/provider/settings.dart';

import 'components/link_text.dart';

class SettingsCanvas extends ConsumerWidget {
  const SettingsCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(SettingsNotifier.provider);
    final notifier = ref.watch(SettingsNotifier.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.dark_mode),
            value: state,
            onChanged: notifier.setDark,
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
              LinkText(child: Text('h80r'), url: 'https://github.com/h80r/'),
              LinkText(
                child: Text('thaisclxt'),
                url: 'https://github.com/thaisclxt',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
