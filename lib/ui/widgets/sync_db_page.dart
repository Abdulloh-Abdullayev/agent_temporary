import 'dart:ui';

import 'package:agent/core/bloc/sync_bloc%20/sync_bloc.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uikit/extensions/app_extensions.dart';

class SyncDbPage extends StatelessWidget {
  const SyncDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
            ),
            child: BlocBuilder<SyncBloc, SyncState>(
              bloc: SyncBloc.to,
              builder: (context, state) {
                if (state is SyncInitial) {
                  return CircularProgressIndicator();
                }
                if (state is SyncSuccess) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: 0.5,
                        center: new Text("${state.syncString.length}"),
                        progressColor: Colors.green,
                      ),
                      CircularProgressIndicator(
                        color: ColorName.mainColor,
                      ),
                      AppWidgets.textLocale(
                        localeKey: state.syncString.toString(),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        maxLines: 100,
                      ).paddingOnly(top: 14.w),
                      AppWidgets.appButton(
                        title: "Apply",
                        onTap: () {
                          Modular.to.pop();
                        },
                      ).paddingSymmetric(horizontal: 20.w, vertical: 20.w),
                    ],
                  );
                }
                if (state is SyncFailure) {
                  return Icon(Icons.error);
                }
                return Container(
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
