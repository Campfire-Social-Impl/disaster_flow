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

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $FlowRawTable flowRaw = $FlowRawTable(this);
  late final $ActionRawTable actionRaw = $ActionRawTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [flowRaw, actionRaw];
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

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$FlowRawTableTableManager get flowRaw =>
      $$FlowRawTableTableManager(_db, _db.flowRaw);
  $$ActionRawTableTableManager get actionRaw =>
      $$ActionRawTableTableManager(_db, _db.actionRaw);
}
