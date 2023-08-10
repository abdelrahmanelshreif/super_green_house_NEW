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
  final String kingdom;
  @HiveField(4)
  final String family;

  PlanetDataModel({
    required this.planetName,
    required this.planetFeatures,
    required this.planetDesc,
    required this.kingdom,
    required this.family,
    // required this.planetName,
  });
}
