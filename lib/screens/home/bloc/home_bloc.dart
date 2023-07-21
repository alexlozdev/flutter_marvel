import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel/model/marvel_data.dart';

import '../../../model/category.dart';
import '../../../repo/character_rest.dart';
import '../../../repo/comic_rest.dart';
import '../../../repo/creator_rest.dart';
import '../../../repo/event_rest.dart';
import '../../../repo/series_rest.dart';
import '../../../repo/story_rest.dart';
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
      emit(
          state.copyWith(
            loading: true,
            category: state.category.copyWith(label: event.category.label),
          )
      );
      return _selectCategory(categoryLabel).then((value) {

        MarvelData marvelData = value ?? MarvelData.fromJson({});
        final goods = marvelData.getGoods();

        emit(
            state.copyWith(
              loading: false,
              marvelData: state.marvelData.copyWith(
                offset: marvelData.offset,
                limit: marvelData.limit,
                total: marvelData.total,
                count: marvelData.count,
                results: marvelData.results,
              ),
            )
        );

      });

    });
  }

  /// select good category
  static Future<MarvelData?> _selectCategory(String category) {

    if (category == Category.characters) {
      return CharacterRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.series) {
      return SeriesRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.comics) {
      return ComicRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.creators) {
      return CreatorRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.events) {
      return EventRest.getAll().then((value) {
        return value;
      });
    } else if (category == Category.stories) {
      return StoryRest.getAll().then((value) {
        return value;
      });
    } else {
      return Future.value(null);
    }
  }

  /// init portfolios
  static _initPortfolios() {
    return [];
  }
}