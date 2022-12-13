import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/equipment_page/widgets/equipment_widgets.dart';
import 'package:agent/ui/pages/equipment_page/pages/equipments_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EquipmentItems extends StatefulWidget {
  static const String routeName = "/equepment-items-page";

  const EquipmentItems({super.key});
  @override
  State<EquipmentItems> createState() => _EquipmentItemsState();
}

class _EquipmentItemsState extends State<EquipmentItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.bgColor,
        body: Column(
          children: [
            EquipmentWidgets.appBar(
              title: LocaleKeys.equipment.tr(),
              context: context,
              ontap: () {
                Navigator.pop(context);
              },
            ),
            equipmentItems(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorName.green2,
          child: Assets.images.icons.plus.svg(),
        ).marginOnly(
          bottom: 103.h,
        ),
      ),
    );
  }

  Widget equipmentItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EquipmentDetails(),
                ),
              );
            },
            child: EquipmentWidgets.items(),
          );
        },
      ),
    );
  }
}
