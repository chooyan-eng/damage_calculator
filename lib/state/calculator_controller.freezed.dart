// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calculator_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalculatorState _$CalculatorStateFromJson(Map<String, dynamic> json) {
  return _CalculatorState.fromJson(json);
}

/// @nodoc
class _$CalculatorStateTearOff {
  const _$CalculatorStateTearOff();

  _CalculatorState call(
      {bool showingDetail = true,
      required StatusParams atk,
      required StatusParams def,
      int power = 100,
      int maxDamage = 0,
      int minDamage = 0,
      List<DamageScaleFactor> atkScaleFactorList = const [],
      List<DamageScaleFactor> defScaleFactorList = const [],
      required DamageScaleFactor atkRank,
      required DamageScaleFactor defRank,
      required StatusParams hp}) {
    return _CalculatorState(
      showingDetail: showingDetail,
      atk: atk,
      def: def,
      power: power,
      maxDamage: maxDamage,
      minDamage: minDamage,
      atkScaleFactorList: atkScaleFactorList,
      defScaleFactorList: defScaleFactorList,
      atkRank: atkRank,
      defRank: defRank,
      hp: hp,
    );
  }

  CalculatorState fromJson(Map<String, Object> json) {
    return CalculatorState.fromJson(json);
  }
}

/// @nodoc
const $CalculatorState = _$CalculatorStateTearOff();

/// @nodoc
mixin _$CalculatorState {
  bool get showingDetail => throw _privateConstructorUsedError;
  StatusParams get atk => throw _privateConstructorUsedError;
  StatusParams get def => throw _privateConstructorUsedError;
  int get power => throw _privateConstructorUsedError;
  int get maxDamage => throw _privateConstructorUsedError;
  int get minDamage => throw _privateConstructorUsedError;
  List<DamageScaleFactor> get atkScaleFactorList =>
      throw _privateConstructorUsedError;
  List<DamageScaleFactor> get defScaleFactorList =>
      throw _privateConstructorUsedError;
  DamageScaleFactor get atkRank => throw _privateConstructorUsedError;
  DamageScaleFactor get defRank => throw _privateConstructorUsedError;
  StatusParams get hp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res>;
  $Res call(
      {bool showingDetail,
      StatusParams atk,
      StatusParams def,
      int power,
      int maxDamage,
      int minDamage,
      List<DamageScaleFactor> atkScaleFactorList,
      List<DamageScaleFactor> defScaleFactorList,
      DamageScaleFactor atkRank,
      DamageScaleFactor defRank,
      StatusParams hp});

  $StatusParamsCopyWith<$Res> get atk;
  $StatusParamsCopyWith<$Res> get def;
  $DamageScaleFactorCopyWith<$Res> get atkRank;
  $DamageScaleFactorCopyWith<$Res> get defRank;
  $StatusParamsCopyWith<$Res> get hp;
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  final CalculatorState _value;
  // ignore: unused_field
  final $Res Function(CalculatorState) _then;

  @override
  $Res call({
    Object? showingDetail = freezed,
    Object? atk = freezed,
    Object? def = freezed,
    Object? power = freezed,
    Object? maxDamage = freezed,
    Object? minDamage = freezed,
    Object? atkScaleFactorList = freezed,
    Object? defScaleFactorList = freezed,
    Object? atkRank = freezed,
    Object? defRank = freezed,
    Object? hp = freezed,
  }) {
    return _then(_value.copyWith(
      showingDetail: showingDetail == freezed
          ? _value.showingDetail
          : showingDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      atk: atk == freezed
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as StatusParams,
      def: def == freezed
          ? _value.def
          : def // ignore: cast_nullable_to_non_nullable
              as StatusParams,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      maxDamage: maxDamage == freezed
          ? _value.maxDamage
          : maxDamage // ignore: cast_nullable_to_non_nullable
              as int,
      minDamage: minDamage == freezed
          ? _value.minDamage
          : minDamage // ignore: cast_nullable_to_non_nullable
              as int,
      atkScaleFactorList: atkScaleFactorList == freezed
          ? _value.atkScaleFactorList
          : atkScaleFactorList // ignore: cast_nullable_to_non_nullable
              as List<DamageScaleFactor>,
      defScaleFactorList: defScaleFactorList == freezed
          ? _value.defScaleFactorList
          : defScaleFactorList // ignore: cast_nullable_to_non_nullable
              as List<DamageScaleFactor>,
      atkRank: atkRank == freezed
          ? _value.atkRank
          : atkRank // ignore: cast_nullable_to_non_nullable
              as DamageScaleFactor,
      defRank: defRank == freezed
          ? _value.defRank
          : defRank // ignore: cast_nullable_to_non_nullable
              as DamageScaleFactor,
      hp: hp == freezed
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as StatusParams,
    ));
  }

  @override
  $StatusParamsCopyWith<$Res> get atk {
    return $StatusParamsCopyWith<$Res>(_value.atk, (value) {
      return _then(_value.copyWith(atk: value));
    });
  }

  @override
  $StatusParamsCopyWith<$Res> get def {
    return $StatusParamsCopyWith<$Res>(_value.def, (value) {
      return _then(_value.copyWith(def: value));
    });
  }

  @override
  $DamageScaleFactorCopyWith<$Res> get atkRank {
    return $DamageScaleFactorCopyWith<$Res>(_value.atkRank, (value) {
      return _then(_value.copyWith(atkRank: value));
    });
  }

  @override
  $DamageScaleFactorCopyWith<$Res> get defRank {
    return $DamageScaleFactorCopyWith<$Res>(_value.defRank, (value) {
      return _then(_value.copyWith(defRank: value));
    });
  }

  @override
  $StatusParamsCopyWith<$Res> get hp {
    return $StatusParamsCopyWith<$Res>(_value.hp, (value) {
      return _then(_value.copyWith(hp: value));
    });
  }
}

/// @nodoc
abstract class _$CalculatorStateCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$CalculatorStateCopyWith(
          _CalculatorState value, $Res Function(_CalculatorState) then) =
      __$CalculatorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showingDetail,
      StatusParams atk,
      StatusParams def,
      int power,
      int maxDamage,
      int minDamage,
      List<DamageScaleFactor> atkScaleFactorList,
      List<DamageScaleFactor> defScaleFactorList,
      DamageScaleFactor atkRank,
      DamageScaleFactor defRank,
      StatusParams hp});

  @override
  $StatusParamsCopyWith<$Res> get atk;
  @override
  $StatusParamsCopyWith<$Res> get def;
  @override
  $DamageScaleFactorCopyWith<$Res> get atkRank;
  @override
  $DamageScaleFactorCopyWith<$Res> get defRank;
  @override
  $StatusParamsCopyWith<$Res> get hp;
}

/// @nodoc
class __$CalculatorStateCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res>
    implements _$CalculatorStateCopyWith<$Res> {
  __$CalculatorStateCopyWithImpl(
      _CalculatorState _value, $Res Function(_CalculatorState) _then)
      : super(_value, (v) => _then(v as _CalculatorState));

  @override
  _CalculatorState get _value => super._value as _CalculatorState;

  @override
  $Res call({
    Object? showingDetail = freezed,
    Object? atk = freezed,
    Object? def = freezed,
    Object? power = freezed,
    Object? maxDamage = freezed,
    Object? minDamage = freezed,
    Object? atkScaleFactorList = freezed,
    Object? defScaleFactorList = freezed,
    Object? atkRank = freezed,
    Object? defRank = freezed,
    Object? hp = freezed,
  }) {
    return _then(_CalculatorState(
      showingDetail: showingDetail == freezed
          ? _value.showingDetail
          : showingDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      atk: atk == freezed
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as StatusParams,
      def: def == freezed
          ? _value.def
          : def // ignore: cast_nullable_to_non_nullable
              as StatusParams,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      maxDamage: maxDamage == freezed
          ? _value.maxDamage
          : maxDamage // ignore: cast_nullable_to_non_nullable
              as int,
      minDamage: minDamage == freezed
          ? _value.minDamage
          : minDamage // ignore: cast_nullable_to_non_nullable
              as int,
      atkScaleFactorList: atkScaleFactorList == freezed
          ? _value.atkScaleFactorList
          : atkScaleFactorList // ignore: cast_nullable_to_non_nullable
              as List<DamageScaleFactor>,
      defScaleFactorList: defScaleFactorList == freezed
          ? _value.defScaleFactorList
          : defScaleFactorList // ignore: cast_nullable_to_non_nullable
              as List<DamageScaleFactor>,
      atkRank: atkRank == freezed
          ? _value.atkRank
          : atkRank // ignore: cast_nullable_to_non_nullable
              as DamageScaleFactor,
      defRank: defRank == freezed
          ? _value.defRank
          : defRank // ignore: cast_nullable_to_non_nullable
              as DamageScaleFactor,
      hp: hp == freezed
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as StatusParams,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CalculatorState extends _CalculatorState with DiagnosticableTreeMixin {
  const _$_CalculatorState(
      {this.showingDetail = true,
      required this.atk,
      required this.def,
      this.power = 100,
      this.maxDamage = 0,
      this.minDamage = 0,
      this.atkScaleFactorList = const [],
      this.defScaleFactorList = const [],
      required this.atkRank,
      required this.defRank,
      required this.hp})
      : super._();

  factory _$_CalculatorState.fromJson(Map<String, dynamic> json) =>
      _$_$_CalculatorStateFromJson(json);

  @JsonKey(defaultValue: true)
  @override
  final bool showingDetail;
  @override
  final StatusParams atk;
  @override
  final StatusParams def;
  @JsonKey(defaultValue: 100)
  @override
  final int power;
  @JsonKey(defaultValue: 0)
  @override
  final int maxDamage;
  @JsonKey(defaultValue: 0)
  @override
  final int minDamage;
  @JsonKey(defaultValue: const [])
  @override
  final List<DamageScaleFactor> atkScaleFactorList;
  @JsonKey(defaultValue: const [])
  @override
  final List<DamageScaleFactor> defScaleFactorList;
  @override
  final DamageScaleFactor atkRank;
  @override
  final DamageScaleFactor defRank;
  @override
  final StatusParams hp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalculatorState(showingDetail: $showingDetail, atk: $atk, def: $def, power: $power, maxDamage: $maxDamage, minDamage: $minDamage, atkScaleFactorList: $atkScaleFactorList, defScaleFactorList: $defScaleFactorList, atkRank: $atkRank, defRank: $defRank, hp: $hp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalculatorState'))
      ..add(DiagnosticsProperty('showingDetail', showingDetail))
      ..add(DiagnosticsProperty('atk', atk))
      ..add(DiagnosticsProperty('def', def))
      ..add(DiagnosticsProperty('power', power))
      ..add(DiagnosticsProperty('maxDamage', maxDamage))
      ..add(DiagnosticsProperty('minDamage', minDamage))
      ..add(DiagnosticsProperty('atkScaleFactorList', atkScaleFactorList))
      ..add(DiagnosticsProperty('defScaleFactorList', defScaleFactorList))
      ..add(DiagnosticsProperty('atkRank', atkRank))
      ..add(DiagnosticsProperty('defRank', defRank))
      ..add(DiagnosticsProperty('hp', hp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalculatorState &&
            (identical(other.showingDetail, showingDetail) ||
                const DeepCollectionEquality()
                    .equals(other.showingDetail, showingDetail)) &&
            (identical(other.atk, atk) ||
                const DeepCollectionEquality().equals(other.atk, atk)) &&
            (identical(other.def, def) ||
                const DeepCollectionEquality().equals(other.def, def)) &&
            (identical(other.power, power) ||
                const DeepCollectionEquality().equals(other.power, power)) &&
            (identical(other.maxDamage, maxDamage) ||
                const DeepCollectionEquality()
                    .equals(other.maxDamage, maxDamage)) &&
            (identical(other.minDamage, minDamage) ||
                const DeepCollectionEquality()
                    .equals(other.minDamage, minDamage)) &&
            (identical(other.atkScaleFactorList, atkScaleFactorList) ||
                const DeepCollectionEquality()
                    .equals(other.atkScaleFactorList, atkScaleFactorList)) &&
            (identical(other.defScaleFactorList, defScaleFactorList) ||
                const DeepCollectionEquality()
                    .equals(other.defScaleFactorList, defScaleFactorList)) &&
            (identical(other.atkRank, atkRank) ||
                const DeepCollectionEquality()
                    .equals(other.atkRank, atkRank)) &&
            (identical(other.defRank, defRank) ||
                const DeepCollectionEquality()
                    .equals(other.defRank, defRank)) &&
            (identical(other.hp, hp) ||
                const DeepCollectionEquality().equals(other.hp, hp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showingDetail) ^
      const DeepCollectionEquality().hash(atk) ^
      const DeepCollectionEquality().hash(def) ^
      const DeepCollectionEquality().hash(power) ^
      const DeepCollectionEquality().hash(maxDamage) ^
      const DeepCollectionEquality().hash(minDamage) ^
      const DeepCollectionEquality().hash(atkScaleFactorList) ^
      const DeepCollectionEquality().hash(defScaleFactorList) ^
      const DeepCollectionEquality().hash(atkRank) ^
      const DeepCollectionEquality().hash(defRank) ^
      const DeepCollectionEquality().hash(hp);

  @JsonKey(ignore: true)
  @override
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      __$CalculatorStateCopyWithImpl<_CalculatorState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CalculatorStateToJson(this);
  }
}

abstract class _CalculatorState extends CalculatorState {
  const factory _CalculatorState(
      {bool showingDetail,
      required StatusParams atk,
      required StatusParams def,
      int power,
      int maxDamage,
      int minDamage,
      List<DamageScaleFactor> atkScaleFactorList,
      List<DamageScaleFactor> defScaleFactorList,
      required DamageScaleFactor atkRank,
      required DamageScaleFactor defRank,
      required StatusParams hp}) = _$_CalculatorState;
  const _CalculatorState._() : super._();

  factory _CalculatorState.fromJson(Map<String, dynamic> json) =
      _$_CalculatorState.fromJson;

  @override
  bool get showingDetail => throw _privateConstructorUsedError;
  @override
  StatusParams get atk => throw _privateConstructorUsedError;
  @override
  StatusParams get def => throw _privateConstructorUsedError;
  @override
  int get power => throw _privateConstructorUsedError;
  @override
  int get maxDamage => throw _privateConstructorUsedError;
  @override
  int get minDamage => throw _privateConstructorUsedError;
  @override
  List<DamageScaleFactor> get atkScaleFactorList =>
      throw _privateConstructorUsedError;
  @override
  List<DamageScaleFactor> get defScaleFactorList =>
      throw _privateConstructorUsedError;
  @override
  DamageScaleFactor get atkRank => throw _privateConstructorUsedError;
  @override
  DamageScaleFactor get defRank => throw _privateConstructorUsedError;
  @override
  StatusParams get hp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusParams _$StatusParamsFromJson(Map<String, dynamic> json) {
  return _StatusParams.fromJson(json);
}

/// @nodoc
class _$StatusParamsTearOff {
  const _$StatusParamsTearOff();

  _StatusParams call(
      {String name = '',
      int base = 100,
      int individual = 31,
      int effort = 0,
      double nature = 1.0}) {
    return _StatusParams(
      name: name,
      base: base,
      individual: individual,
      effort: effort,
      nature: nature,
    );
  }

  StatusParams fromJson(Map<String, Object> json) {
    return StatusParams.fromJson(json);
  }
}

/// @nodoc
const $StatusParams = _$StatusParamsTearOff();

/// @nodoc
mixin _$StatusParams {
  String get name => throw _privateConstructorUsedError;
  int get base => throw _privateConstructorUsedError;
  int get individual => throw _privateConstructorUsedError;
  int get effort => throw _privateConstructorUsedError;
  double get nature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusParamsCopyWith<StatusParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusParamsCopyWith<$Res> {
  factory $StatusParamsCopyWith(
          StatusParams value, $Res Function(StatusParams) then) =
      _$StatusParamsCopyWithImpl<$Res>;
  $Res call({String name, int base, int individual, int effort, double nature});
}

/// @nodoc
class _$StatusParamsCopyWithImpl<$Res> implements $StatusParamsCopyWith<$Res> {
  _$StatusParamsCopyWithImpl(this._value, this._then);

  final StatusParams _value;
  // ignore: unused_field
  final $Res Function(StatusParams) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? base = freezed,
    Object? individual = freezed,
    Object? effort = freezed,
    Object? nature = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as int,
      individual: individual == freezed
          ? _value.individual
          : individual // ignore: cast_nullable_to_non_nullable
              as int,
      effort: effort == freezed
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      nature: nature == freezed
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$StatusParamsCopyWith<$Res>
    implements $StatusParamsCopyWith<$Res> {
  factory _$StatusParamsCopyWith(
          _StatusParams value, $Res Function(_StatusParams) then) =
      __$StatusParamsCopyWithImpl<$Res>;
  @override
  $Res call({String name, int base, int individual, int effort, double nature});
}

/// @nodoc
class __$StatusParamsCopyWithImpl<$Res> extends _$StatusParamsCopyWithImpl<$Res>
    implements _$StatusParamsCopyWith<$Res> {
  __$StatusParamsCopyWithImpl(
      _StatusParams _value, $Res Function(_StatusParams) _then)
      : super(_value, (v) => _then(v as _StatusParams));

  @override
  _StatusParams get _value => super._value as _StatusParams;

  @override
  $Res call({
    Object? name = freezed,
    Object? base = freezed,
    Object? individual = freezed,
    Object? effort = freezed,
    Object? nature = freezed,
  }) {
    return _then(_StatusParams(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as int,
      individual: individual == freezed
          ? _value.individual
          : individual // ignore: cast_nullable_to_non_nullable
              as int,
      effort: effort == freezed
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      nature: nature == freezed
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StatusParams extends _StatusParams with DiagnosticableTreeMixin {
  const _$_StatusParams(
      {this.name = '',
      this.base = 100,
      this.individual = 31,
      this.effort = 0,
      this.nature = 1.0})
      : super._();

  factory _$_StatusParams.fromJson(Map<String, dynamic> json) =>
      _$_$_StatusParamsFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: 100)
  @override
  final int base;
  @JsonKey(defaultValue: 31)
  @override
  final int individual;
  @JsonKey(defaultValue: 0)
  @override
  final int effort;
  @JsonKey(defaultValue: 1.0)
  @override
  final double nature;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatusParams(name: $name, base: $base, individual: $individual, effort: $effort, nature: $nature)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatusParams'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('base', base))
      ..add(DiagnosticsProperty('individual', individual))
      ..add(DiagnosticsProperty('effort', effort))
      ..add(DiagnosticsProperty('nature', nature));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StatusParams &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.individual, individual) ||
                const DeepCollectionEquality()
                    .equals(other.individual, individual)) &&
            (identical(other.effort, effort) ||
                const DeepCollectionEquality().equals(other.effort, effort)) &&
            (identical(other.nature, nature) ||
                const DeepCollectionEquality().equals(other.nature, nature)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(individual) ^
      const DeepCollectionEquality().hash(effort) ^
      const DeepCollectionEquality().hash(nature);

  @JsonKey(ignore: true)
  @override
  _$StatusParamsCopyWith<_StatusParams> get copyWith =>
      __$StatusParamsCopyWithImpl<_StatusParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StatusParamsToJson(this);
  }
}

abstract class _StatusParams extends StatusParams {
  const factory _StatusParams(
      {String name,
      int base,
      int individual,
      int effort,
      double nature}) = _$_StatusParams;
  const _StatusParams._() : super._();

  factory _StatusParams.fromJson(Map<String, dynamic> json) =
      _$_StatusParams.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get base => throw _privateConstructorUsedError;
  @override
  int get individual => throw _privateConstructorUsedError;
  @override
  int get effort => throw _privateConstructorUsedError;
  @override
  double get nature => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatusParamsCopyWith<_StatusParams> get copyWith =>
      throw _privateConstructorUsedError;
}

DamageScaleFactor _$DamageScaleFactorFromJson(Map<String, dynamic> json) {
  return _DamageScaleFactor.fromJson(json);
}

/// @nodoc
class _$DamageScaleFactorTearOff {
  const _$DamageScaleFactorTearOff();

  _DamageScaleFactor call(String label, double scaleFactor,
      {bool isEnabled = false}) {
    return _DamageScaleFactor(
      label,
      scaleFactor,
      isEnabled: isEnabled,
    );
  }

  DamageScaleFactor fromJson(Map<String, Object> json) {
    return DamageScaleFactor.fromJson(json);
  }
}

/// @nodoc
const $DamageScaleFactor = _$DamageScaleFactorTearOff();

/// @nodoc
mixin _$DamageScaleFactor {
  String get label => throw _privateConstructorUsedError;
  double get scaleFactor => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DamageScaleFactorCopyWith<DamageScaleFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DamageScaleFactorCopyWith<$Res> {
  factory $DamageScaleFactorCopyWith(
          DamageScaleFactor value, $Res Function(DamageScaleFactor) then) =
      _$DamageScaleFactorCopyWithImpl<$Res>;
  $Res call({String label, double scaleFactor, bool isEnabled});
}

/// @nodoc
class _$DamageScaleFactorCopyWithImpl<$Res>
    implements $DamageScaleFactorCopyWith<$Res> {
  _$DamageScaleFactorCopyWithImpl(this._value, this._then);

  final DamageScaleFactor _value;
  // ignore: unused_field
  final $Res Function(DamageScaleFactor) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? scaleFactor = freezed,
    Object? isEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      scaleFactor: scaleFactor == freezed
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      isEnabled: isEnabled == freezed
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DamageScaleFactorCopyWith<$Res>
    implements $DamageScaleFactorCopyWith<$Res> {
  factory _$DamageScaleFactorCopyWith(
          _DamageScaleFactor value, $Res Function(_DamageScaleFactor) then) =
      __$DamageScaleFactorCopyWithImpl<$Res>;
  @override
  $Res call({String label, double scaleFactor, bool isEnabled});
}

/// @nodoc
class __$DamageScaleFactorCopyWithImpl<$Res>
    extends _$DamageScaleFactorCopyWithImpl<$Res>
    implements _$DamageScaleFactorCopyWith<$Res> {
  __$DamageScaleFactorCopyWithImpl(
      _DamageScaleFactor _value, $Res Function(_DamageScaleFactor) _then)
      : super(_value, (v) => _then(v as _DamageScaleFactor));

  @override
  _DamageScaleFactor get _value => super._value as _DamageScaleFactor;

  @override
  $Res call({
    Object? label = freezed,
    Object? scaleFactor = freezed,
    Object? isEnabled = freezed,
  }) {
    return _then(_DamageScaleFactor(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      scaleFactor == freezed
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      isEnabled: isEnabled == freezed
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DamageScaleFactor
    with DiagnosticableTreeMixin
    implements _DamageScaleFactor {
  const _$_DamageScaleFactor(this.label, this.scaleFactor,
      {this.isEnabled = false});

  factory _$_DamageScaleFactor.fromJson(Map<String, dynamic> json) =>
      _$_$_DamageScaleFactorFromJson(json);

  @override
  final String label;
  @override
  final double scaleFactor;
  @JsonKey(defaultValue: false)
  @override
  final bool isEnabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DamageScaleFactor(label: $label, scaleFactor: $scaleFactor, isEnabled: $isEnabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DamageScaleFactor'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('scaleFactor', scaleFactor))
      ..add(DiagnosticsProperty('isEnabled', isEnabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DamageScaleFactor &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.scaleFactor, scaleFactor) ||
                const DeepCollectionEquality()
                    .equals(other.scaleFactor, scaleFactor)) &&
            (identical(other.isEnabled, isEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isEnabled, isEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(scaleFactor) ^
      const DeepCollectionEquality().hash(isEnabled);

  @JsonKey(ignore: true)
  @override
  _$DamageScaleFactorCopyWith<_DamageScaleFactor> get copyWith =>
      __$DamageScaleFactorCopyWithImpl<_DamageScaleFactor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DamageScaleFactorToJson(this);
  }
}

abstract class _DamageScaleFactor implements DamageScaleFactor {
  const factory _DamageScaleFactor(String label, double scaleFactor,
      {bool isEnabled}) = _$_DamageScaleFactor;

  factory _DamageScaleFactor.fromJson(Map<String, dynamic> json) =
      _$_DamageScaleFactor.fromJson;

  @override
  String get label => throw _privateConstructorUsedError;
  @override
  double get scaleFactor => throw _privateConstructorUsedError;
  @override
  bool get isEnabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DamageScaleFactorCopyWith<_DamageScaleFactor> get copyWith =>
      throw _privateConstructorUsedError;
}
