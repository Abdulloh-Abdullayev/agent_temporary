import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:agent/ui/pages/remain_page/pages/remains_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';


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
                    top: MediaQuery.of(context).size.height * 0.48,
                    bottom: MediaQuery.of(context).size.width * 0.48,
                  ),
                  child: ExchangeTools(
                    height: 200.h,
                    onTap: (p0) {
                      if (p0 == 7) {
                        Modular.to.pushNamed(RemainsItemPage.routeName);
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
            Icon(Icons.add),
            // Assets.images.icons.box1.svg(),
          ],
          textName: [
            LocaleKeys.plans.tr(),
            LocaleKeys.history.tr(),
            LocaleKeys.photo_report.tr(),
            LocaleKeys.refusal.tr(),
            LocaleKeys.return_from_shelf.tr(),
            LocaleKeys.return_package.tr(),
            LocaleKeys.exchange.tr(),
            LocaleKeys.remains.tr(),
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
