import 'package:flutter/material.dart';
import 'package:flutter_netflix/core/colors/colors.dart';
import 'package:flutter_netflix/core/constants.dart';

import '../../home/widgets/custom_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  kHeight20,
                  Text(
                    month,
                    style: const TextStyle(
                      fontSize: 16,
                      color: kTextColorGrey,
                    ),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight20,
              VideoWidget(url: posterPath,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                      //  letterSpacing: -5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CustomButtonWidget(
                    icon: Icons.all_out_sharp,
                    title: "Remind Me",
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kWidth,
                  const CustomButtonWidget(
                    icon: Icons.info,
                    title: "Info",
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kWidth,
                ],
              ),
              kHeight,
              Text(
                'Coming on $day $month',
                style: const TextStyle(
                  color: kTextColorGrey,
                ),
              ),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: kTextColorGrey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if(progress == null){
                return child;
              }else{
                return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace){
              return const Center(child: Icon(Icons.wifi, color: Colors.white,));
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
