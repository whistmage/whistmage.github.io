import 'package:flutter/material.dart';
import 'package:sandbox/assets/assets.gen.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.radius = 100,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    const borderWidth = 2;
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.outline,
      radius: radius,
      child: CircleAvatar(
        radius: radius - borderWidth,
        backgroundImage: Assets.images.photos.photo.provider(),
      ),
    );
  }
}
