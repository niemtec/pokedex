// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonModel {
  int get id;
  String get name;
  int get height;
  int get weight;
  String get sprite;
  List<String> get types;
  List<String> get abilities;
  String get color;
  String get shape;
  String get habitat;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PokemonModelCopyWith<PokemonModel> get copyWith =>
      _$PokemonModelCopyWithImpl<PokemonModel>(
          this as PokemonModel, _$identity);

  /// Serializes this PokemonModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PokemonModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.sprite, sprite) || other.sprite == sprite) &&
            const DeepCollectionEquality().equals(other.types, types) &&
            const DeepCollectionEquality().equals(other.abilities, abilities) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            (identical(other.habitat, habitat) || other.habitat == habitat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      height,
      weight,
      sprite,
      const DeepCollectionEquality().hash(types),
      const DeepCollectionEquality().hash(abilities),
      color,
      shape,
      habitat);

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, height: $height, weight: $weight, sprite: $sprite, types: $types, abilities: $abilities, color: $color, shape: $shape, habitat: $habitat)';
  }
}

/// @nodoc
abstract mixin class $PokemonModelCopyWith<$Res> {
  factory $PokemonModelCopyWith(
          PokemonModel value, $Res Function(PokemonModel) _then) =
      _$PokemonModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      String sprite,
      List<String> types,
      List<String> abilities,
      String color,
      String shape,
      String habitat});
}

/// @nodoc
class _$PokemonModelCopyWithImpl<$Res> implements $PokemonModelCopyWith<$Res> {
  _$PokemonModelCopyWithImpl(this._self, this._then);

  final PokemonModel _self;
  final $Res Function(PokemonModel) _then;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? sprite = null,
    Object? types = null,
    Object? abilities = null,
    Object? color = null,
    Object? shape = null,
    Object? habitat = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      sprite: null == sprite
          ? _self.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      abilities: null == abilities
          ? _self.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _self.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String,
      habitat: null == habitat
          ? _self.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PokemonModel implements PokemonModel {
  const _PokemonModel(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      this.sprite = '',
      final List<String> types = const [],
      final List<String> abilities = const [],
      this.color = '',
      this.shape = '',
      this.habitat = ''})
      : _types = types,
        _abilities = abilities;
  factory _PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  @JsonKey()
  final String sprite;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<String> _abilities;
  @override
  @JsonKey()
  List<String> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final String shape;
  @override
  @JsonKey()
  final String habitat;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PokemonModelCopyWith<_PokemonModel> get copyWith =>
      __$PokemonModelCopyWithImpl<_PokemonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PokemonModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.sprite, sprite) || other.sprite == sprite) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            (identical(other.habitat, habitat) || other.habitat == habitat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      height,
      weight,
      sprite,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_abilities),
      color,
      shape,
      habitat);

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, height: $height, weight: $weight, sprite: $sprite, types: $types, abilities: $abilities, color: $color, shape: $shape, habitat: $habitat)';
  }
}

/// @nodoc
abstract mixin class _$PokemonModelCopyWith<$Res>
    implements $PokemonModelCopyWith<$Res> {
  factory _$PokemonModelCopyWith(
          _PokemonModel value, $Res Function(_PokemonModel) _then) =
      __$PokemonModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      String sprite,
      List<String> types,
      List<String> abilities,
      String color,
      String shape,
      String habitat});
}

/// @nodoc
class __$PokemonModelCopyWithImpl<$Res>
    implements _$PokemonModelCopyWith<$Res> {
  __$PokemonModelCopyWithImpl(this._self, this._then);

  final _PokemonModel _self;
  final $Res Function(_PokemonModel) _then;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? sprite = null,
    Object? types = null,
    Object? abilities = null,
    Object? color = null,
    Object? shape = null,
    Object? habitat = null,
  }) {
    return _then(_PokemonModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      sprite: null == sprite
          ? _self.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      abilities: null == abilities
          ? _self._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _self.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String,
      habitat: null == habitat
          ? _self.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
