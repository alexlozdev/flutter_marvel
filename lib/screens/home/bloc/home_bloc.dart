import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel/model/marvel_data.dart';

import '../../../model/category.dart';
import '../../../repo/character_rest.dart';
import '../../../repo/comic_rest.dart';
import '../../../repo/series_rest.dart';
import '../model/portfolio.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(
    HomeState.initial(
      portfolios: _initPortfolios(),
    )
  ) {
    /// change category
    on<HomeCategoryChanged>((event, emit) async {
      final categoryLabel = event.category.label;
      // get goods according to the category.
      emit(state.copyWith(loading: true));
      return _selectCategory(categoryLabel).then((value) {

        MarvelData marvelData = value ?? MarvelData.fromJson({});
        final goods = marvelData.getGoods();

        emit(state.copyWith(
          loading: false,
          category: state.category.copyWith(label: event.category.label),
          marvelData: state.marvelData.copyWith(
            offset: marvelData.offset,
            limit: marvelData.limit,
            total: marvelData.total,
            count: marvelData.count,
            results: marvelData.results,
          ),
        ));

      });

    });
  }

  /// select good category
  static Future<MarvelData?> _selectCategory(String category) {

    if (category == Category.characters) {
      return CharacterRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.movies) {
      return SeriesRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.comics) {
      return ComicRest.getAll().then((value) {
        return value;
      });
    } else {
      return Future.value(null);
    }
  }

  /// init portfolios
  static _initPortfolios() {
    return [
      const Portfolio(image: 'assets/images/portfolio1.jpg', comment1: 'RUN WITH US!', comment2: 'LIFE IN THE FAST LANE'),
      const Portfolio(image: 'assets/images/portfolio2.jpg', comment1: 'REFRESH YOUR FITNESS', comment2: 'LOOK GREAT'),
      const Portfolio(image: 'assets/images/portfolio3.jpg', comment1: 'NO PAIN, NO GAIN', comment2: 'LOOK MORE FIT'),
      const Portfolio(image: 'assets/images/portfolio4.jpg', comment1: 'STAY HAPPY, STAY FIT', comment2: 'FITNESS FOR EVERYONE'),
    ];
  }
}