import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/add_outlets_page/cubit/add_outlets_cubit.dart';
import 'package:agent/ui/widgets/add_img_button.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:agent/ui/widgets/img_container_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uikit/uikit.dart';

class AddOutletsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<AddOutletsCubit>(
          (i) => AddOutletsCubit(),
          onDispose: (value) => value.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AddOutletsPage.routeName,
          child: (context, args) => const AddOutletsPage(),
        )
      ];
}

class AddOutletsPage extends StatelessWidget {
  const AddOutletsPage({Key? key}) : super(key: key);
  static const String routeName = '/addOutletsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: BlocBuilder<AddOutletsCubit, AddOutletsState>(
          bloc: AddOutletsCubit.to,
          builder: (context, state) {
            return Column(
              children: [
                outletsAppBar(),
                buildBody(
                  body: [
                    buildImages(state, context),
                    buildPointOfSale(),
                    buildContactDetail(),
                    buildClientDetail(),
                    AppWidgets.appButton(
                      title: LocaleKeys.save.tr(),
                      onTap: () {},
                    ).paddingSymmetric(
                      horizontal: 20.w,
                      vertical: 18.w,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildBody({
    List<Widget> body = const [],
  }) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: body,
        ),
      ),
    );
  }

  Widget outletsAppBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.backButton(
                () {
                  Modular.to.pop();
                },
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: "Добавить торговую точку",
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w),
        ],
      ),
    );
  }

  Widget buildImages(
    AddOutletsState state,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 12.w),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
            localeKey: "Фотографии торговой точки",
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: ColorName.gray3,
          ).paddingOnly(bottom: 12.w),
          Wrap(
            direction: Axis.horizontal,
            verticalDirection: VerticalDirection.down,
            children: List.generate(
              state.images.length + 1,
              (index) {
                if (index != state.images.length) {
                  return ImageContainer(
                    path: state.images[index].path,
                    onTap: () {},
                    delete: () {
                      AddOutletsCubit.to.deleteImg(index);
                    },
                  );
                }
                return AddImgButton(
                  onTap: () {
                    AddOutletsCubit.to.uploadImg();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildPointOfSale() {
    return Container(
      margin: EdgeInsets.only(top: 12.w),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(title: "Данные торговой точки"),
          //Название торговой точки
          inputWithTitle(
            title: "Название торговой точки",
            onChanged: (v) {},
          ),
          // Категория
          dropDownWithTitle(
            items: [
              'text 1',
              'text 2',
              'text 3',
              'text 4',
            ],
            onChange: (v) {
              print(v);
            },
            title: 'Категория',
          ),
          // Территория
          dropDownWithTitle(
            items: [
              'text 1',
              'text 2',
              'text 3',
              'text 4',
            ],
            onChange: (v) {
              print(v);
            },
            title: 'Территория',
          ),
          // Тип клиента
          dropDownWithTitle(
            items: [
              'text 1',
              'text 2',
              'text 3',
              'text 4',
            ],
            onChange: (v) {
              print(v);
            },
            title: 'Тип клиента',
          ),
          // Канал сбыта
          dropDownWithTitle(
            items: [
              'text 1',
              'text 2',
              'text 3',
              'text 4',
            ],
            onChange: (v) {
              print(v);
            },
            title: 'Канал сбыта',
          ),
        ],
      ),
    );
  }

  Widget buildContactDetail() {
    return Container(
      margin: EdgeInsets.only(top: 12.w),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(title: "Контактные данные"),
          inputWithTitle(
            title: "Адрес",
            onChanged: (v) {},
          ),
          inputWithTitle(
            title: "Ориентир",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: "Контактное лицо",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          //todo qr code
          Row(
            children: [
              AppWidgets.textLocale(
                localeKey: "QR Код",
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppWidgets.iconButton(
                onPressed: () {},
                icon: Assets.images.icons.trashCan,
              ),
            ],
          ),
          inputWithTitle(
            title: "Примечание",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),

          AppWidgets.textLocale(
            localeKey: "Номер телефона",
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: ColorName.gray3,
          ).paddingOnly(top: 18.w),
          AppInputTextField(
            prefix: AppWidgets.textLocale(
              localeKey: "+998",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ).paddingOnly(right: 10),
            hint: '-- --- -- --',
            inputFormatter: MaskTextInputFormatter(
              mask: "## ### ## ##",
            ),
          ).paddingOnly(top: 12.w),
          dropDownWithTitle(
            items: [
              'text 1',
              'text 2',
              'text 3',
              'text 4',
            ],
            onChange: (v) {},
            title: "Дни посещения",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Местоположения",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppWidgets.appButton(
                width: 156.w,
                height: 42.w,
                borderColor: ColorName.buttonColor,
                color: Colors.white,
                textColor: ColorName.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                title: "Указать на карте",
                onTap: () {},
              )
            ],
          ).paddingOnly(top: 18.w)
        ],
      ),
    );
  }

  Widget buildClientDetail() {
    return Container(
      margin: EdgeInsets.only(top: 12.w),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(title: "Реквизиты клиента"),
          inputWithTitle(
            title: "ИНН",
            onChanged: (v) {},
          ),
          inputWithTitle(
            title: "Р/C",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: "Банк",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: "МФО",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: "ОКЕД",
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
        ],
      ),
    );
  }

  Widget dropDownWithTitle({
    required List<String> items,
    required Function onChange,
    String title = '',
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          localeKey: title,
          fontSize: 14.sp,
          color: ColorName.gray3,
        ).paddingOnly(top: 18.w),
        DropDown(
          color: ColorName.input,
          width: 1.sw,
          height: 44.w,
          items: items,
          title: LocaleKeys.select.tr(),
          onChange: (v) => onChange(v),
        ).paddingOnly(top: 12.w)
      ],
    );
  }

  Widget inputWithTitle({
    required String title,
    required Function onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          localeKey: title,
          fontSize: 14.sp,
          color: ColorName.gray3,
        ).paddingOnly(bottom: 12.w),
        AppInputTextField(
          hint: LocaleKeys.write.tr(),
          onChanged: (v) {
            print(v);
          },
        ),
      ],
    );
  }

  Widget title({
    required String title,
  }) {
    return AppWidgets.textLocale(
      localeKey: title,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: ColorName.gray3,
    ).paddingOnly(bottom: 18.w);
  }
}
