import 'package:flutter/material.dart';

import 'settings_content.dart';
import 'settings_item.dart';
import 'settings_switch.dart';

class BasicSettingsWidget extends StatelessWidget {
  const BasicSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SettingsContent(
            title: "ОСНОВНЫЕ НАСТРОЙКИ",
            items: [
              SettingsItem(
                title: "Язык приложении",
                text: 'Русский',
                onTap: () {},
              ),
              SettingsItem(
                title: "Тип клавиатуры",
                text: 'Маленький',
                onTap: () {},
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Полная синхоризация с фото",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Печать с логотипом",
                initial: false,
                isLast: true,
              )
            ],
          ),
          SettingsContent(
            title: "Натройки фильтра",
            items: [
              SettingsSwitch(
                title: "Показать товары которые  нет на складе",
                onChanged: (bool v) {},
              ),
              SettingsSwitch(
                title: "Сортировка клиентов в альфавитном порядке",
                onChanged: (bool v) {},
              ),
              SettingsSwitch(
                title: "Сортировка продуктов в альфавитном порядке",
                onChanged: (bool v) {},
                isLast: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
