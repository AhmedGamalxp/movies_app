import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/dummy1.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_list_image.dart';

class PopularMoviesListView extends StatelessWidget {
  const PopularMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, indext) {
            return MovieListImage(
              ontap: () {
                context.push(AppRouter.kMovieDetailesView);
              },
            );
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
