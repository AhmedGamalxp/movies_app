import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/dummy1.dart';

class MovieListImage extends StatelessWidget {
  const MovieListImage({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 120,
            child: AspectRatio(
              aspectRatio: 2.8 / 4,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl(moviesList[0].backdropPath!),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
