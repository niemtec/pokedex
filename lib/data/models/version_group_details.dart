import 'package:pokedex/data/models/move_learn_method.dart';
import 'package:pokedex/data/models/version_group.dart';

class VersionGroupDetails {
  final int levelLearnedAt;
  final MoveLearnMethod moveLearnMethod;
  final VersionGroup versionGroup;

  VersionGroupDetails({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetails(
      levelLearnedAt: json['level_learned_at'],
      moveLearnMethod: MoveLearnMethod.fromJson(json['move_learn_method']),
      versionGroup: VersionGroup.fromJson(json['version_group']),
    );
  }
}
