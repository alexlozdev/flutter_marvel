import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../const/constants.dart';
import '../../../model/category.dart';
import '../../../widgets/common/app_bar/common_app_bar.dart';
import '../../../widgets/common/scaffold/common_scaffold.dart';
import '../../../widgets/common/text_field/common_text_field_search.dart';
import 'widgets/home_drawer.dart';
import '../bloc/home_bloc.dart';
import 'widgets/good_box.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    // screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (homeContext, homeState) {

        final goods = homeState.marvelData.getGoods();

        return CommonScaffold(
          appBar: CommonAppBar(
            title: homeState.category.label.isNotEmpty ? homeState.category.label : 'Welcome',
            onLeadingPressed: () {
            },
          ),
          loading: homeState.loading,
          drawer: HomeDrawer(
            selItem: homeState.category,
            items: Category.all,
            onChanged: (value) {
              homeContext.read<HomeBloc>().add(HomeCategoryChanged(value));
            },
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: Constants.screenPaddingV),
            child: Padding(
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
                    child: MasonryGridView.count(
                      physics: const ScrollPhysics(),
                      itemCount: goods.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (ctx, i) {

                        return GoodBox(
                          good: goods[i],
                          onPressed: () {

                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }



}