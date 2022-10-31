import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';

import '../../../core/utils/assets.gen.dart';
import '../../widgets/appbar_main.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(
        children: [
          AppBarMain(
            onTapButton: () {},
            text: "Qayerga //ketmoqdasiz?//",
          ),
        ],
      ),
    );
  }
}
