import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/constants.dart';
import '../../../model/category.dart';
import '../../../widgets/common/app_bar/common_app_bar.dart';
import '../../../widgets/common/scaffold/common_scaffold.dart';
import '../../home/view/home.dart';
import '../../user/bloc/user_bloc.dart';
import '../bloc/start_bloc.dart';
import '../model/page_item.dart';
import 'start_drawer.dart';

class StartScreen extends StatefulWidget {

  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();

    // screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }

  static const basketLabel = '1';

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<StartBloc, StartState>(
      builder: (startContext, startState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return CommonScaffold(
              appBar: CommonAppBar(
                title: 'Welcome Marvel',
                onLeadingPressed: () {
                },
              ),
              drawer: StartDrawer(
                selPageItem: startState.pageItem,
                pageItems: PageItem.pages,
                onChanged: (value) {
                  startContext.read<StartBloc>().add(StartPageChanged(value));
                },
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(vertical: Constants.screenPaddingV),
                child: getBody(pageItem: startState.pageItem),
              ),
              ad: null,
            );
          },
        );
      },
    );
  }

  Widget getBody({required PageItem pageItem}) {
    if (pageItem.name == Category.news) {
      return const HomeScreen();
    } else {
      return Container();
    }
  }

}