import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ExchangePage.routeName,
          child: (context, args) => const ExchangePage(),
        ),
      ];
}

class ExchangePage extends StatelessWidget {
  const ExchangePage({Key? key}) : super(key: key);

  static String routeName = "/exchange";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 1.sw,
          decoration: BoxDecoration(
            color: ColorName.primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12.r),
            ),
          ),
        )
      ],
    );
  }
}
