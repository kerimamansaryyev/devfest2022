import 'package:devfest/src/models/asset.dart';

abstract class AssetsGenerator {
  const AssetsGenerator();
  List<AppAssetDTO> getAssetItems();
}
