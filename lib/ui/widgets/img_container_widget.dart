import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final VoidCallback? delete;
  final String path;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final String? url;

  const ImageContainer({
    required this.path,
    this.url,
    this.onTap,
    this.delete,
    this.padding = const EdgeInsets.all(5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url ?? path,
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: () {
            AppWidgets.openImgDialog(
              context: context,
              imgPath: path,
              url: url,
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: url != null
                    ? AppWidgets.networkImage(
                        url: url!,
                        height: 83,
                        width: 105,
                      )
                    : AppWidgets.imageFile(
                        path: path,
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
      ),
    );
  }
}
