import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsNotifier extends StateNotifier<bool> {
  SettingsNotifier(this._settings)
      : super(_settings.get('isDark', defaultValue: false)!);

  static final provider = StateNotifierProvider<SettingsNotifier, bool>((ref) {
    return SettingsNotifier(Hive.box<bool>('settings'));
  });

  static final notifier = provider.notifier;

  final Box<bool> _settings;

  void setDark(bool isDark) async {
    await _settings.put('isDark', isDark);
    state = isDark;
  }
}
