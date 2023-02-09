import 'package:agent/core/models/account_model.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class AccountItemWidget extends StatelessWidget {
  final AccountModel accountModel;

  const AccountItemWidget({
    required this.accountModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppWidgets.circularAvatar(
                  imgUrl: accountModel.imgUrl, radius: 15),
              AppWidgets.text(
                text: accountModel.name,
                fontSize: 14.sp,
                color: Colors.white,
              ).paddingOnly(left: 8.w),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppWidgets.iconButton(
                onPressed: () {},
                icon: Assets.images.icons.edit,
              ).paddingOnly(right: 12.w),
              AppWidgets.iconButton(
                onPressed: () {},
                icon: Assets.images.icons.logout,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
