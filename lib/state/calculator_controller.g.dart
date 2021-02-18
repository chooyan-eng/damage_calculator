// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalculatorState _$_$_CalculatorStateFromJson(Map<String, dynamic> json) {
  return _$_CalculatorState(
    showingDetail: json['showingDetail'] as bool ?? true,
    atk: json['atk'] == null
        ? null
        : StatusParams.fromJson(json['atk'] as Map<String, dynamic>),
    def: json['def'] == null
        ? null
        : StatusParams.fromJson(json['def'] as Map<String, dynamic>),
    power: json['power'] as int ?? 100,
    maxDamage: json['maxDamage'] as int ?? 0,
    minDamage: json['minDamage'] as int ?? 0,
    atkScaleFactorList: (json['atkScaleFactorList'] as List)
            ?.map((e) => e == null
                ? null
                : DamageScaleFactor.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    defScaleFactorList: (json['defScaleFactorList'] as List)
            ?.map((e) => e == null
                ? null
                : DamageScaleFactor.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    atkRank: json['atkRank'] == null
        ? null
        : DamageScaleFactor.fromJson(json['atkRank'] as Map<String, dynamic>),
    defRank: json['defRank'] == null
        ? null
        : DamageScaleFactor.fromJson(json['defRank'] as Map<String, dynamic>),
    hp: json['hp'] == null
        ? null
        : StatusParams.fromJson(json['hp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CalculatorStateToJson(_$_CalculatorState instance) =>
    <String, dynamic>{
      'showingDetail': instance.showingDetail,
      'atk': instance.atk?.toJson(),
      'def': instance.def?.toJson(),
      'power': instance.power,
      'maxDamage': instance.maxDamage,
      'minDamage': instance.minDamage,
      'atkScaleFactorList':
          instance.atkScaleFactorList?.map((e) => e?.toJson())?.toList(),
      'defScaleFactorList':
          instance.defScaleFactorList?.map((e) => e?.toJson())?.toList(),
      'atkRank': instance.atkRank?.toJson(),
      'defRank': instance.defRank?.toJson(),
      'hp': instance.hp?.toJson(),
    };

_$_StatusParams _$_$_StatusParamsFromJson(Map<String, dynamic> json) {
  return _$_StatusParams(
    name: json['name'] as String ?? '',
    base: json['base'] as int ?? 100,
    individual: json['individual'] as int ?? 31,
    effort: json['effort'] as int ?? 0,
    nature: (json['nature'] as num)?.toDouble() ?? 1.0,
  );
}

Map<String, dynamic> _$_$_StatusParamsToJson(_$_StatusParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'base': instance.base,
      'individual': instance.individual,
      'effort': instance.effort,
      'nature': instance.nature,
    };

_$_DamageScaleFactor _$_$_DamageScaleFactorFromJson(Map<String, dynamic> json) {
  return _$_DamageScaleFactor(
    json['label'] as String,
    (json['scaleFactor'] as num)?.toDouble(),
    isEnabled: json['isEnabled'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_DamageScaleFactorToJson(
        _$_DamageScaleFactor instance) =>
    <String, dynamic>{
      'label': instance.label,
      'scaleFactor': instance.scaleFactor,
      'isEnabled': instance.isEnabled,
    };
