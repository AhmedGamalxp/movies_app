import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/dummy1.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_list_image.dart';

class PopularMoviesListView extends StatelessWidget {
  const PopularMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubitCubit, PopularCubitState>(
      builder: (context, state) {
        if (state is PopularCubSuccess) {
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
                    url: state.moviesList[indext].backdropPath!,
                  );
                },
                separatorBuilder: (context, indext) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: state.moviesList.length),
          );
        } else if (state is PopularCubitFailure) {
          return CustomErrorWidget(errMassage: state.errMassage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
