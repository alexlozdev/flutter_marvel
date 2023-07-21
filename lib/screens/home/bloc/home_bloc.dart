import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/category.dart';
import '../../../model/good.dart';
import '../model/portfolio.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(
    HomeState.initial(
      goods: _selectCategory(Category.news),
      portfolios: _initPortfolios(),
    )
  ) {
    /// change category
    on<HomeCategoryChanged>((event, emit) {
      final categoryLabel = event.category.label;
      // get goods according to the category.
      List<Good> goods = _selectCategory(categoryLabel);

      emit(state.copyWith(
        category: state.category.copyWith(label: event.category.label),
        goods: goods,
      ));

    });
  }

  /// select good category
  static List<Good> _selectCategory(String category) {

    if (category == Category.news) {
      return [
        const Good(id: '', name: 'Economy', image: 'assets/images/car1.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Taxicab', image: 'assets/images/car2.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
        const Good(id: '', name: 'Luxury', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      ];
    } else if (category == Category.comics) {
      return [
        const Good(id: '', name: 'Sandwich1', image: 'assets/images/eat1.png', description: 'Select the sandwich size and price that fits your comfort level', ),
        const Good(id: '', name: 'Sandwich2', image: 'assets/images/eat2.png', description: 'Select the sandwich size and price that fits your comfort level', ),
        const Good(id: '', name: 'Sandwich3', image: 'assets/images/eat3.png', description: 'Select the sandwich size and price that fits your comfort level', ),
      ];
    } else {
      return [];
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