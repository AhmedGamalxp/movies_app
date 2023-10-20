import 'package:flutter/material.dart';
import 'package:movies_app/core/dummy1.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_list_image.dart';

class TopRatedMoviesListView extends StatelessWidget {
  const TopRatedMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, indext) {
            return const MovieListImage();
          },
          separatorBuilder: (context, indext) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: moviesList.length),
    );
  }
}
