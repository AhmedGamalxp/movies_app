import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/dummy1.dart';
import 'package:movies_app/features/home/presentation/views/widgets/appBar_background.dart';
import 'package:movies_app/features/home/presentation/views/widgets/gridview_item.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_detailes.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailesView extends StatelessWidget {
  const MovieDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: AppBarBackGround(),
            ),
          ),
          const SliverToBoxAdapter(
            child: MoviesDetailes(),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
