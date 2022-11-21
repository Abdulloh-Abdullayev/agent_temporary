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
                isLast:true,
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
          SettingsContent(
            title: "GPS",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                isDisable: isDisable,
                title: "Минимальные уровень заряда",
                onChanged: (bool value) {},
              ),
              SettingsSwitch(
                isDisable: isDisable,
                title: "Всегда включен",
                onChanged: (bool value) {},
              ),
              SettingsSwitch(
                isDisable: isDisable,
                title: "Всегда прикрепить местоположения при добавления заказа",
                onChanged: (bool value) {},
              ),
              SettingsSwitch(
                isDisable: isDisable,
                title: "Отслеживать местоположений",
                onChanged: (bool value) {},
              ),
              //todo Интервал отслеживания местоположений
            ],
          ),
          SettingsContent(
            title: "Обязательные действие",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Фото",
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Остаток",
                initial: false,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Дата отгрузки",
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: "OULET",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Включено",
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Версия",
                initial: true,
                isDisable: isDisable,
                isLast: true,
              ),
            ],
          ),
          SettingsContent(
            title: "Настройка списка товаров",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Показать товары которые  нет на складе",
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: "торговые точки",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Показать главную фотографию",
                initial: true,
                isLast: true,
                isDisable: isDisable,
              ),
            ],
          ),
          SettingsContent(
            title: "Прочие",
            isDisable: isDisable,
            items: [
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "При добавление заказа требуется фото отёт",
                initial: true,
                isDisable: isDisable,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Показать товары которые  нет на складе",
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
