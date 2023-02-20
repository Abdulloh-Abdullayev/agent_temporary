import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/models/user/user_model.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItemWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const AccountItemWidget({
    required this.onTap,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppWidgets.circularAvatar(imgUrl: "", radius: 15),
                AppWidgets.text(
                  text: user.firstName ?? "",
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
      ),
    );
  }
}
