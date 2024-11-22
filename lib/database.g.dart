// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FlowRawTable extends FlowRaw with TableInfo<$FlowRawTable, FlowRawData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlowRawTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _disasterMeta =
      const VerificationMeta('disaster');
  @override
  late final GeneratedColumn<String> disaster = GeneratedColumn<String>(
      'disaster', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, disaster];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flow_raw';
  @override
  VerificationContext validateIntegrity(Insertable<FlowRawData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('disaster')) {
      context.handle(_disasterMeta,
          disaster.isAcceptableOrUnknown(data['disaster']!, _disasterMeta));
    } else if (isInserting) {
      context.missing(_disasterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlowRawData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlowRawData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      disaster: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}disaster'])!,
    );
  }

  @override
  $FlowRawTable createAlias(String alias) {
    return $FlowRawTable(attachedDatabase, alias);
  }
}

class FlowRawData extends DataClass implements Insertable<FlowRawData> {
  final int id;
  final String title;
  final String disaster;
  const FlowRawData(
      {required this.id, required this.title, required this.disaster});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['disaster'] = Variable<String>(disaster);
    return map;
  }

  FlowRawCompanion toCompanion(bool nullToAbsent) {
    return FlowRawCompanion(
      id: Value(id),
      title: Value(title),
      disaster: Value(disaster),
    );
  }

  factory FlowRawData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlowRawData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      disaster: serializer.fromJson<String>(json['disaster']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'disaster': serializer.toJson<String>(disaster),
    };
  }

  FlowRawData copyWith({int? id, String? title, String? disaster}) =>
      FlowRawData(
        id: id ?? this.id,
        title: title ?? this.title,
        disaster: disaster ?? this.disaster,
      );
  FlowRawData copyWithCompanion(FlowRawCompanion data) {
    return FlowRawData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      disaster: data.disaster.present ? data.disaster.value : this.disaster,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlowRawData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('disaster: $disaster')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, disaster);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlowRawData &&
          other.id == this.id &&
          other.title == this.title &&
          other.disaster == this.disaster);
}

class FlowRawCompanion extends UpdateCompanion<FlowRawData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> disaster;
  const FlowRawCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.disaster = const Value.absent(),
  });
  FlowRawCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String disaster,
  })  : title = Value(title),
        disaster = Value(disaster);
  static Insertable<FlowRawData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? disaster,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (disaster != null) 'disaster': disaster,
    });
  }

  FlowRawCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? disaster}) {
    return FlowRawCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      disaster: disaster ?? this.disaster,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (disaster.present) {
      map['disaster'] = Variable<String>(disaster.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlowRawCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('disaster: $disaster')
          ..write(')'))
        .toString();
  }
}

class $ActionRawTable extends ActionRaw
    with TableInfo<$ActionRawTable, ActionRawData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionRawTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _flowIdMeta = const VerificationMeta('flowId');
  @override
  late final GeneratedColumn<int> flowId = GeneratedColumn<int>(
      'flow_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES flow_raw (id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, flowId, title, action, index];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_raw';
  @override
  VerificationContext validateIntegrity(Insertable<ActionRawData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('flow_id')) {
      context.handle(_flowIdMeta,
          flowId.isAcceptableOrUnknown(data['flow_id']!, _flowIdMeta));
    } else if (isInserting) {
      context.missing(_flowIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionRawData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionRawData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      flowId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}flow_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
    );
  }

  @override
  $ActionRawTable createAlias(String alias) {
    return $ActionRawTable(attachedDatabase, alias);
  }
}

class ActionRawData extends DataClass implements Insertable<ActionRawData> {
  final int id;
  final int flowId;
  final String title;
  final String action;
  final int index;
  const ActionRawData(
      {required this.id,
      required this.flowId,
      required this.title,
      required this.action,
      required this.index});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['flow_id'] = Variable<int>(flowId);
    map['title'] = Variable<String>(title);
    map['action'] = Variable<String>(action);
    map['index'] = Variable<int>(index);
    return map;
  }

  ActionRawCompanion toCompanion(bool nullToAbsent) {
    return ActionRawCompanion(
      id: Value(id),
      flowId: Value(flowId),
      title: Value(title),
      action: Value(action),
      index: Value(index),
    );
  }

  factory ActionRawData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionRawData(
      id: serializer.fromJson<int>(json['id']),
      flowId: serializer.fromJson<int>(json['flowId']),
      title: serializer.fromJson<String>(json['title']),
      action: serializer.fromJson<String>(json['action']),
      index: serializer.fromJson<int>(json['index']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'flowId': serializer.toJson<int>(flowId),
      'title': serializer.toJson<String>(title),
      'action': serializer.toJson<String>(action),
      'index': serializer.toJson<int>(index),
    };
  }

  ActionRawData copyWith(
          {int? id, int? flowId, String? title, String? action, int? index}) =>
      ActionRawData(
        id: id ?? this.id,
        flowId: flowId ?? this.flowId,
        title: title ?? this.title,
        action: action ?? this.action,
        index: index ?? this.index,
      );
  ActionRawData copyWithCompanion(ActionRawCompanion data) {
    return ActionRawData(
      id: data.id.present ? data.id.value : this.id,
      flowId: data.flowId.present ? data.flowId.value : this.flowId,
      title: data.title.present ? data.title.value : this.title,
      action: data.action.present ? data.action.value : this.action,
      index: data.index.present ? data.index.value : this.index,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionRawData(')
          ..write('id: $id, ')
          ..write('flowId: $flowId, ')
          ..write('title: $title, ')
          ..write('action: $action, ')
          ..write('index: $index')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, flowId, title, action, index);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionRawData &&
          other.id == this.id &&
          other.flowId == this.flowId &&
          other.title == this.title &&
          other.action == this.action &&
          other.index == this.index);
}

class ActionRawCompanion extends UpdateCompanion<ActionRawData> {
  final Value<int> id;
  final Value<int> flowId;
  final Value<String> title;
  final Value<String> action;
  final Value<int> index;
  const ActionRawCompanion({
    this.id = const Value.absent(),
    this.flowId = const Value.absent(),
    this.title = const Value.absent(),
    this.action = const Value.absent(),
    this.index = const Value.absent(),
  });
  ActionRawCompanion.insert({
    this.id = const Value.absent(),
    required int flowId,
    required String title,
    required String action,
    required int index,
  })  : flowId = Value(flowId),
        title = Value(title),
        action = Value(action),
        index = Value(index);
  static Insertable<ActionRawData> custom({
    Expression<int>? id,
    Expression<int>? flowId,
    Expression<String>? title,
    Expression<String>? action,
    Expression<int>? index,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (flowId != null) 'flow_id': flowId,
      if (title != null) 'title': title,
      if (action != null) 'action': action,
      if (index != null) 'index': index,
    });
  }

  ActionRawCompanion copyWith(
      {Value<int>? id,
      Value<int>? flowId,
      Value<String>? title,
      Value<String>? action,
      Value<int>? index}) {
    return ActionRawCompanion(
      id: id ?? this.id,
      flowId: flowId ?? this.flowId,
      title: title ?? this.title,
      action: action ?? this.action,
      index: index ?? this.index,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (flowId.present) {
      map['flow_id'] = Variable<int>(flowId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionRawCompanion(')
          ..write('id: $id, ')
          ..write('flowId: $flowId, ')
          ..write('title: $title, ')
          ..write('action: $action, ')
          ..write('index: $index')
          ..write(')'))
        .toString();
  }
}

class $NotifyRawTable extends NotifyRaw
    with TableInfo<$NotifyRawTable, NotifyRawData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotifyRawTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _disasterMeta =
      const VerificationMeta('disaster');
  @override
  late final GeneratedColumn<String> disaster = GeneratedColumn<String>(
      'disaster', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longituteMeta =
      const VerificationMeta('longitute');
  @override
  late final GeneratedColumn<double> longitute = GeneratedColumn<double>(
      'longitute', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _radiusMeta = const VerificationMeta('radius');
  @override
  late final GeneratedColumn<double> radius = GeneratedColumn<double>(
      'radius', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _addressedMeta =
      const VerificationMeta('addressed');
  @override
  late final GeneratedColumn<bool> addressed = GeneratedColumn<bool>(
      'addressed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("addressed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, disaster, description, longitute, latitude, radius, time, addressed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notify_raw';
  @override
  VerificationContext validateIntegrity(Insertable<NotifyRawData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('disaster')) {
      context.handle(_disasterMeta,
          disaster.isAcceptableOrUnknown(data['disaster']!, _disasterMeta));
    } else if (isInserting) {
      context.missing(_disasterMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('longitute')) {
      context.handle(_longituteMeta,
          longitute.isAcceptableOrUnknown(data['longitute']!, _longituteMeta));
    } else if (isInserting) {
      context.missing(_longituteMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('radius')) {
      context.handle(_radiusMeta,
          radius.isAcceptableOrUnknown(data['radius']!, _radiusMeta));
    } else if (isInserting) {
      context.missing(_radiusMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('addressed')) {
      context.handle(_addressedMeta,
          addressed.isAcceptableOrUnknown(data['addressed']!, _addressedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotifyRawData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotifyRawData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      disaster: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}disaster'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      longitute: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitute'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      radius: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}radius'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      addressed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}addressed'])!,
    );
  }

  @override
  $NotifyRawTable createAlias(String alias) {
    return $NotifyRawTable(attachedDatabase, alias);
  }
}

class NotifyRawData extends DataClass implements Insertable<NotifyRawData> {
  final int id;
  final String disaster;
  final String description;
  final double longitute;
  final double latitude;
  final double radius;
  final DateTime time;
  final bool addressed;
  const NotifyRawData(
      {required this.id,
      required this.disaster,
      required this.description,
      required this.longitute,
      required this.latitude,
      required this.radius,
      required this.time,
      required this.addressed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['disaster'] = Variable<String>(disaster);
    map['description'] = Variable<String>(description);
    map['longitute'] = Variable<double>(longitute);
    map['latitude'] = Variable<double>(latitude);
    map['radius'] = Variable<double>(radius);
    map['time'] = Variable<DateTime>(time);
    map['addressed'] = Variable<bool>(addressed);
    return map;
  }

  NotifyRawCompanion toCompanion(bool nullToAbsent) {
    return NotifyRawCompanion(
      id: Value(id),
      disaster: Value(disaster),
      description: Value(description),
      longitute: Value(longitute),
      latitude: Value(latitude),
      radius: Value(radius),
      time: Value(time),
      addressed: Value(addressed),
    );
  }

  factory NotifyRawData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotifyRawData(
      id: serializer.fromJson<int>(json['id']),
      disaster: serializer.fromJson<String>(json['disaster']),
      description: serializer.fromJson<String>(json['description']),
      longitute: serializer.fromJson<double>(json['longitute']),
      latitude: serializer.fromJson<double>(json['latitude']),
      radius: serializer.fromJson<double>(json['radius']),
      time: serializer.fromJson<DateTime>(json['time']),
      addressed: serializer.fromJson<bool>(json['addressed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'disaster': serializer.toJson<String>(disaster),
      'description': serializer.toJson<String>(description),
      'longitute': serializer.toJson<double>(longitute),
      'latitude': serializer.toJson<double>(latitude),
      'radius': serializer.toJson<double>(radius),
      'time': serializer.toJson<DateTime>(time),
      'addressed': serializer.toJson<bool>(addressed),
    };
  }

  NotifyRawData copyWith(
          {int? id,
          String? disaster,
          String? description,
          double? longitute,
          double? latitude,
          double? radius,
          DateTime? time,
          bool? addressed}) =>
      NotifyRawData(
        id: id ?? this.id,
        disaster: disaster ?? this.disaster,
        description: description ?? this.description,
        longitute: longitute ?? this.longitute,
        latitude: latitude ?? this.latitude,
        radius: radius ?? this.radius,
        time: time ?? this.time,
        addressed: addressed ?? this.addressed,
      );
  NotifyRawData copyWithCompanion(NotifyRawCompanion data) {
    return NotifyRawData(
      id: data.id.present ? data.id.value : this.id,
      disaster: data.disaster.present ? data.disaster.value : this.disaster,
      description:
          data.description.present ? data.description.value : this.description,
      longitute: data.longitute.present ? data.longitute.value : this.longitute,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      radius: data.radius.present ? data.radius.value : this.radius,
      time: data.time.present ? data.time.value : this.time,
      addressed: data.addressed.present ? data.addressed.value : this.addressed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotifyRawData(')
          ..write('id: $id, ')
          ..write('disaster: $disaster, ')
          ..write('description: $description, ')
          ..write('longitute: $longitute, ')
          ..write('latitude: $latitude, ')
          ..write('radius: $radius, ')
          ..write('time: $time, ')
          ..write('addressed: $addressed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, disaster, description, longitute, latitude, radius, time, addressed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotifyRawData &&
          other.id == this.id &&
          other.disaster == this.disaster &&
          other.description == this.description &&
          other.longitute == this.longitute &&
          other.latitude == this.latitude &&
          other.radius == this.radius &&
          other.time == this.time &&
          other.addressed == this.addressed);
}

class NotifyRawCompanion extends UpdateCompanion<NotifyRawData> {
  final Value<int> id;
  final Value<String> disaster;
  final Value<String> description;
  final Value<double> longitute;
  final Value<double> latitude;
  final Value<double> radius;
  final Value<DateTime> time;
  final Value<bool> addressed;
  const NotifyRawCompanion({
    this.id = const Value.absent(),
    this.disaster = const Value.absent(),
    this.description = const Value.absent(),
    this.longitute = const Value.absent(),
    this.latitude = const Value.absent(),
    this.radius = const Value.absent(),
    this.time = const Value.absent(),
    this.addressed = const Value.absent(),
  });
  NotifyRawCompanion.insert({
    this.id = const Value.absent(),
    required String disaster,
    required String description,
    required double longitute,
    required double latitude,
    required double radius,
    required DateTime time,
    this.addressed = const Value.absent(),
  })  : disaster = Value(disaster),
        description = Value(description),
        longitute = Value(longitute),
        latitude = Value(latitude),
        radius = Value(radius),
        time = Value(time);
  static Insertable<NotifyRawData> custom({
    Expression<int>? id,
    Expression<String>? disaster,
    Expression<String>? description,
    Expression<double>? longitute,
    Expression<double>? latitude,
    Expression<double>? radius,
    Expression<DateTime>? time,
    Expression<bool>? addressed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (disaster != null) 'disaster': disaster,
      if (description != null) 'description': description,
      if (longitute != null) 'longitute': longitute,
      if (latitude != null) 'latitude': latitude,
      if (radius != null) 'radius': radius,
      if (time != null) 'time': time,
      if (addressed != null) 'addressed': addressed,
    });
  }

  NotifyRawCompanion copyWith(
      {Value<int>? id,
      Value<String>? disaster,
      Value<String>? description,
      Value<double>? longitute,
      Value<double>? latitude,
      Value<double>? radius,
      Value<DateTime>? time,
      Value<bool>? addressed}) {
    return NotifyRawCompanion(
      id: id ?? this.id,
      disaster: disaster ?? this.disaster,
      description: description ?? this.description,
      longitute: longitute ?? this.longitute,
      latitude: latitude ?? this.latitude,
      radius: radius ?? this.radius,
      time: time ?? this.time,
      addressed: addressed ?? this.addressed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (disaster.present) {
      map['disaster'] = Variable<String>(disaster.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (longitute.present) {
      map['longitute'] = Variable<double>(longitute.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (radius.present) {
      map['radius'] = Variable<double>(radius.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (addressed.present) {
      map['addressed'] = Variable<bool>(addressed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotifyRawCompanion(')
          ..write('id: $id, ')
          ..write('disaster: $disaster, ')
          ..write('description: $description, ')
          ..write('longitute: $longitute, ')
          ..write('latitude: $latitude, ')
          ..write('radius: $radius, ')
          ..write('time: $time, ')
          ..write('addressed: $addressed')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $FlowRawTable flowRaw = $FlowRawTable(this);
  late final $ActionRawTable actionRaw = $ActionRawTable(this);
  late final $NotifyRawTable notifyRaw = $NotifyRawTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [flowRaw, actionRaw, notifyRaw];
}

typedef $$FlowRawTableCreateCompanionBuilder = FlowRawCompanion Function({
  Value<int> id,
  required String title,
  required String disaster,
});
typedef $$FlowRawTableUpdateCompanionBuilder = FlowRawCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> disaster,
});

final class $$FlowRawTableReferences
    extends BaseReferences<_$LocalDatabase, $FlowRawTable, FlowRawData> {
  $$FlowRawTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ActionRawTable, List<ActionRawData>>
      _actionRawRefsTable(_$LocalDatabase db) => MultiTypedResultKey.fromTable(
          db.actionRaw,
          aliasName: $_aliasNameGenerator(db.flowRaw.id, db.actionRaw.flowId));

  $$ActionRawTableProcessedTableManager get actionRawRefs {
    final manager = $$ActionRawTableTableManager($_db, $_db.actionRaw)
        .filter((f) => f.flowId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_actionRawRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FlowRawTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $FlowRawTable> {
  $$FlowRawTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get disaster => $state.composableBuilder(
      column: $state.table.disaster,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter actionRawRefs(
      ComposableFilter Function($$ActionRawTableFilterComposer f) f) {
    final $$ActionRawTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.actionRaw,
        getReferencedColumn: (t) => t.flowId,
        builder: (joinBuilder, parentComposers) =>
            $$ActionRawTableFilterComposer(ComposerState(
                $state.db, $state.db.actionRaw, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$FlowRawTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $FlowRawTable> {
  $$FlowRawTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get disaster => $state.composableBuilder(
      column: $state.table.disaster,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$FlowRawTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $FlowRawTable,
    FlowRawData,
    $$FlowRawTableFilterComposer,
    $$FlowRawTableOrderingComposer,
    $$FlowRawTableCreateCompanionBuilder,
    $$FlowRawTableUpdateCompanionBuilder,
    (FlowRawData, $$FlowRawTableReferences),
    FlowRawData,
    PrefetchHooks Function({bool actionRawRefs})> {
  $$FlowRawTableTableManager(_$LocalDatabase db, $FlowRawTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FlowRawTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FlowRawTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> disaster = const Value.absent(),
          }) =>
              FlowRawCompanion(
            id: id,
            title: title,
            disaster: disaster,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String disaster,
          }) =>
              FlowRawCompanion.insert(
            id: id,
            title: title,
            disaster: disaster,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$FlowRawTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({actionRawRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (actionRawRefs) db.actionRaw],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (actionRawRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$FlowRawTableReferences._actionRawRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FlowRawTableReferences(db, table, p0)
                                .actionRawRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.flowId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FlowRawTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $FlowRawTable,
    FlowRawData,
    $$FlowRawTableFilterComposer,
    $$FlowRawTableOrderingComposer,
    $$FlowRawTableCreateCompanionBuilder,
    $$FlowRawTableUpdateCompanionBuilder,
    (FlowRawData, $$FlowRawTableReferences),
    FlowRawData,
    PrefetchHooks Function({bool actionRawRefs})>;
typedef $$ActionRawTableCreateCompanionBuilder = ActionRawCompanion Function({
  Value<int> id,
  required int flowId,
  required String title,
  required String action,
  required int index,
});
typedef $$ActionRawTableUpdateCompanionBuilder = ActionRawCompanion Function({
  Value<int> id,
  Value<int> flowId,
  Value<String> title,
  Value<String> action,
  Value<int> index,
});

final class $$ActionRawTableReferences
    extends BaseReferences<_$LocalDatabase, $ActionRawTable, ActionRawData> {
  $$ActionRawTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FlowRawTable _flowIdTable(_$LocalDatabase db) => db.flowRaw
      .createAlias($_aliasNameGenerator(db.actionRaw.flowId, db.flowRaw.id));

  $$FlowRawTableProcessedTableManager? get flowId {
    if ($_item.flowId == null) return null;
    final manager = $$FlowRawTableTableManager($_db, $_db.flowRaw)
        .filter((f) => f.id($_item.flowId!));
    final item = $_typedResult.readTableOrNull(_flowIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ActionRawTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $ActionRawTable> {
  $$ActionRawTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get action => $state.composableBuilder(
      column: $state.table.action,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$FlowRawTableFilterComposer get flowId {
    final $$FlowRawTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.flowId,
        referencedTable: $state.db.flowRaw,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$FlowRawTableFilterComposer(
            ComposerState(
                $state.db, $state.db.flowRaw, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ActionRawTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $ActionRawTable> {
  $$ActionRawTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get action => $state.composableBuilder(
      column: $state.table.action,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$FlowRawTableOrderingComposer get flowId {
    final $$FlowRawTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.flowId,
        referencedTable: $state.db.flowRaw,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$FlowRawTableOrderingComposer(ComposerState(
                $state.db, $state.db.flowRaw, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ActionRawTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ActionRawTable,
    ActionRawData,
    $$ActionRawTableFilterComposer,
    $$ActionRawTableOrderingComposer,
    $$ActionRawTableCreateCompanionBuilder,
    $$ActionRawTableUpdateCompanionBuilder,
    (ActionRawData, $$ActionRawTableReferences),
    ActionRawData,
    PrefetchHooks Function({bool flowId})> {
  $$ActionRawTableTableManager(_$LocalDatabase db, $ActionRawTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ActionRawTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ActionRawTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> flowId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<int> index = const Value.absent(),
          }) =>
              ActionRawCompanion(
            id: id,
            flowId: flowId,
            title: title,
            action: action,
            index: index,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int flowId,
            required String title,
            required String action,
            required int index,
          }) =>
              ActionRawCompanion.insert(
            id: id,
            flowId: flowId,
            title: title,
            action: action,
            index: index,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ActionRawTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({flowId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (flowId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.flowId,
                    referencedTable:
                        $$ActionRawTableReferences._flowIdTable(db),
                    referencedColumn:
                        $$ActionRawTableReferences._flowIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ActionRawTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $ActionRawTable,
    ActionRawData,
    $$ActionRawTableFilterComposer,
    $$ActionRawTableOrderingComposer,
    $$ActionRawTableCreateCompanionBuilder,
    $$ActionRawTableUpdateCompanionBuilder,
    (ActionRawData, $$ActionRawTableReferences),
    ActionRawData,
    PrefetchHooks Function({bool flowId})>;
typedef $$NotifyRawTableCreateCompanionBuilder = NotifyRawCompanion Function({
  Value<int> id,
  required String disaster,
  required String description,
  required double longitute,
  required double latitude,
  required double radius,
  required DateTime time,
  Value<bool> addressed,
});
typedef $$NotifyRawTableUpdateCompanionBuilder = NotifyRawCompanion Function({
  Value<int> id,
  Value<String> disaster,
  Value<String> description,
  Value<double> longitute,
  Value<double> latitude,
  Value<double> radius,
  Value<DateTime> time,
  Value<bool> addressed,
});

class $$NotifyRawTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $NotifyRawTable> {
  $$NotifyRawTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get disaster => $state.composableBuilder(
      column: $state.table.disaster,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get longitute => $state.composableBuilder(
      column: $state.table.longitute,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get radius => $state.composableBuilder(
      column: $state.table.radius,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get addressed => $state.composableBuilder(
      column: $state.table.addressed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NotifyRawTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $NotifyRawTable> {
  $$NotifyRawTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get disaster => $state.composableBuilder(
      column: $state.table.disaster,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get longitute => $state.composableBuilder(
      column: $state.table.longitute,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get radius => $state.composableBuilder(
      column: $state.table.radius,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get addressed => $state.composableBuilder(
      column: $state.table.addressed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$NotifyRawTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $NotifyRawTable,
    NotifyRawData,
    $$NotifyRawTableFilterComposer,
    $$NotifyRawTableOrderingComposer,
    $$NotifyRawTableCreateCompanionBuilder,
    $$NotifyRawTableUpdateCompanionBuilder,
    (
      NotifyRawData,
      BaseReferences<_$LocalDatabase, $NotifyRawTable, NotifyRawData>
    ),
    NotifyRawData,
    PrefetchHooks Function()> {
  $$NotifyRawTableTableManager(_$LocalDatabase db, $NotifyRawTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotifyRawTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NotifyRawTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> disaster = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> longitute = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> radius = const Value.absent(),
            Value<DateTime> time = const Value.absent(),
            Value<bool> addressed = const Value.absent(),
          }) =>
              NotifyRawCompanion(
            id: id,
            disaster: disaster,
            description: description,
            longitute: longitute,
            latitude: latitude,
            radius: radius,
            time: time,
            addressed: addressed,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String disaster,
            required String description,
            required double longitute,
            required double latitude,
            required double radius,
            required DateTime time,
            Value<bool> addressed = const Value.absent(),
          }) =>
              NotifyRawCompanion.insert(
            id: id,
            disaster: disaster,
            description: description,
            longitute: longitute,
            latitude: latitude,
            radius: radius,
            time: time,
            addressed: addressed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotifyRawTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $NotifyRawTable,
    NotifyRawData,
    $$NotifyRawTableFilterComposer,
    $$NotifyRawTableOrderingComposer,
    $$NotifyRawTableCreateCompanionBuilder,
    $$NotifyRawTableUpdateCompanionBuilder,
    (
      NotifyRawData,
      BaseReferences<_$LocalDatabase, $NotifyRawTable, NotifyRawData>
    ),
    NotifyRawData,
    PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$FlowRawTableTableManager get flowRaw =>
      $$FlowRawTableTableManager(_db, _db.flowRaw);
  $$ActionRawTableTableManager get actionRaw =>
      $$ActionRawTableTableManager(_db, _db.actionRaw);
  $$NotifyRawTableTableManager get notifyRaw =>
      $$NotifyRawTableTableManager(_db, _db.notifyRaw);
}
