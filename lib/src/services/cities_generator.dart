import 'package:devfest/src/models/asset.dart';
import 'package:devfest/src/services/asset_generator.dart';
import 'package:devfest/src/utils/assets.dart';

class CitiesGenerator extends AssetsGenerator {
  static const _filterWord = 'city';

  const CitiesGenerator();

  @override
  List<AppAssetDTO> getAssetItems() => AppAssetImage.values
      .where(
        (element) => element.path.contains(
          _filterWord,
        ),
      )
      .map<AppAssetDTO>(
        (element) => AppAssetDTO(
          path: element.path,
        ),
      )
      .toList();
}
