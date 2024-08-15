import 'package:crud_note/modals/setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingProviderNotifier extends StateNotifier<Setting> {
  SettingProviderNotifier() : super(Setting());

  ///Call when app first screen intialized
  void loadSetting() async {
    state = await Setting.initialize();
  }

  void modifySetting(Setting setting) {
    setting.save();
    state = setting;
  }
}

final settingProvider = StateNotifierProvider<SettingProviderNotifier, Setting>(
    (ref) => SettingProviderNotifier());
