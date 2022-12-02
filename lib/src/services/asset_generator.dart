import 'package:devfest/src/models/asset.dart';

abstract class AssetsGenerator {
  List<AppAssetDTO> getAssetItems();
}
