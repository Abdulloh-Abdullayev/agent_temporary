import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/balance_page/bloc/balance_cubit.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class BalancePageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<BalanceCubit>(
          (i) => BalanceCubit()..load(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          BalancePage.routeName,
          child: (context, args) => const BalancePage(),
        )
      ];
}

class BalancePage extends StatelessWidget {
  static const String routeName = '/balancePage';

  const BalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BalanceCubit, BalanceState>(
          bloc: BalanceCubit.to,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                balanceAppBar(state),
                buildList(state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildList(BalanceState state) {
    if (state.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.hasError) {
      return const Center(child: Icon(Icons.error));
    }
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.textLocale(
              localeKey: LocaleKeys.payment_information,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ).paddingOnly(top: 24.w, left: 20.w),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 5.w,
              ),
              itemCount: state.balanceList.length,
              itemBuilder: (context, index) {
                var model = state.balanceList[index];
                return Cards.cards_6(
                  zakaz: "Заказ от",
                  date: model.dateToString,
                  status: model.statusType!,
                  nachisleniya: model.status!,
                  summa: "Сумма",
                  summaNumber: model.priceToString, onTap: () {  },
                ).paddingOnly(top: 12.w);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget balanceAppBar(BalanceState state) {
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
          AppWidgets.backButton(
            () {
              Modular.to.pop();
            },
          ),
          AppWidgets.textLocale(
            localeKey: LocaleKeys.client_balance,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(bottom: 20.w, top: 20.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.total_sum,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.white.withOpacity(0.6),
              ),
              AnimatedDigitWidget(
                value: state.totalPrice,
                separateSymbol: ' ',
                separateLength: 3,
                enableSeparator: true,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
                suffix: " UZS",
              ),
            ],
          )
        ],
      ),
    );
  }
}
