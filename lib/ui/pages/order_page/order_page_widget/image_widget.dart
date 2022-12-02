import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.gen.dart';
import '../../../../core/utils/colors.gen.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.image,
    required this.onPressedDelete,
  }) : super(key: key);
  final String image;
  final VoidCallback onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 104.w,
            width: 104.w,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: image,
              placeholder: (context, url) =>
              const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) =>
              const Icon(Icons.person),
            ),
          ),
        ),
        InkWell(
          onTap: onPressedDelete,
          child: Container(
            margin: EdgeInsets.only(
              left: 8.w,
              bottom: 8.w,
            ),
            height: 24.w,
            width: 24.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorName.black,
            ),
            child: Center(
              child: Assets.images.icons.delete.svg(
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
