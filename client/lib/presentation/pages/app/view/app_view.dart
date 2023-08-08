import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_gprc/core/app_colors.dart';
import 'package:notes_gprc/l10n/l10n.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template app_view}
/// The app view widget which renders material/cupertino app.
/// {@endtemplate}
class AppView extends StatefulWidget {
  /// {@macro app_view}
  /// creates a [AppView] instance.
  /// {@endtemplate}
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'details/:noteId',
            builder: (context, state) => DetailsPage(
              noteId: state.pathParameters['noteId']!,
            ),
          ),
        ],
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformApp.router(
      routerConfig: _router,
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      material: (context, platform) => MaterialAppRouterData(
        theme: ThemeData.from(
          colorScheme: AppColors.light,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.from(
          colorScheme: AppColors.dark,
          useMaterial3: true,
        ),
      ),
      cupertino: (context, platform) {
        final brightness = MediaQuery.of(context).platformBrightness;
        final isDark = brightness == Brightness.dark;
        final colorScheme = isDark ? AppColors.dark : AppColors.light;
        return CupertinoAppRouterData(
          theme: CupertinoThemeData(
            brightness: brightness,
            primaryColor: colorScheme.primary,
            primaryContrastingColor: colorScheme.onPrimary,
            scaffoldBackgroundColor: colorScheme.background,
            barBackgroundColor: colorScheme.surface,
            textTheme: CupertinoTextThemeData(
              primaryColor: colorScheme.primary,
              textStyle: TextStyle(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}
