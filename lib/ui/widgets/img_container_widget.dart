import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final VoidCallback? delete;
  final String imgPath;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  const ImageContainer({
    required this.imgPath,
    this.onTap,
    this.delete,
    this.padding = const EdgeInsets.all(5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap ?? () {},
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AppWidgets.imageAsset(
                path: imgPath,
                height: 83,
                width: 105,
              ),
            ),
            Positioned(
              bottom: 9,
              left: 7,
              child: AppWidgets.iconButton(
                onPressed: delete ?? () {},
                icon: Assets.images.icons.trashCan,
                height: 24,
                width: 24,
                bgColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
