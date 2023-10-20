import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/dummy1.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/features/home/presentation/manager/movie_detailes_cubit/movie_detailes_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/recommendations_cubit/recommendatins_cubit.dart';

import 'package:movies_app/features/home/presentation/views/widgets/appBar_background.dart';
import 'package:movies_app/features/home/presentation/views/widgets/gridview_item.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_detailes.dart';
import 'package:movies_app/features/home/presentation/views/widgets/recommendation_gridview.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailesCubit, MovieDetailesState>(
        builder: (context, state) {
          if (state is MovieDetailesSuccess) {
            return SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: AppBarBackGround(
                          url: state.movie.backdropPath!,
                        ),
                      ),
                    ),
                    MoviesDetailes(
                      movie: state.movie,
                    ),
                    FadeInUp(
                      from: 20,
                      child: Text(
                        'More like this'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const RecommendationGridview(),
                  ],
                ),
              ),
            );
          } else if (state is MovieDetailesFailure) {
            return CustomErrorWidget(errMassage: state.errMassage);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
