import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix/application/Home/home_bloc.dart';
import 'package:flutter_netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:flutter_netflix/application/search/search_bloc.dart';
import 'package:flutter_netflix/core/colors/colors.dart';
import 'package:flutter_netflix/domain/core/di/injectable.dart';
import 'package:flutter_netflix/presentation/main_page/screen_main_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application/downloads/downloads_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix App',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: backgroundColor,
            fontFamily: GoogleFonts.prompt().fontFamily,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
            )),
        home: ScreenMainPage(),
      ),
    );
  }
}
