import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsNotifier extends StateNotifier<bool> {
  SettingsNotifier() : super(false);

  static final provider = StateNotifierProvider<SettingsNotifier, bool>((ref) {
    return SettingsNotifier();
  });

  static final notifier = provider.notifier;

  void setDark(bool isDark) => state = isDark;
}
