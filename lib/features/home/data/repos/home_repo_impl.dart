import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'package:movies_app/features/home/data/models/now.playing.model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<NowPlayingModel>>> fetchNowPlaying() async {
    try {
      var data = await apiService.get(endPoint: 'now_playing');
      List<NowPlayingModel> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(NowPlayingModel.fromJson(item));
        } catch (e) {
          movies.add(NowPlayingModel.fromJson(item));
        }
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  // @override
  // Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
  //   try {
  //     var data = await apiService.get(endPoint: 'popular');
  //     List<MovieModel> movies = [];
  //     for (var item in data['items']) {
  //       try {
  //         movies.add(MovieModel.fromJson(item));
  //       } catch (e) {
  //         movies.add(MovieModel.fromJson(item));
  //       }
  //     }

  //     return right(movies);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() async {
  //   try {
  //     var data = await apiService.get(endPoint: 'top_rated');
  //     List<MovieModel> movies = [];
  //     for (var item in data['items']) {
  //       try {
  //         movies.add(MovieModel.fromJson(item));
  //       } catch (e) {
  //         movies.add(MovieModel.fromJson(item));
  //       }
  //     }

  //     return right(movies);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }
}
