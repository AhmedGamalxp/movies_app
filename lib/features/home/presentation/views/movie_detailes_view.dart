import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/features/home/presentation/manager/movie_detailes_cubit/movie_detailes_cubit.dart';

import 'package:movies_app/features/home/presentation/views/widgets/appBar_background.dart';
import 'package:movies_app/features/home/presentation/views/widgets/gridview_item.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_detailes.dart';

class MovieDetailesView extends StatelessWidget {
  const MovieDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailesCubit, MovieDetailesState>(
        builder: (context, state) {
          if (state is MovieDetailesSuccess) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: AppBarBackGround(
                      url: state.movie.backdropPath!,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: MoviesDetailes(
                    movie: state.movie,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
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
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const GridViewItem();
                      },
                      childCount: 30,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.7,
                      crossAxisCount: 3,
                    ),
                  ),
                ),
              ],
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
