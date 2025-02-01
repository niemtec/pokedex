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
}
