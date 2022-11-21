import 'package:flutter/material.dart';

import 'settings_content.dart';
import 'settings_switch.dart';

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
            title: "ОСНОВНЫЕ НАСТРОЙКИ",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Добавить новую торговую точку",
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Разрещить новому клиенту использовать консигнацию",
                initial: false,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Показать баланс клиента",
                initial: false,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Префикс номера телефона",
                initial: false,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: "ДОСТУПНЫЕ ПОЛЯ ДЛЯ РЕДАКТРИРОВАНИЕ",
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Название",
                initial: true,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Название фирмы",
                initial: true,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Категория",
                initial: true,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Территория",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "ИНН",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Телефон",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Дни посещений",
                initial: false,
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
