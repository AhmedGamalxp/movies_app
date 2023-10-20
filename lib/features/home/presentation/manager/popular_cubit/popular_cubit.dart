import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/now.playing.model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'popular_state.dart';

class PopularCubitCubit extends Cubit<PopularCubitState> {
  PopularCubitCubit(this.homeRepo) : super(PopularCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularMovies() async {
    emit(PopularCubitLoading());
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failure) {
      emit(PopularCubitFailure(errMassage: failure.errMessage));
    }, (movies) {
      emit(PopularCubSuccess(moviesList: movies));
    });
  }
}
