import 'package:crud_note/providers/setting_provider.dart';
import 'package:crud_note/utils/navigator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_elevated_button.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(settingProvider.notifier).loadSetting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Icon(
                Icons.note_add,
                size: 80,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Notoro",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto().copyWith(
                    color: Theme.of(context).colorScheme.surfaceBright,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Make your life streamlined",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed().copyWith(
                    color: Theme.of(context).colorScheme.surfaceBright,
                    fontSize: 12),
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              CustomElevatedButton(
                text: "Show Tasks",
                onPressed: () =>
                    NavigatorUtil.navigateTo(Screen.noteScreen, context),
              ),
              CustomElevatedButton(
                text: "Favorites",
                onPressed: () =>
                    NavigatorUtil.navigateTo(Screen.favoriteScreen, context),
              ),
              CustomElevatedButton(
                text: "Settings",
                onPressed: () =>
                    NavigatorUtil.navigateTo(Screen.settingScreen, context),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "🐱Created by Rahul Neko😼",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoCondensed().copyWith(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
