import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/customer_data_page/customer_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class AppBarIconAddOrder {
  static Widget backAddOrderButtonShelf(VoidCallback onPressed) {
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

  static Widget telephoneAddOrderButtonShelf(VoidCallback onPressed) {
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

  static Widget menuAddOrderButtonShelf() {
    return Container(
      alignment: Alignment.center,
      height: 28.w,
      width: 28.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
      child: BalancePopupMenu(
        textName: const [
          "Данные клиента",
          "Баланс клиента",
          "Оборудование",
          "Акт - сверки",
          "Акт - сверки по заказам",
          'Остаток тары',
        ],
        icons: [
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
        ],
      ),
    );
  }

  static Widget editeAddOrderButtonShelf(VoidCallback onPressed) {
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

  static Widget searchAddOrderButtonShelf(VoidCallback onPressed) {
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

  static Widget filterAddOrderButtonShelf(VoidCallback onPressed) {
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
