import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/add_img_button.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:agent/ui/widgets/img_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOutletsModule extends Module {
  @override
  List<Bind> get binds => [];

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
    List<String> list = [
      'assets/images/img1.jpg',
      'assets/images/img1.jpg',
      'assets/images/img1.jpg',
      'assets/images/img1.jpg',
      'assets/images/img1.jpg',
      'assets/images/img1.jpg',
    ];
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Column(
          children: [
            outletsAppBar(),
            buildBody(
              body: [
                Container(
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
                          list.length + 1,
                          (index) {
                            if (index != list.length) {
                              return ImageContainer(
                                imgPath: list[index],
                                onTap: () {},
                                delete: () {},
                              );
                            }
                            return AddImgButton(
                              onTap: () {},
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
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
}
