import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/customer_data_page/customer_data_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class AppBarIcon {
  static Widget backButton(VoidCallback onPressed) {
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

  static Widget telephoneButton(VoidCallback onPressed) {
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

  static Widget menuButtpon() {
    return Container(
      height: 28.w,
      width: 28.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
      child: Center(
          child: BalancePopupMenu(textName: [
        LocaleKeys.customer_date.tr(),
        LocaleKeys.client_balance.tr(),
        LocaleKeys.equipment.tr(),
        LocaleKeys.act_of_reconciliation.tr(),
        LocaleKeys.act_reconciliations_on_orders.tr(),
        LocaleKeys.rest_of_container.tr(),
      ], icons: [
        InkWell(
          onTap: () {
            Modular.to.pushNamed(CustomerDataPage.routeName);
          },
          child: Assets.images.icons.infoCircle
              .svg(fit: BoxFit.cover, color: ColorName.button),
        ),
        InkWell(
          onTap: () {},
          child: Assets.images.icons.wallet
              .svg(fit: BoxFit.cover, color: ColorName.gray2),
        ),
        InkWell(
          onTap: () {},
          child: Assets.images.icons.freedge
              .svg(fit: BoxFit.cover, color: ColorName.gray2),
        ),
        InkWell(
          onTap: () {},
          child: Assets.images.icons.piceChart
              .svg(fit: BoxFit.cover, color: ColorName.gray2),
        ),
        InkWell(
          onTap: () {},
          child: Assets.images.icons.piceChartAlt
              .svg(fit: BoxFit.cover, color: ColorName.gray2),
        ),
        InkWell(
          onTap: () {},
          child: Assets.images.icons.invoise
              .svg(fit: BoxFit.cover, color: ColorName.gray2),
        ),
      ])),
    );
  }

  static Widget editeButton(VoidCallback onPressed) {
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

  static Widget searchButton(VoidCallback onPressed) {
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

  static Widget filterButton(VoidCallback onPressed) {
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
