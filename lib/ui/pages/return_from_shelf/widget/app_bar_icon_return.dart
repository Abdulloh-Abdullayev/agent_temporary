import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/act_reconciliation_oder_page/act_reconciliation_oder_page.dart';
import 'package:agent/ui/pages/act_reconciliation_page/act_reconciliation_page.dart';
import 'package:agent/ui/pages/balance_page/balance_page.dart';
import 'package:agent/ui/pages/customer_data_page/customer_data_page.dart';
import 'package:agent/ui/pages/equipment_page/equipment_page.dart';
import 'package:agent/ui/pages/rest_of_container_page/rest_of_container_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/localization/locale_keys.g.dart';

class AppBarIconReturn {
  static Widget backButtonShelf(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Center(
          child: Assets.images.icons.backButton.svg(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget telephoneButtonShelf(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Center(
          child: Assets.images.icons.telephoneButton.svg(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget menuButtonShelf() {
    return Container(
      alignment: Alignment.center,
      height: 28.w,
      width: 28.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
      child: PopupMenuTools(
          onTap: (index) {
            print(index);
            switch (index) {
              case 0:
                return Modular.to.pushNamed(CustomerDataPage.routeName);
              case 1:
                return Modular.to.pushNamed(BalancePage.routeName);
              case 3:
                return Modular.to.pushNamed(EquipmentPage.routeName);
              case 4:
                return Modular.to.pushNamed(ActReconciliationPage.routeName);
              case 5:
                return Modular.to
                    .pushNamed(ActReconciliationOderPage.routeName);
              case 6:
                return Modular.to.pushNamed(RestContainerPage.routeName);
            }
          },
          textName: [
            LocaleKeys.customer_date.tr(),
            LocaleKeys.client_balance.tr(),
            LocaleKeys.equipment.tr(),
            LocaleKeys.act_of_reconciliation.tr(),
            LocaleKeys.act_reconciliations_on_orders.tr(),
            LocaleKeys.rest_of_container.tr(),
          ],
          icons: [
            Assets.images.icons.infoCircle
                .svg(fit: BoxFit.cover, color: ColorName.gray2),
            Assets.images.icons.wallet
                .svg(fit: BoxFit.cover, color: ColorName.gray2),
            Assets.images.icons.freedge
                .svg(fit: BoxFit.cover, color: ColorName.gray2),
            Assets.images.icons.piceChart
                .svg(fit: BoxFit.cover, color: ColorName.gray2),
            Assets.images.icons.piceChartAlt
                .svg(fit: BoxFit.cover, color: ColorName.gray2),
            Assets.images.icons.invoise
                .svg(fit: BoxFit.cover, color: ColorName.gray2),
          ]),
    );
  }

  static Widget editeButtonShelf(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Center(
          child: Assets.images.icons.edite.svg(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget searchButtonShelf(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Center(
          child: Assets.images.icons.search1.svg(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget filterButtonShelf(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Center(
          child: Assets.images.icons.filter.svg(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
