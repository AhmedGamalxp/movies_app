part of 'popular_cubit.dart';

@immutable
sealed class PopularCubitState {}

final class PopularCubitInitial extends PopularCubitState {}

final class PopularCubitLoading extends PopularCubitState {}

final class PopularCubSuccess extends PopularCubitState {
  final List<NowPlayingModel> moviesList;

  PopularCubSuccess({required this.moviesList});
}

final class PopularCubitFailure extends PopularCubitState {
  final String errMassage;

  PopularCubitFailure({required this.errMassage});
}
