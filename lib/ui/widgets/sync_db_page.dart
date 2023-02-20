import 'dart:ui';

import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uikit/extensions/app_extensions.dart';

import '../../core/bloc/sync_bloc /sync_bloc.dart';

class SyncDbPage extends StatelessWidget {
  const SyncDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
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
            child: BlocConsumer<SyncBloc, SyncState>(
              listener: (context, state) {
                if (state is SyncSuccess) {
                  if (state.percent == 100) {
                    BotToast.showText(text: "success");
                    Modular.to.pushReplacementNamed(HomePage.routeName);
                  }
                }
              },
              bloc: SyncBloc.to,
              buildWhen: (previous, current) {
                if (current is SyncSuccess) {
                  return true;
                }
                return false;
              },
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
                        percent: state.percent / 100,
                        center: new Text("${state.percent.toInt()} %"),
                        progressColor: Colors.green,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      state.percent != 100
                          ? const CupertinoActivityIndicator(
                              radius: 20,
                            )
                          : SizedBox(),
                      AppWidgets.textLocale(
                        localeKey: state.syncString.toString(),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        maxLines: 100,
                      ).paddingSymmetric(horizontal: 20, vertical: 14),
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
