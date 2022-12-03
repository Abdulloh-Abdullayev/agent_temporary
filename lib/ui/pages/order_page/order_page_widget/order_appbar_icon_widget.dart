import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/act_reconciliation_page/act_reconciliation_page.dart';
import 'package:agent/ui/pages/balance_page/balance_page.dart';
import 'package:agent/ui/pages/customer_data_page/customer_data_page.dart';
import 'package:agent/ui/pages/equipment_page/equipment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../act_reconciliation_oder_page/act_reconciliation_oder_page.dart';

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
          child: PopupMenuTools(
              onTap: (v) {
                switch (v) {
                  case 0:
                    return Modular.to.pushNamed(CustomerDataPage.routeName);
                  case 1:
                    return Modular.to.pushNamed(BalancePage.routeName);
                  case 2:
                    return Modular.to.pushNamed(EquipmentPage.routeName);
                  case 3:
                    return Modular.to.pushNamed(ActReconciliationPage.routeName);
                  case 4:
                    return Modular.to.pushNamed(ActReconciliationOderPage.routeName);
                }
              },
              textName: const [
            "Данные клиента",
            "Баланс клиента",
            "Оборудование",
            "Акт - сверки",
            "Акт - сверки по заказам",
            'Остаток тары',
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
