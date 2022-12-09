import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/remains_page/pages/remains_edit_page.dart';
import 'package:agent/ui/pages/remains_page/remains_page.dart';
import 'package:agent/ui/pages/return_from_shelf/return_from_shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../history_orders/history_orders_page.dart';

class FloatingShowDialog extends StatelessWidget {
  const FloatingShowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.w,
      width: 42.w,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: ((context) {
                return Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    bottom: MediaQuery.of(context).size.width * 0.4,
                  ),
                  child: ExchangeTools(

                    onTap: (p0) {
                      switch (p0) {
                        case 0:
                          return Modular.to
                              .pushNamed(RemainsEditPage.routeName);
                        case 1:
                          return Modular.to
                              .pushNamed(HistoryOrdersPage.routeName);
                        case 4:
                          return Modular.to
                              .pushNamed(ReturnFromShelf.routeName);
                        case 7:
                          return Modular.to.pushNamed(RemainsPage.routeName);
                      }
                    },
                    icons: [
                      Assets.images.icons.pin.svg(),
                      Assets.images.icons.history.svg(),
                      Assets.images.icons.smartphone.svg(),
                      Assets.images.icons.infoCircle.svg(),
                      Assets.images.icons.refresh.svg(),
                      Assets.images.icons.exchange.svg(),
                      Assets.images.icons.box1.svg(),
                      Assets.images.icons.box1.svg(),
                    ],
                    textName: const [
                      "Планы",
                      'История',
                      'Фото отчёт',
                      'Отказ',
                      'Возврат \nс полки',
                      'Возврат \nтары',
                      'Обмен',
                      'Остатки',
                    ],
                  ),
                );
              }),
            );
          },
          backgroundColor: ColorName.lightGreen,
          child: const Icon(
            Icons.more_vert,
            color: ColorName.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
