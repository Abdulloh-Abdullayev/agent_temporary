import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActReconciliationPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ActReconciliationPage.routeName,
          child: (context, args) => const ActReconciliationPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        // Bind<AppNavigationBloc>(
        //   (i) => AppNavigationBloc(),
        //   onDispose: (value) => value.close(),
        // ),
      ];
}

class ActReconciliationPage extends StatefulWidget {
  static const String routeName = "/act_reconciliation_page";
  const ActReconciliationPage({super.key});

  @override
  State<ActReconciliationPage> createState() => _ActReconciliationPageState();
}

class _ActReconciliationPageState extends State<ActReconciliationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // ActWidget.AppBar(),
            AppWidgets.textLocale(
              localeKey: "Запросить историю",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.black,
            ).marginSymmetric(vertical: 18)
          ],
        ),
      ),
    );
  }
}
