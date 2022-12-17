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
            localeKey: LocaleKeys.add_outlet,
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
            localeKey: LocaleKeys.photos_of_outlets,
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
          title(title: LocaleKeys.data_outlets.tr()),
          //Название торговой точки
          inputWithTitle(
            title: LocaleKeys.name_of_outlets.tr(),
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
            title: LocaleKeys.category.tr(),
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
            title: LocaleKeys.territory.tr(),
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
            title: LocaleKeys.client_type.tr(),
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
            title: LocaleKeys.sales_channel.tr(),
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
          title(title: LocaleKeys.contact_details.tr()),
          inputWithTitle(
            title: LocaleKeys.address.tr(),
            onChanged: (v) {},
          ),
          inputWithTitle(
            title: LocaleKeys.reference_point.tr(),
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: LocaleKeys.contact_person.tr(),
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          //todo qr code
          Row(
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.qr_code.tr(),
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
            title: LocaleKeys.note.tr(),
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),

          AppWidgets.textLocale(
            localeKey: LocaleKeys.phone_number,
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
            title: LocaleKeys.visit_days.tr(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.locations,
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
                title: LocaleKeys.point_on_the_map.tr(),
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
          title(title: LocaleKeys.customer_details.tr()),
          inputWithTitle(
            title: LocaleKeys.inn.tr(),
            onChanged: (v) {},
          ),
          inputWithTitle(
            title: LocaleKeys.rs.tr(),
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title:  LocaleKeys.bank.tr(),
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: LocaleKeys.mfo.tr(),
            onChanged: (v) {},
          ).paddingOnly(top: 18.w),
          inputWithTitle(
            title: LocaleKeys.oked.tr(),
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
