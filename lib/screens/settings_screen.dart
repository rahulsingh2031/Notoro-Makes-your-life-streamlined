import 'package:crud_note/modals/setting.dart';
import 'package:crud_note/providers/notes_provider.dart';
import 'package:crud_note/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_list_tile.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  void showSnackbar(String message) {
    final messanger = ScaffoldMessenger.of(context);
    messanger.clearSnackBars();
    messanger.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final setting = ref.watch(settingProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: const Text("Settings"),
      ),
      body: Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                  title: Text(
                    "Dark Theme",
                    style: GoogleFonts.roboto().copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  value: setting.useDarkTheme,
                  onChanged: (value) async {
                    ref
                        .read(settingProvider.notifier)
                        .modifySetting(Setting(useDarkTheme: value));
                  }),
              ButtonListTile(
                title: "Clear Favorites",
                buttonTitle: "Clear",
                onTap: () {
                  ref.read(notesProvider.notifier).removeAllFavorite();
                  showSnackbar("Cleared all favorites");
                },
              ),
              ButtonListTile(
                title: "Clear All Tasks",
                buttonTitle: "Clear",
                onTap: () {
                  ref.read(notesProvider.notifier).removeAllNote();
                  showSnackbar("Cleared all Tasks");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
