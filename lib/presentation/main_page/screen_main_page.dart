import 'package:flutter/material.dart';
import 'package:flutter_netflix/presentation/downloads/screen_downloads.dart';
import 'package:flutter_netflix/presentation/home/screen_home.dart';
import 'package:flutter_netflix/presentation/main_page/widgets/screen_bottom_nav.dart';
import 'package:flutter_netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:flutter_netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
