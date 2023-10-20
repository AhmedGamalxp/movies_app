import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/models/movie_detailes_model/movie/movie.detailes.model.dart';
import 'package:movies_app/features/home/data/models/now.playing.model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NowPlayingModel>>> fetchNowPlaying();
  Future<Either<Failure, List<NowPlayingModel>>> fetchPopularMovies();
  Future<Either<Failure, List<NowPlayingModel>>> fetchTopRatedMovies();
  Future<Either<Failure, MovieDetailesModel>> fetchMovieDetails(int movieId);
}
