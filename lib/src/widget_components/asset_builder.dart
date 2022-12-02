import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/models/asset.dart';
import 'package:flutter/material.dart';

class AssetBuilder extends StatelessWidget {
  final AppAssetDTO appAssetDTO;

  const AssetBuilder({
    required this.appAssetDTO,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        10.adaptedPx(context),
      ),
      child: Image.asset(
        appAssetDTO.path,
        fit: BoxFit.cover,
      ),
    );
  }
}
