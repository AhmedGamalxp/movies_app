import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/seeMore_item.dart';

class TopRatedSeeMoreListView extends StatelessWidget {
  const TopRatedSeeMoreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Top Rated Movies',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 90, bottom: 10),
          itemBuilder: (context, indext) {
            return const SeeMoreItem();
          },
          separatorBuilder: (context, indext) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 10),
    );
  }
}
