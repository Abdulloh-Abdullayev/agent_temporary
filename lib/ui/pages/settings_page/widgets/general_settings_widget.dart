import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'settings_content.dart';
import 'settings_switch.dart';
import 'settings_text_item.dart';

class GeneralSettingsWidget extends StatelessWidget {
  const GeneralSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDisable = true;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SettingsContent(
            title: LocaleKeys.main_settings.tr().toUpperCase(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.add_new_outlet,
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.allow_new_customer_consign.tr(),
                initial: false,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.show_customer_balance.tr(),
                initial: false,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.phone_number_prefix.tr(),
                initial: false,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: LocaleKeys.availabe_fields_for_editing.tr(),
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.name.tr(),
                initial: true,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.company_name.tr(),
                initial: true,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.category.tr(),
                initial: true,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.territory.tr(),
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.inn.tr(),
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.phone.tr(),
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.visit_days.tr(),
                initial: false,
                isLast: true,
              ),
            ],
          ),
          SettingsContent(
            title: LocaleKeys.gps.tr(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                isDisable: isDisable,
                title: LocaleKeys.minimum_battery_level.tr(),
                onChanged: (bool value) {},
              ),
              SettingsSwitch(
                isDisable: isDisable,
                title: LocaleKeys.always_on.tr(),
                onChanged: (bool value) {},
              ),
              SettingsSwitch(
                isDisable: isDisable,
                title: LocaleKeys.always_attach_location_adding.tr(),
                onChanged: (bool value) {},
              ),
              SettingsSwitch(
                isDisable: isDisable,
                title: LocaleKeys.track_locations.tr(),
                onChanged: (bool value) {},
              ),
              SettingsTextItem(
                title: LocaleKeys.location_tracking_interval.tr(),
                text: "131",
              ),
              SettingsTextItem(
                title: LocaleKeys.min_distance_meter.tr(),
                text: "131",
              ),
              SettingsTextItem(
                title: LocaleKeys.gps_data_accuracy.tr(),
                text: "131",
                isLast: true,
              )
            ],
          ),
          SettingsContent(
            title: LocaleKeys.required_action.tr(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.photo.tr(),
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.remainder.tr(),
                initial: false,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.shipping_date.tr(),
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: LocaleKeys.outlet.tr().toUpperCase(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.enable.tr(),
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.version.tr(),
                initial: true,
                isDisable: isDisable,
                isLast: true,
              ),
            ],
          ),
          SettingsContent(
            title: LocaleKeys.product_list_set_up.tr(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.show_products_out_of_stock.tr(),
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: LocaleKeys.outlets_full.tr(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.show_main_photo.tr(),
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: LocaleKeys.other_.tr(),
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.when_adding_order_photo_not_required.tr(),
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: LocaleKeys.show_products_out_of_stock.tr(),
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
