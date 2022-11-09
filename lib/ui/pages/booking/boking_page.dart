import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/booking/widgets/booking_items.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../widgets/appbar_main.dart';

class BookingModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          BookingPage.routeName,
          child: (context, args) => const BookingPage(),
        ),
      ];

  // @override
  // List<Bind<Object>> get binds => [
  //       Bind<AppNavigationBloc>(
  //         (i) => AppNavigationBloc(),
  //         onDispose: (value) => value.close(),
  //       ),
  //     ];
}

class BookingPage extends StatefulWidget {
  static const String routeName = "/bookingPage";
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 119.w,
            decoration: const BoxDecoration(
              color: ColorName.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: BookingItems(),
          ),
        ],
      ),
    );
  }
}
