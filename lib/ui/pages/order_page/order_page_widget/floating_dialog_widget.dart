import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/exchange/exchange_page.dart';
import 'package:agent/ui/pages/history_orders/history_orders_page.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/select_photo_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class FloatingDialog extends StatelessWidget {
  const FloatingDialog({Key? key}) : super(key: key);

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
                    top: MediaQuery.of(context).size.height * 0.45,
                    bottom: MediaQuery.of(context).size.width * 0.45,
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
                        onTap: () {
                          Modular.to.pushNamed(HistoryOrdersPage.routeName);
                        },
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
                        onTap: () {},
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: Assets.images.icons.exchange.svg(
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
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return AddingAnOrderSheet(
                                text: LocaleKeys.product_exchange.tr(),
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
                                  Assets.images.icons.stack.svg(),
                                  Assets.images.icons.shoppingCardIcon.svg(),
                                  Assets.images.icons.cash.svg(),
                                ],
                                quitOnTapButton: () {
                                  Navigator.pop(context);
                                },
                                submitOnTapButton: () {
                                  Modular.to.pushNamed(ExchangePage.routeName);
                                },
                              );
                            },
                          );
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
