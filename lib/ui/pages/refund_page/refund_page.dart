import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/refund_page/bloc/refund_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

import '../../widgets/app_widgets.dart';
import 'widgets/item_refund_widget.dart';

class RefundPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RefundCubit>(
          (i) => RefundCubit()..load(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RefundPage.routeName,
          child: (context, args) => const RefundPage(),
        )
      ];
}

class RefundPage extends StatelessWidget {
  static const String routeName = '/refundPage';

  const RefundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: SafeArea(
        child: BlocBuilder<RefundCubit, RefundState>(
          bloc: RefundCubit.to,
          builder: (context, state) {
            return Column(
              children: [
                refundAppBar().paddingOnly(bottom: 18.w),
                buildList(state)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildList(RefundState state) {
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
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ItemRefundWidget(
                    model: state.list[index],
                    index: index,
                  ).paddingOnly(top: 12.w),
                ),
              ),
            ),
            bottomActions()
          ],
        ),
      ),
    );
  }

  Widget bottomActions() {
    return Container(
      height: 80.w,
      padding: EdgeInsets.all(20.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: 5,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppWidgets.appButton(
              color: ColorName.gray,
              textColor: ColorName.mainColor,
              title: LocaleKeys.draft,
              onTap: () {},
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: AppWidgets.appButton(
              title: LocaleKeys.refund,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget refundAppBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.backButton(
                () {
                  Modular.to.pop();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppWidgets.iconButton(
                    onPressed: () {},
                    icon: Assets.images.icons.searchActive,
                  ),
                  AppWidgets.iconButton(
                    onPressed: () {},
                    icon: Assets.images.icons.filtrIcon,
                  ).paddingOnly(left: 12.w),
                ],
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: LocaleKeys.refund_tara,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w),
        ],
      ),
    );
  }
}
