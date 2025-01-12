import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix/application/Home/home_bloc.dart';
import 'package:flutter_netflix/core/constants.dart';
import 'package:flutter_netflix/presentation/home/widgets/background_card.dart';
import 'package:flutter_netflix/presentation/home/widgets/number_title_card.dart';
import '../widgets/main_title_card.dart';
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
 
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while getting data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    //released past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    //trending now
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    //tense dramas
                    final _tenseDramas = state.tenseDramasMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    //south indian Movies
                    final _southIndianMovies =
                        state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();

                    //Top 10 tv show
                    final _top10TvShow = state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    _top10TvShow.shuffle();

                    print(_top10TvShow.length);

                    //Listview
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          title: "Released in the Past Year",
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),
                        kHeight20,
                        MainTitleCard(
                          title: "Trending Now",
                          posterList: _trending.sublist(0, 10),
                        ),
                        kHeight20,
                        NumberTitleCard(
                          posterList: _top10TvShow.sublist(0, 10),
                        ),
                        kHeight20,
                        MainTitleCard(
                          title: "Tense Dramas",
                          posterList: _tenseDramas.sublist(0, 10),
                        ),
                        kHeight20,
                        MainTitleCard(
                          title: "South Indian Cinema",
                          posterList: _southIndianMovies.sublist(0, 10),
                        ),
                        kHeight20,
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://static.vecteezy.com/system/resources/previews/019/956/198/original/netflix-transparent-netflix-free-free-png.png",
                                  width: 70,
                                  height: 70,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                const Icon(Icons.account_circle,
                                color: Colors.blue,
                                size: 30,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
