import 'package:agent/ui/pages/remains_page/cubit/remains_cubit.dart';
import 'package:agent/ui/pages/remains_page/widgets/item_remains_widget.dart';
import 'package:agent/ui/pages/remains_page/widgets/remains_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class RemainsItemPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RemainCubit>(
          (i) => RemainCubit()..load(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RemainsItemPage.routeName,
          child: (context, args) => const RemainsItemPage(),
        )
      ];
}

class RemainsItemPage extends StatelessWidget {
  static const String routeName = '/remains-item-page';

  const RemainsItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFDFDFDF),
      body: SafeArea(
        child: BlocBuilder<RemainCubit, RemainState>(
          bloc: RemainCubit.to,
          builder: (context, state) {
            return Column(
              children: [
               RemainsPageWidgets.remainsAppBar().paddingOnly(bottom: 18.w),
                 buildList(state)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildList(RemainState state) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:20.w),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => RemainsItemWidget(

                    model: state.list[index],
                    index: index,
                  ).paddingOnly(top: 12.w),
                ),
              ),
            ),
               RemainsPageWidgets.buildAppButton(),
          ],
        ),
      ),
    );
  }

  

  
}
