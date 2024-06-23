import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix/application/search/search_bloc.dart';
import 'package:flutter_netflix/core/constants.dart';
import 'package:flutter_netflix/domain/core/debounce/debounce.dart';
import 'package:flutter_netflix/presentation/search/widgets/search_idle.dart';
import 'package:flutter_netflix/presentation/search/widgets/search_result.dart';

import '../../core/colors/colors.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: kButtonColorGrey,
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: kTextColorGrey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: kTextColorGrey,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              _debouncer.run(() {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));
              });
            },
          ),
          kHeight,

          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const ScreenIdleWidget();
              } else {
                return const ScreenResultWidget();
              }
            },
          )),
          //Expanded(child: const ScreenResultWidget()),
        ],
      ),
    ));
  }
}
