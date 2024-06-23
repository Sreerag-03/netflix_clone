import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix/application/search/search_bloc.dart';
import 'package:flutter_netflix/core/constants.dart';
import 'package:flutter_netflix/presentation/search/widgets/title.dart';

class ScreenResultWidget extends StatelessWidget {
  const ScreenResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV Shows'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.5,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCardSearch(
                    imageUrl: movie.posterImageUrl,
                  );
                }),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCardSearch extends StatelessWidget {
  final String imageUrl;
  const MainCardSearch({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
