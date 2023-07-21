import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/constants.dart';
import '../../../widgets/common/text_field/common_text_field_search.dart';
import '../bloc/home_bloc.dart';
import 'widgets/good_box.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.screenPaddingH),
          child: Column(
            children: [
              // search
              CommonTextFieldSearch(
                selValue: '',
                onChanged: (value, needUpdate) {
                },
                onSearch: () {
                },
              ),
              const SizedBox(height: Constants.widgetSpaceV,),
              // good list
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: state.goods.map((entry) {
                      return GoodBox(
                        good: entry,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

  }

}