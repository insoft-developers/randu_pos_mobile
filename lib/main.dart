import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:oktoast/oktoast.dart';
import 'presentation/providers/cores/notification/notification_service.dart';
import 'presentation/widgets/core/text/custom_text_style.dart';

import 'core/const/colors.dart';
import 'core/misc/init.dart';
import 'firebase_options.dart';
import 'presentation/providers/cores/router/go_router_provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('id_ID', null);
  await hiveInitialization();
  await NotificationService().initialize();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: CustomColors.primaryColor,
    statusBarIconBrightness: Brightness.light, // Set the status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.light, // Set the navigation bar icon color
  ));
  runApp(const ProviderScope(child: OKToast(child: RanduApp())));
}

class RanduApp extends ConsumerWidget {
  const RanduApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Randu - Kasir & POS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        scaffoldBackgroundColor: CustomColors.lightBackgroundBodyBackground,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: CustomColors.primaryColor,
          titleTextStyle: CustomTextStyle.h6,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
