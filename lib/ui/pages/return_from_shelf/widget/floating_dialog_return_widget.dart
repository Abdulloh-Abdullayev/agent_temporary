import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/select_photo_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';
import '../../../../core/localization/locale_keys.g.dart';

import '../return_order_page.dart';

class FloatingDialogReturn extends StatelessWidget {
  FloatingDialogReturn({Key? key}) : super(key: key);
  final listTextName = <String>[
    LocaleKeys.stock.tr(),
    LocaleKeys.direction_type.tr(),
    LocaleKeys.price_type.tr(),
  ];
  final seeListTextName = <String>[
    LocaleKeys.main_warehouse.tr(),
    LocaleKeys.direction.tr(),
    LocaleKeys.spot.tr(),
  ];

  final List<Widget> icons = [
    Assets.images.icons.stack.svg(),
    Assets.images.icons.shoppingCardIcon.svg(),
    Assets.images.icons.box.svg(),
  ];
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
                    icons: [
                      InkWell(
                        child: SizedBox(
                          height: 14,
                          width: 14,
                          child: Assets.images.icons.zadachi.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 16,
                          width: 16,
                          child: Assets.images.icons.history.svg(),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 16,
                          width: 10,
                          child: Assets.images.icons.fotoOtchot.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: ((context) {
                              return const Center(
                                child: SelectPhotoDialog(),
                              );
                            }),
                          );
                        },
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 17,
                          width: 17,
                          child: Assets.images.icons.infoCircle.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 13,
                          width: 13,
                          child: Assets.images.icons.refresh.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              enableDrag: false,
                              builder: (context) {
                                return AddingAnOrderSheet(
                                  submitOnTapButton: () {
                                    Modular.to.pushNamed(
                                        ReturnOrderDatePage.routeName);
                                  },
                                  quitOnTapButton: () {
                                    Modular.to.pop(context);
                                  },
                                  text: LocaleKeys.order_return.tr(),
                                  listTextName: listTextName,
                                  seeListTextName: seeListTextName,
                                  icons: icons,
                                );
                              });
                        },
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: Assets.images.icons.exchange.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              enableDrag: false,
                              builder: (context) {
                                return ReasomnForReturnSheet(
                                  text: LocaleKeys.order_return.tr(),
                                  textItemsName: [
                                    "Не получается продать",
                                    "Не получается продать",
                                    "Не получается продать",
                                    "Не получается продать",
                                  ],
                                );
                              });
                        },
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 16,
                          width: 16,
                          child: Assets.images.icons.obmen.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 16,
                          width: 16,
                          child: Assets.images.icons.obmen.svg(
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                    textName: [
                      LocaleKeys.tasks.tr(),
                      LocaleKeys.history.tr(),
                      LocaleKeys.photo_report.tr(),
                      LocaleKeys.refusal.tr(),
                      LocaleKeys.return_from_shelf.tr(),
                      LocaleKeys.return_package.tr(),
                      LocaleKeys.exchange.tr(),
                      LocaleKeys.remains.tr(),
                    ],
                    cencelButton: () {
                      Modular.to.pop(context);
                    },
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
