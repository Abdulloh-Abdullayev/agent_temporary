import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/utils/colors.gen.dart';

class EditShelfButtonSheet extends StatelessWidget {
  const EditShelfButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          )),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                autofocus: false,
                child: Container(
                  padding: EdgeInsets.only(top: 26.w),
                  child: Assets.images.icons.downIcon.svg(
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Modular.to.pop(context);
                },
              ),
              AddingAnOrderSheet(
                text: LocaleKeys.editing.tr(),
                listTextName: [
                  LocaleKeys.stock.tr(),
                  LocaleKeys.direction_type.tr(),
                  LocaleKeys.price_type.tr(),
                ],
                seeListTextName: [
                  LocaleKeys.main_warehouse.tr(),
                  LocaleKeys.direction.tr(),
                  LocaleKeys.spot.tr(),
                ],
                icons: [
                  Assets.images.icons.stack.svg(
                    fit: BoxFit.cover,
                  ),
                  Assets.images.icons.shoppingCardIcon.svg(
                    fit: BoxFit.cover,
                  ),
                  Assets.images.icons.cash.svg(
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          ),
          InkWell(
            autofocus: false,
            child: Container(
              padding: EdgeInsets.only(top: 20.w, right: 29.w),
              child: Assets.images.icons.remove.svg(
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Modular.to.pop(context);
            },
          )
        ],
      ),
    );
  }
}
