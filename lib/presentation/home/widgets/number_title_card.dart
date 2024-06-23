import 'package:flutter/material.dart';
import 'package:flutter_netflix/presentation/widgets/main_title.dart';

import '../../../core/constants.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.posterList,
  });

  final List<String> posterList;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 TV Shows in India Today"),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) => NumberCard(
                index: index,
                imageUrl: posterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
