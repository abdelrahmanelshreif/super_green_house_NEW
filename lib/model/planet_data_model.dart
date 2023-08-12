import 'package:hive/hive.dart';

part 'planet_data_model.g.dart';

@HiveType(typeId: 0)
class PlanetDataModel extends HiveObject {
  @HiveField(0)
  final String planetName;
  @HiveField(1)
  final List<String> planetFeatures;
  @HiveField(2)
  final String planetDesc;
  @HiveField(3)
  final String planetKingdom;
  @HiveField(4)
  final String planetFamily;
  @HiveField(5)
  final String planetImgSrc;

  PlanetDataModel({
    required this.planetName,
    required this.planetFeatures,
    required this.planetDesc,
    required this.planetKingdom,
    required this.planetFamily,
    required this.planetImgSrc,
  });
}
