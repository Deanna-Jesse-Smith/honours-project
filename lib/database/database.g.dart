// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
    'user_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isMetricMeta = const VerificationMeta(
    'isMetric',
  );
  @override
  late final GeneratedColumn<bool> isMetric = GeneratedColumn<bool>(
    'is_metric',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_metric" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _formIFMeta = const VerificationMeta('formIF');
  @override
  late final GeneratedColumn<String> formIF = GeneratedColumn<String>(
    'form_i_f',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _experienceMeta = const VerificationMeta(
    'experience',
  );
  @override
  late final GeneratedColumn<String> experience = GeneratedColumn<String>(
    'experience',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typicalEatingStartMeta =
      const VerificationMeta('typicalEatingStart');
  @override
  late final GeneratedColumn<DateTime> typicalEatingStart =
      GeneratedColumn<DateTime>(
        'typical_eating_start',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _typicalEatingEndMeta = const VerificationMeta(
    'typicalEatingEnd',
  );
  @override
  late final GeneratedColumn<DateTime> typicalEatingEnd =
      GeneratedColumn<DateTime>(
        'typical_eating_end',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdDateMeta = const VerificationMeta(
    'createdDate',
  );
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
    'created_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userID,
    name,
    isMetric,
    formIF,
    experience,
    typicalEatingStart,
    typicalEatingEnd,
    createdDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_i_d')) {
      context.handle(
        _userIDMeta,
        userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_metric')) {
      context.handle(
        _isMetricMeta,
        isMetric.isAcceptableOrUnknown(data['is_metric']!, _isMetricMeta),
      );
    }
    if (data.containsKey('form_i_f')) {
      context.handle(
        _formIFMeta,
        formIF.isAcceptableOrUnknown(data['form_i_f']!, _formIFMeta),
      );
    } else if (isInserting) {
      context.missing(_formIFMeta);
    }
    if (data.containsKey('experience')) {
      context.handle(
        _experienceMeta,
        experience.isAcceptableOrUnknown(data['experience']!, _experienceMeta),
      );
    } else if (isInserting) {
      context.missing(_experienceMeta);
    }
    if (data.containsKey('typical_eating_start')) {
      context.handle(
        _typicalEatingStartMeta,
        typicalEatingStart.isAcceptableOrUnknown(
          data['typical_eating_start']!,
          _typicalEatingStartMeta,
        ),
      );
    }
    if (data.containsKey('typical_eating_end')) {
      context.handle(
        _typicalEatingEndMeta,
        typicalEatingEnd.isAcceptableOrUnknown(
          data['typical_eating_end']!,
          _typicalEatingEndMeta,
        ),
      );
    }
    if (data.containsKey('created_date')) {
      context.handle(
        _createdDateMeta,
        createdDate.isAcceptableOrUnknown(
          data['created_date']!,
          _createdDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isMetric: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_metric'],
      )!,
      formIF: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}form_i_f'],
      )!,
      experience: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}experience'],
      )!,
      typicalEatingStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}typical_eating_start'],
      ),
      typicalEatingEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}typical_eating_end'],
      ),
      createdDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_date'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int userID;
  final String name;
  final bool isMetric;
  final String formIF;
  final String experience;
  final DateTime? typicalEatingStart;
  final DateTime? typicalEatingEnd;
  final DateTime createdDate;
  const User({
    required this.userID,
    required this.name,
    required this.isMetric,
    required this.formIF,
    required this.experience,
    this.typicalEatingStart,
    this.typicalEatingEnd,
    required this.createdDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_i_d'] = Variable<int>(userID);
    map['name'] = Variable<String>(name);
    map['is_metric'] = Variable<bool>(isMetric);
    map['form_i_f'] = Variable<String>(formIF);
    map['experience'] = Variable<String>(experience);
    if (!nullToAbsent || typicalEatingStart != null) {
      map['typical_eating_start'] = Variable<DateTime>(typicalEatingStart);
    }
    if (!nullToAbsent || typicalEatingEnd != null) {
      map['typical_eating_end'] = Variable<DateTime>(typicalEatingEnd);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userID: Value(userID),
      name: Value(name),
      isMetric: Value(isMetric),
      formIF: Value(formIF),
      experience: Value(experience),
      typicalEatingStart: typicalEatingStart == null && nullToAbsent
          ? const Value.absent()
          : Value(typicalEatingStart),
      typicalEatingEnd: typicalEatingEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(typicalEatingEnd),
      createdDate: Value(createdDate),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userID: serializer.fromJson<int>(json['userID']),
      name: serializer.fromJson<String>(json['name']),
      isMetric: serializer.fromJson<bool>(json['isMetric']),
      formIF: serializer.fromJson<String>(json['formIF']),
      experience: serializer.fromJson<String>(json['experience']),
      typicalEatingStart: serializer.fromJson<DateTime?>(
        json['typicalEatingStart'],
      ),
      typicalEatingEnd: serializer.fromJson<DateTime?>(
        json['typicalEatingEnd'],
      ),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<int>(userID),
      'name': serializer.toJson<String>(name),
      'isMetric': serializer.toJson<bool>(isMetric),
      'formIF': serializer.toJson<String>(formIF),
      'experience': serializer.toJson<String>(experience),
      'typicalEatingStart': serializer.toJson<DateTime?>(typicalEatingStart),
      'typicalEatingEnd': serializer.toJson<DateTime?>(typicalEatingEnd),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  User copyWith({
    int? userID,
    String? name,
    bool? isMetric,
    String? formIF,
    String? experience,
    Value<DateTime?> typicalEatingStart = const Value.absent(),
    Value<DateTime?> typicalEatingEnd = const Value.absent(),
    DateTime? createdDate,
  }) => User(
    userID: userID ?? this.userID,
    name: name ?? this.name,
    isMetric: isMetric ?? this.isMetric,
    formIF: formIF ?? this.formIF,
    experience: experience ?? this.experience,
    typicalEatingStart: typicalEatingStart.present
        ? typicalEatingStart.value
        : this.typicalEatingStart,
    typicalEatingEnd: typicalEatingEnd.present
        ? typicalEatingEnd.value
        : this.typicalEatingEnd,
    createdDate: createdDate ?? this.createdDate,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      userID: data.userID.present ? data.userID.value : this.userID,
      name: data.name.present ? data.name.value : this.name,
      isMetric: data.isMetric.present ? data.isMetric.value : this.isMetric,
      formIF: data.formIF.present ? data.formIF.value : this.formIF,
      experience: data.experience.present
          ? data.experience.value
          : this.experience,
      typicalEatingStart: data.typicalEatingStart.present
          ? data.typicalEatingStart.value
          : this.typicalEatingStart,
      typicalEatingEnd: data.typicalEatingEnd.present
          ? data.typicalEatingEnd.value
          : this.typicalEatingEnd,
      createdDate: data.createdDate.present
          ? data.createdDate.value
          : this.createdDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userID: $userID, ')
          ..write('name: $name, ')
          ..write('isMetric: $isMetric, ')
          ..write('formIF: $formIF, ')
          ..write('experience: $experience, ')
          ..write('typicalEatingStart: $typicalEatingStart, ')
          ..write('typicalEatingEnd: $typicalEatingEnd, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userID,
    name,
    isMetric,
    formIF,
    experience,
    typicalEatingStart,
    typicalEatingEnd,
    createdDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userID == this.userID &&
          other.name == this.name &&
          other.isMetric == this.isMetric &&
          other.formIF == this.formIF &&
          other.experience == this.experience &&
          other.typicalEatingStart == this.typicalEatingStart &&
          other.typicalEatingEnd == this.typicalEatingEnd &&
          other.createdDate == this.createdDate);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userID;
  final Value<String> name;
  final Value<bool> isMetric;
  final Value<String> formIF;
  final Value<String> experience;
  final Value<DateTime?> typicalEatingStart;
  final Value<DateTime?> typicalEatingEnd;
  final Value<DateTime> createdDate;
  const UsersCompanion({
    this.userID = const Value.absent(),
    this.name = const Value.absent(),
    this.isMetric = const Value.absent(),
    this.formIF = const Value.absent(),
    this.experience = const Value.absent(),
    this.typicalEatingStart = const Value.absent(),
    this.typicalEatingEnd = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userID = const Value.absent(),
    required String name,
    this.isMetric = const Value.absent(),
    required String formIF,
    required String experience,
    this.typicalEatingStart = const Value.absent(),
    this.typicalEatingEnd = const Value.absent(),
    this.createdDate = const Value.absent(),
  }) : name = Value(name),
       formIF = Value(formIF),
       experience = Value(experience);
  static Insertable<User> custom({
    Expression<int>? userID,
    Expression<String>? name,
    Expression<bool>? isMetric,
    Expression<String>? formIF,
    Expression<String>? experience,
    Expression<DateTime>? typicalEatingStart,
    Expression<DateTime>? typicalEatingEnd,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (userID != null) 'user_i_d': userID,
      if (name != null) 'name': name,
      if (isMetric != null) 'is_metric': isMetric,
      if (formIF != null) 'form_i_f': formIF,
      if (experience != null) 'experience': experience,
      if (typicalEatingStart != null)
        'typical_eating_start': typicalEatingStart,
      if (typicalEatingEnd != null) 'typical_eating_end': typicalEatingEnd,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  UsersCompanion copyWith({
    Value<int>? userID,
    Value<String>? name,
    Value<bool>? isMetric,
    Value<String>? formIF,
    Value<String>? experience,
    Value<DateTime?>? typicalEatingStart,
    Value<DateTime?>? typicalEatingEnd,
    Value<DateTime>? createdDate,
  }) {
    return UsersCompanion(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      isMetric: isMetric ?? this.isMetric,
      formIF: formIF ?? this.formIF,
      experience: experience ?? this.experience,
      typicalEatingStart: typicalEatingStart ?? this.typicalEatingStart,
      typicalEatingEnd: typicalEatingEnd ?? this.typicalEatingEnd,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isMetric.present) {
      map['is_metric'] = Variable<bool>(isMetric.value);
    }
    if (formIF.present) {
      map['form_i_f'] = Variable<String>(formIF.value);
    }
    if (experience.present) {
      map['experience'] = Variable<String>(experience.value);
    }
    if (typicalEatingStart.present) {
      map['typical_eating_start'] = Variable<DateTime>(
        typicalEatingStart.value,
      );
    }
    if (typicalEatingEnd.present) {
      map['typical_eating_end'] = Variable<DateTime>(typicalEatingEnd.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userID: $userID, ')
          ..write('name: $name, ')
          ..write('isMetric: $isMetric, ')
          ..write('formIF: $formIF, ')
          ..write('experience: $experience, ')
          ..write('typicalEatingStart: $typicalEatingStart, ')
          ..write('typicalEatingEnd: $typicalEatingEnd, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $FastLogTable extends FastLog with TableInfo<$FastLogTable, FastLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FastLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fastLogIDMeta = const VerificationMeta(
    'fastLogID',
  );
  @override
  late final GeneratedColumn<int> fastLogID = GeneratedColumn<int>(
    'fast_log_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
    'user_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_i_d)',
    ),
  );
  static const VerificationMeta _formIFMeta = const VerificationMeta('formIF');
  @override
  late final GeneratedColumn<String> formIF = GeneratedColumn<String>(
    'form_i_f',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateTimeMeta = const VerificationMeta(
    'startDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> startDateTime =
      GeneratedColumn<DateTime>(
        'start_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _endDateTimeMeta = const VerificationMeta(
    'endDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> endDateTime = GeneratedColumn<DateTime>(
    'end_date_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    fastLogID,
    userID,
    formIF,
    startDateTime,
    endDateTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fast_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<FastLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('fast_log_i_d')) {
      context.handle(
        _fastLogIDMeta,
        fastLogID.isAcceptableOrUnknown(data['fast_log_i_d']!, _fastLogIDMeta),
      );
    }
    if (data.containsKey('user_i_d')) {
      context.handle(
        _userIDMeta,
        userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta),
      );
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('form_i_f')) {
      context.handle(
        _formIFMeta,
        formIF.isAcceptableOrUnknown(data['form_i_f']!, _formIFMeta),
      );
    } else if (isInserting) {
      context.missing(_formIFMeta);
    }
    if (data.containsKey('start_date_time')) {
      context.handle(
        _startDateTimeMeta,
        startDateTime.isAcceptableOrUnknown(
          data['start_date_time']!,
          _startDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('end_date_time')) {
      context.handle(
        _endDateTimeMeta,
        endDateTime.isAcceptableOrUnknown(
          data['end_date_time']!,
          _endDateTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fastLogID};
  @override
  FastLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FastLogData(
      fastLogID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fast_log_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      formIF: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}form_i_f'],
      )!,
      startDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date_time'],
      )!,
      endDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date_time'],
      )!,
    );
  }

  @override
  $FastLogTable createAlias(String alias) {
    return $FastLogTable(attachedDatabase, alias);
  }
}

class FastLogData extends DataClass implements Insertable<FastLogData> {
  final int fastLogID;
  final int userID;
  final String formIF;
  final DateTime startDateTime;
  final DateTime endDateTime;
  const FastLogData({
    required this.fastLogID,
    required this.userID,
    required this.formIF,
    required this.startDateTime,
    required this.endDateTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['fast_log_i_d'] = Variable<int>(fastLogID);
    map['user_i_d'] = Variable<int>(userID);
    map['form_i_f'] = Variable<String>(formIF);
    map['start_date_time'] = Variable<DateTime>(startDateTime);
    map['end_date_time'] = Variable<DateTime>(endDateTime);
    return map;
  }

  FastLogCompanion toCompanion(bool nullToAbsent) {
    return FastLogCompanion(
      fastLogID: Value(fastLogID),
      userID: Value(userID),
      formIF: Value(formIF),
      startDateTime: Value(startDateTime),
      endDateTime: Value(endDateTime),
    );
  }

  factory FastLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FastLogData(
      fastLogID: serializer.fromJson<int>(json['fastLogID']),
      userID: serializer.fromJson<int>(json['userID']),
      formIF: serializer.fromJson<String>(json['formIF']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      endDateTime: serializer.fromJson<DateTime>(json['endDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fastLogID': serializer.toJson<int>(fastLogID),
      'userID': serializer.toJson<int>(userID),
      'formIF': serializer.toJson<String>(formIF),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'endDateTime': serializer.toJson<DateTime>(endDateTime),
    };
  }

  FastLogData copyWith({
    int? fastLogID,
    int? userID,
    String? formIF,
    DateTime? startDateTime,
    DateTime? endDateTime,
  }) => FastLogData(
    fastLogID: fastLogID ?? this.fastLogID,
    userID: userID ?? this.userID,
    formIF: formIF ?? this.formIF,
    startDateTime: startDateTime ?? this.startDateTime,
    endDateTime: endDateTime ?? this.endDateTime,
  );
  FastLogData copyWithCompanion(FastLogCompanion data) {
    return FastLogData(
      fastLogID: data.fastLogID.present ? data.fastLogID.value : this.fastLogID,
      userID: data.userID.present ? data.userID.value : this.userID,
      formIF: data.formIF.present ? data.formIF.value : this.formIF,
      startDateTime: data.startDateTime.present
          ? data.startDateTime.value
          : this.startDateTime,
      endDateTime: data.endDateTime.present
          ? data.endDateTime.value
          : this.endDateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FastLogData(')
          ..write('fastLogID: $fastLogID, ')
          ..write('userID: $userID, ')
          ..write('formIF: $formIF, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(fastLogID, userID, formIF, startDateTime, endDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FastLogData &&
          other.fastLogID == this.fastLogID &&
          other.userID == this.userID &&
          other.formIF == this.formIF &&
          other.startDateTime == this.startDateTime &&
          other.endDateTime == this.endDateTime);
}

class FastLogCompanion extends UpdateCompanion<FastLogData> {
  final Value<int> fastLogID;
  final Value<int> userID;
  final Value<String> formIF;
  final Value<DateTime> startDateTime;
  final Value<DateTime> endDateTime;
  const FastLogCompanion({
    this.fastLogID = const Value.absent(),
    this.userID = const Value.absent(),
    this.formIF = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  });
  FastLogCompanion.insert({
    this.fastLogID = const Value.absent(),
    required int userID,
    required String formIF,
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  }) : userID = Value(userID),
       formIF = Value(formIF);
  static Insertable<FastLogData> custom({
    Expression<int>? fastLogID,
    Expression<int>? userID,
    Expression<String>? formIF,
    Expression<DateTime>? startDateTime,
    Expression<DateTime>? endDateTime,
  }) {
    return RawValuesInsertable({
      if (fastLogID != null) 'fast_log_i_d': fastLogID,
      if (userID != null) 'user_i_d': userID,
      if (formIF != null) 'form_i_f': formIF,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (endDateTime != null) 'end_date_time': endDateTime,
    });
  }

  FastLogCompanion copyWith({
    Value<int>? fastLogID,
    Value<int>? userID,
    Value<String>? formIF,
    Value<DateTime>? startDateTime,
    Value<DateTime>? endDateTime,
  }) {
    return FastLogCompanion(
      fastLogID: fastLogID ?? this.fastLogID,
      userID: userID ?? this.userID,
      formIF: formIF ?? this.formIF,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fastLogID.present) {
      map['fast_log_i_d'] = Variable<int>(fastLogID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (formIF.present) {
      map['form_i_f'] = Variable<String>(formIF.value);
    }
    if (startDateTime.present) {
      map['start_date_time'] = Variable<DateTime>(startDateTime.value);
    }
    if (endDateTime.present) {
      map['end_date_time'] = Variable<DateTime>(endDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FastLogCompanion(')
          ..write('fastLogID: $fastLogID, ')
          ..write('userID: $userID, ')
          ..write('formIF: $formIF, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime')
          ..write(')'))
        .toString();
  }
}

class $HydrationLogTable extends HydrationLog
    with TableInfo<$HydrationLogTable, HydrationLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HydrationLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _hydrationLogIDMeta = const VerificationMeta(
    'hydrationLogID',
  );
  @override
  late final GeneratedColumn<int> hydrationLogID = GeneratedColumn<int>(
    'hydration_log_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
    'user_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_i_d)',
    ),
  );
  static const VerificationMeta _logDateTimeMeta = const VerificationMeta(
    'logDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> logDateTime = GeneratedColumn<DateTime>(
    'log_date_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    hydrationLogID,
    userID,
    logDateTime,
    amount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hydration_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<HydrationLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hydration_log_i_d')) {
      context.handle(
        _hydrationLogIDMeta,
        hydrationLogID.isAcceptableOrUnknown(
          data['hydration_log_i_d']!,
          _hydrationLogIDMeta,
        ),
      );
    }
    if (data.containsKey('user_i_d')) {
      context.handle(
        _userIDMeta,
        userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta),
      );
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('log_date_time')) {
      context.handle(
        _logDateTimeMeta,
        logDateTime.isAcceptableOrUnknown(
          data['log_date_time']!,
          _logDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hydrationLogID};
  @override
  HydrationLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HydrationLogData(
      hydrationLogID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hydration_log_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      logDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}log_date_time'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $HydrationLogTable createAlias(String alias) {
    return $HydrationLogTable(attachedDatabase, alias);
  }
}

class HydrationLogData extends DataClass
    implements Insertable<HydrationLogData> {
  final int hydrationLogID;
  final int userID;
  final DateTime logDateTime;
  final double amount;
  const HydrationLogData({
    required this.hydrationLogID,
    required this.userID,
    required this.logDateTime,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hydration_log_i_d'] = Variable<int>(hydrationLogID);
    map['user_i_d'] = Variable<int>(userID);
    map['log_date_time'] = Variable<DateTime>(logDateTime);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  HydrationLogCompanion toCompanion(bool nullToAbsent) {
    return HydrationLogCompanion(
      hydrationLogID: Value(hydrationLogID),
      userID: Value(userID),
      logDateTime: Value(logDateTime),
      amount: Value(amount),
    );
  }

  factory HydrationLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HydrationLogData(
      hydrationLogID: serializer.fromJson<int>(json['hydrationLogID']),
      userID: serializer.fromJson<int>(json['userID']),
      logDateTime: serializer.fromJson<DateTime>(json['logDateTime']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hydrationLogID': serializer.toJson<int>(hydrationLogID),
      'userID': serializer.toJson<int>(userID),
      'logDateTime': serializer.toJson<DateTime>(logDateTime),
      'amount': serializer.toJson<double>(amount),
    };
  }

  HydrationLogData copyWith({
    int? hydrationLogID,
    int? userID,
    DateTime? logDateTime,
    double? amount,
  }) => HydrationLogData(
    hydrationLogID: hydrationLogID ?? this.hydrationLogID,
    userID: userID ?? this.userID,
    logDateTime: logDateTime ?? this.logDateTime,
    amount: amount ?? this.amount,
  );
  HydrationLogData copyWithCompanion(HydrationLogCompanion data) {
    return HydrationLogData(
      hydrationLogID: data.hydrationLogID.present
          ? data.hydrationLogID.value
          : this.hydrationLogID,
      userID: data.userID.present ? data.userID.value : this.userID,
      logDateTime: data.logDateTime.present
          ? data.logDateTime.value
          : this.logDateTime,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HydrationLogData(')
          ..write('hydrationLogID: $hydrationLogID, ')
          ..write('userID: $userID, ')
          ..write('logDateTime: $logDateTime, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(hydrationLogID, userID, logDateTime, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HydrationLogData &&
          other.hydrationLogID == this.hydrationLogID &&
          other.userID == this.userID &&
          other.logDateTime == this.logDateTime &&
          other.amount == this.amount);
}

class HydrationLogCompanion extends UpdateCompanion<HydrationLogData> {
  final Value<int> hydrationLogID;
  final Value<int> userID;
  final Value<DateTime> logDateTime;
  final Value<double> amount;
  const HydrationLogCompanion({
    this.hydrationLogID = const Value.absent(),
    this.userID = const Value.absent(),
    this.logDateTime = const Value.absent(),
    this.amount = const Value.absent(),
  });
  HydrationLogCompanion.insert({
    this.hydrationLogID = const Value.absent(),
    required int userID,
    this.logDateTime = const Value.absent(),
    this.amount = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<HydrationLogData> custom({
    Expression<int>? hydrationLogID,
    Expression<int>? userID,
    Expression<DateTime>? logDateTime,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (hydrationLogID != null) 'hydration_log_i_d': hydrationLogID,
      if (userID != null) 'user_i_d': userID,
      if (logDateTime != null) 'log_date_time': logDateTime,
      if (amount != null) 'amount': amount,
    });
  }

  HydrationLogCompanion copyWith({
    Value<int>? hydrationLogID,
    Value<int>? userID,
    Value<DateTime>? logDateTime,
    Value<double>? amount,
  }) {
    return HydrationLogCompanion(
      hydrationLogID: hydrationLogID ?? this.hydrationLogID,
      userID: userID ?? this.userID,
      logDateTime: logDateTime ?? this.logDateTime,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hydrationLogID.present) {
      map['hydration_log_i_d'] = Variable<int>(hydrationLogID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (logDateTime.present) {
      map['log_date_time'] = Variable<DateTime>(logDateTime.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HydrationLogCompanion(')
          ..write('hydrationLogID: $hydrationLogID, ')
          ..write('userID: $userID, ')
          ..write('logDateTime: $logDateTime, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $WeightLogTable extends WeightLog
    with TableInfo<$WeightLogTable, WeightLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _weightLogIDMeta = const VerificationMeta(
    'weightLogID',
  );
  @override
  late final GeneratedColumn<int> weightLogID = GeneratedColumn<int>(
    'weight_log_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
    'user_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_i_d)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [weightLogID, userID, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeightLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('weight_log_i_d')) {
      context.handle(
        _weightLogIDMeta,
        weightLogID.isAcceptableOrUnknown(
          data['weight_log_i_d']!,
          _weightLogIDMeta,
        ),
      );
    }
    if (data.containsKey('user_i_d')) {
      context.handle(
        _userIDMeta,
        userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta),
      );
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {weightLogID};
  @override
  WeightLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightLogData(
      weightLogID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight_log_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $WeightLogTable createAlias(String alias) {
    return $WeightLogTable(attachedDatabase, alias);
  }
}

class WeightLogData extends DataClass implements Insertable<WeightLogData> {
  final int weightLogID;
  final int userID;
  final DateTime date;
  final double amount;
  const WeightLogData({
    required this.weightLogID,
    required this.userID,
    required this.date,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['weight_log_i_d'] = Variable<int>(weightLogID);
    map['user_i_d'] = Variable<int>(userID);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  WeightLogCompanion toCompanion(bool nullToAbsent) {
    return WeightLogCompanion(
      weightLogID: Value(weightLogID),
      userID: Value(userID),
      date: Value(date),
      amount: Value(amount),
    );
  }

  factory WeightLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightLogData(
      weightLogID: serializer.fromJson<int>(json['weightLogID']),
      userID: serializer.fromJson<int>(json['userID']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'weightLogID': serializer.toJson<int>(weightLogID),
      'userID': serializer.toJson<int>(userID),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
    };
  }

  WeightLogData copyWith({
    int? weightLogID,
    int? userID,
    DateTime? date,
    double? amount,
  }) => WeightLogData(
    weightLogID: weightLogID ?? this.weightLogID,
    userID: userID ?? this.userID,
    date: date ?? this.date,
    amount: amount ?? this.amount,
  );
  WeightLogData copyWithCompanion(WeightLogCompanion data) {
    return WeightLogData(
      weightLogID: data.weightLogID.present
          ? data.weightLogID.value
          : this.weightLogID,
      userID: data.userID.present ? data.userID.value : this.userID,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightLogData(')
          ..write('weightLogID: $weightLogID, ')
          ..write('userID: $userID, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(weightLogID, userID, date, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightLogData &&
          other.weightLogID == this.weightLogID &&
          other.userID == this.userID &&
          other.date == this.date &&
          other.amount == this.amount);
}

class WeightLogCompanion extends UpdateCompanion<WeightLogData> {
  final Value<int> weightLogID;
  final Value<int> userID;
  final Value<DateTime> date;
  final Value<double> amount;
  const WeightLogCompanion({
    this.weightLogID = const Value.absent(),
    this.userID = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
  });
  WeightLogCompanion.insert({
    this.weightLogID = const Value.absent(),
    required int userID,
    this.date = const Value.absent(),
    required double amount,
  }) : userID = Value(userID),
       amount = Value(amount);
  static Insertable<WeightLogData> custom({
    Expression<int>? weightLogID,
    Expression<int>? userID,
    Expression<DateTime>? date,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (weightLogID != null) 'weight_log_i_d': weightLogID,
      if (userID != null) 'user_i_d': userID,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
    });
  }

  WeightLogCompanion copyWith({
    Value<int>? weightLogID,
    Value<int>? userID,
    Value<DateTime>? date,
    Value<double>? amount,
  }) {
    return WeightLogCompanion(
      weightLogID: weightLogID ?? this.weightLogID,
      userID: userID ?? this.userID,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (weightLogID.present) {
      map['weight_log_i_d'] = Variable<int>(weightLogID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightLogCompanion(')
          ..write('weightLogID: $weightLogID, ')
          ..write('userID: $userID, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $FastLogTable fastLog = $FastLogTable(this);
  late final $HydrationLogTable hydrationLog = $HydrationLogTable(this);
  late final $WeightLogTable weightLog = $WeightLogTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final FastingDao fastingDao = FastingDao(this as AppDatabase);
  late final HydrationDao hydrationDao = HydrationDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    fastLog,
    hydrationLog,
    weightLog,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userID,
      required String name,
      Value<bool> isMetric,
      required String formIF,
      required String experience,
      Value<DateTime?> typicalEatingStart,
      Value<DateTime?> typicalEatingEnd,
      Value<DateTime> createdDate,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userID,
      Value<String> name,
      Value<bool> isMetric,
      Value<String> formIF,
      Value<String> experience,
      Value<DateTime?> typicalEatingStart,
      Value<DateTime?> typicalEatingEnd,
      Value<DateTime> createdDate,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FastLogTable, List<FastLogData>>
  _fastLogRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.fastLog,
    aliasName: 'users__user_i_d__fast_log__user_i_d',
  );

  $$FastLogTableProcessedTableManager get fastLogRefs {
    final manager = $$FastLogTableTableManager(
      $_db,
      $_db.fastLog,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_fastLogRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HydrationLogTable, List<HydrationLogData>>
  _hydrationLogRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hydrationLog,
    aliasName: 'users__user_i_d__hydration_log__user_i_d',
  );

  $$HydrationLogTableProcessedTableManager get hydrationLogRefs {
    final manager = $$HydrationLogTableTableManager(
      $_db,
      $_db.hydrationLog,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_hydrationLogRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WeightLogTable, List<WeightLogData>>
  _weightLogRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.weightLog,
    aliasName: 'users__user_i_d__weight_log__user_i_d',
  );

  $$WeightLogTableProcessedTableManager get weightLogRefs {
    final manager = $$WeightLogTableTableManager(
      $_db,
      $_db.weightLog,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_weightLogRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userID => $composableBuilder(
    column: $table.userID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMetric => $composableBuilder(
    column: $table.isMetric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formIF => $composableBuilder(
    column: $table.formIF,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get typicalEatingStart => $composableBuilder(
    column: $table.typicalEatingStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get typicalEatingEnd => $composableBuilder(
    column: $table.typicalEatingEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> fastLogRefs(
    Expression<bool> Function($$FastLogTableFilterComposer f) f,
  ) {
    final $$FastLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.fastLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FastLogTableFilterComposer(
            $db: $db,
            $table: $db.fastLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> hydrationLogRefs(
    Expression<bool> Function($$HydrationLogTableFilterComposer f) f,
  ) {
    final $$HydrationLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.hydrationLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HydrationLogTableFilterComposer(
            $db: $db,
            $table: $db.hydrationLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> weightLogRefs(
    Expression<bool> Function($$WeightLogTableFilterComposer f) f,
  ) {
    final $$WeightLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.weightLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeightLogTableFilterComposer(
            $db: $db,
            $table: $db.weightLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userID => $composableBuilder(
    column: $table.userID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMetric => $composableBuilder(
    column: $table.isMetric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formIF => $composableBuilder(
    column: $table.formIF,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get typicalEatingStart => $composableBuilder(
    column: $table.typicalEatingStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get typicalEatingEnd => $composableBuilder(
    column: $table.typicalEatingEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userID =>
      $composableBuilder(column: $table.userID, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isMetric =>
      $composableBuilder(column: $table.isMetric, builder: (column) => column);

  GeneratedColumn<String> get formIF =>
      $composableBuilder(column: $table.formIF, builder: (column) => column);

  GeneratedColumn<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get typicalEatingStart => $composableBuilder(
    column: $table.typicalEatingStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get typicalEatingEnd => $composableBuilder(
    column: $table.typicalEatingEnd,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => column,
  );

  Expression<T> fastLogRefs<T extends Object>(
    Expression<T> Function($$FastLogTableAnnotationComposer a) f,
  ) {
    final $$FastLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.fastLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FastLogTableAnnotationComposer(
            $db: $db,
            $table: $db.fastLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> hydrationLogRefs<T extends Object>(
    Expression<T> Function($$HydrationLogTableAnnotationComposer a) f,
  ) {
    final $$HydrationLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.hydrationLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HydrationLogTableAnnotationComposer(
            $db: $db,
            $table: $db.hydrationLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> weightLogRefs<T extends Object>(
    Expression<T> Function($$WeightLogTableAnnotationComposer a) f,
  ) {
    final $$WeightLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.weightLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeightLogTableAnnotationComposer(
            $db: $db,
            $table: $db.weightLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool fastLogRefs,
            bool hydrationLogRefs,
            bool weightLogRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userID = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isMetric = const Value.absent(),
                Value<String> formIF = const Value.absent(),
                Value<String> experience = const Value.absent(),
                Value<DateTime?> typicalEatingStart = const Value.absent(),
                Value<DateTime?> typicalEatingEnd = const Value.absent(),
                Value<DateTime> createdDate = const Value.absent(),
              }) => UsersCompanion(
                userID: userID,
                name: name,
                isMetric: isMetric,
                formIF: formIF,
                experience: experience,
                typicalEatingStart: typicalEatingStart,
                typicalEatingEnd: typicalEatingEnd,
                createdDate: createdDate,
              ),
          createCompanionCallback:
              ({
                Value<int> userID = const Value.absent(),
                required String name,
                Value<bool> isMetric = const Value.absent(),
                required String formIF,
                required String experience,
                Value<DateTime?> typicalEatingStart = const Value.absent(),
                Value<DateTime?> typicalEatingEnd = const Value.absent(),
                Value<DateTime> createdDate = const Value.absent(),
              }) => UsersCompanion.insert(
                userID: userID,
                name: name,
                isMetric: isMetric,
                formIF: formIF,
                experience: experience,
                typicalEatingStart: typicalEatingStart,
                typicalEatingEnd: typicalEatingEnd,
                createdDate: createdDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                fastLogRefs = false,
                hydrationLogRefs = false,
                weightLogRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fastLogRefs) db.fastLog,
                    if (hydrationLogRefs) db.hydrationLog,
                    if (weightLogRefs) db.weightLog,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (fastLogRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          FastLogData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._fastLogRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).fastLogRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userID == item.userID,
                              ),
                          typedResults: items,
                        ),
                      if (hydrationLogRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          HydrationLogData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._hydrationLogRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).hydrationLogRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userID == item.userID,
                              ),
                          typedResults: items,
                        ),
                      if (weightLogRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          WeightLogData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._weightLogRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).weightLogRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userID == item.userID,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool fastLogRefs,
        bool hydrationLogRefs,
        bool weightLogRefs,
      })
    >;
typedef $$FastLogTableCreateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      required int userID,
      required String formIF,
      Value<DateTime> startDateTime,
      Value<DateTime> endDateTime,
    });
typedef $$FastLogTableUpdateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      Value<int> userID,
      Value<String> formIF,
      Value<DateTime> startDateTime,
      Value<DateTime> endDateTime,
    });

final class $$FastLogTableReferences
    extends BaseReferences<_$AppDatabase, $FastLogTable, FastLogData> {
  $$FastLogTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('fast_log__user_i_d__users__user_i_d');

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FastLogTableFilterComposer
    extends Composer<_$AppDatabase, $FastLogTable> {
  $$FastLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get fastLogID => $composableBuilder(
    column: $table.fastLogID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formIF => $composableBuilder(
    column: $table.formIF,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FastLogTableOrderingComposer
    extends Composer<_$AppDatabase, $FastLogTable> {
  $$FastLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get fastLogID => $composableBuilder(
    column: $table.fastLogID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formIF => $composableBuilder(
    column: $table.formIF,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FastLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $FastLogTable> {
  $$FastLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get fastLogID =>
      $composableBuilder(column: $table.fastLogID, builder: (column) => column);

  GeneratedColumn<String> get formIF =>
      $composableBuilder(column: $table.formIF, builder: (column) => column);

  GeneratedColumn<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FastLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FastLogTable,
          FastLogData,
          $$FastLogTableFilterComposer,
          $$FastLogTableOrderingComposer,
          $$FastLogTableAnnotationComposer,
          $$FastLogTableCreateCompanionBuilder,
          $$FastLogTableUpdateCompanionBuilder,
          (FastLogData, $$FastLogTableReferences),
          FastLogData,
          PrefetchHooks Function({bool userID})
        > {
  $$FastLogTableTableManager(_$AppDatabase db, $FastLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FastLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FastLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FastLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> fastLogID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<String> formIF = const Value.absent(),
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime> endDateTime = const Value.absent(),
              }) => FastLogCompanion(
                fastLogID: fastLogID,
                userID: userID,
                formIF: formIF,
                startDateTime: startDateTime,
                endDateTime: endDateTime,
              ),
          createCompanionCallback:
              ({
                Value<int> fastLogID = const Value.absent(),
                required int userID,
                required String formIF,
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime> endDateTime = const Value.absent(),
              }) => FastLogCompanion.insert(
                fastLogID: fastLogID,
                userID: userID,
                formIF: formIF,
                startDateTime: startDateTime,
                endDateTime: endDateTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FastLogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userID,
                                referencedTable: $$FastLogTableReferences
                                    ._userIDTable(db),
                                referencedColumn: $$FastLogTableReferences
                                    ._userIDTable(db)
                                    .userID,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FastLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FastLogTable,
      FastLogData,
      $$FastLogTableFilterComposer,
      $$FastLogTableOrderingComposer,
      $$FastLogTableAnnotationComposer,
      $$FastLogTableCreateCompanionBuilder,
      $$FastLogTableUpdateCompanionBuilder,
      (FastLogData, $$FastLogTableReferences),
      FastLogData,
      PrefetchHooks Function({bool userID})
    >;
typedef $$HydrationLogTableCreateCompanionBuilder =
    HydrationLogCompanion Function({
      Value<int> hydrationLogID,
      required int userID,
      Value<DateTime> logDateTime,
      Value<double> amount,
    });
typedef $$HydrationLogTableUpdateCompanionBuilder =
    HydrationLogCompanion Function({
      Value<int> hydrationLogID,
      Value<int> userID,
      Value<DateTime> logDateTime,
      Value<double> amount,
    });

final class $$HydrationLogTableReferences
    extends
        BaseReferences<_$AppDatabase, $HydrationLogTable, HydrationLogData> {
  $$HydrationLogTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('hydration_log__user_i_d__users__user_i_d');

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HydrationLogTableFilterComposer
    extends Composer<_$AppDatabase, $HydrationLogTable> {
  $$HydrationLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get hydrationLogID => $composableBuilder(
    column: $table.hydrationLogID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get logDateTime => $composableBuilder(
    column: $table.logDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HydrationLogTableOrderingComposer
    extends Composer<_$AppDatabase, $HydrationLogTable> {
  $$HydrationLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get hydrationLogID => $composableBuilder(
    column: $table.hydrationLogID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get logDateTime => $composableBuilder(
    column: $table.logDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HydrationLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $HydrationLogTable> {
  $$HydrationLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get hydrationLogID => $composableBuilder(
    column: $table.hydrationLogID,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get logDateTime => $composableBuilder(
    column: $table.logDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HydrationLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HydrationLogTable,
          HydrationLogData,
          $$HydrationLogTableFilterComposer,
          $$HydrationLogTableOrderingComposer,
          $$HydrationLogTableAnnotationComposer,
          $$HydrationLogTableCreateCompanionBuilder,
          $$HydrationLogTableUpdateCompanionBuilder,
          (HydrationLogData, $$HydrationLogTableReferences),
          HydrationLogData,
          PrefetchHooks Function({bool userID})
        > {
  $$HydrationLogTableTableManager(_$AppDatabase db, $HydrationLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HydrationLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HydrationLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HydrationLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> hydrationLogID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<DateTime> logDateTime = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => HydrationLogCompanion(
                hydrationLogID: hydrationLogID,
                userID: userID,
                logDateTime: logDateTime,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> hydrationLogID = const Value.absent(),
                required int userID,
                Value<DateTime> logDateTime = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => HydrationLogCompanion.insert(
                hydrationLogID: hydrationLogID,
                userID: userID,
                logDateTime: logDateTime,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HydrationLogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userID,
                                referencedTable: $$HydrationLogTableReferences
                                    ._userIDTable(db),
                                referencedColumn: $$HydrationLogTableReferences
                                    ._userIDTable(db)
                                    .userID,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HydrationLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HydrationLogTable,
      HydrationLogData,
      $$HydrationLogTableFilterComposer,
      $$HydrationLogTableOrderingComposer,
      $$HydrationLogTableAnnotationComposer,
      $$HydrationLogTableCreateCompanionBuilder,
      $$HydrationLogTableUpdateCompanionBuilder,
      (HydrationLogData, $$HydrationLogTableReferences),
      HydrationLogData,
      PrefetchHooks Function({bool userID})
    >;
typedef $$WeightLogTableCreateCompanionBuilder =
    WeightLogCompanion Function({
      Value<int> weightLogID,
      required int userID,
      Value<DateTime> date,
      required double amount,
    });
typedef $$WeightLogTableUpdateCompanionBuilder =
    WeightLogCompanion Function({
      Value<int> weightLogID,
      Value<int> userID,
      Value<DateTime> date,
      Value<double> amount,
    });

final class $$WeightLogTableReferences
    extends BaseReferences<_$AppDatabase, $WeightLogTable, WeightLogData> {
  $$WeightLogTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('weight_log__user_i_d__users__user_i_d');

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeightLogTableFilterComposer
    extends Composer<_$AppDatabase, $WeightLogTable> {
  $$WeightLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get weightLogID => $composableBuilder(
    column: $table.weightLogID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeightLogTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightLogTable> {
  $$WeightLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get weightLogID => $composableBuilder(
    column: $table.weightLogID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeightLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightLogTable> {
  $$WeightLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get weightLogID => $composableBuilder(
    column: $table.weightLogID,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeightLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeightLogTable,
          WeightLogData,
          $$WeightLogTableFilterComposer,
          $$WeightLogTableOrderingComposer,
          $$WeightLogTableAnnotationComposer,
          $$WeightLogTableCreateCompanionBuilder,
          $$WeightLogTableUpdateCompanionBuilder,
          (WeightLogData, $$WeightLogTableReferences),
          WeightLogData,
          PrefetchHooks Function({bool userID})
        > {
  $$WeightLogTableTableManager(_$AppDatabase db, $WeightLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> weightLogID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => WeightLogCompanion(
                weightLogID: weightLogID,
                userID: userID,
                date: date,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> weightLogID = const Value.absent(),
                required int userID,
                Value<DateTime> date = const Value.absent(),
                required double amount,
              }) => WeightLogCompanion.insert(
                weightLogID: weightLogID,
                userID: userID,
                date: date,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeightLogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userID,
                                referencedTable: $$WeightLogTableReferences
                                    ._userIDTable(db),
                                referencedColumn: $$WeightLogTableReferences
                                    ._userIDTable(db)
                                    .userID,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WeightLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeightLogTable,
      WeightLogData,
      $$WeightLogTableFilterComposer,
      $$WeightLogTableOrderingComposer,
      $$WeightLogTableAnnotationComposer,
      $$WeightLogTableCreateCompanionBuilder,
      $$WeightLogTableUpdateCompanionBuilder,
      (WeightLogData, $$WeightLogTableReferences),
      WeightLogData,
      PrefetchHooks Function({bool userID})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$FastLogTableTableManager get fastLog =>
      $$FastLogTableTableManager(_db, _db.fastLog);
  $$HydrationLogTableTableManager get hydrationLog =>
      $$HydrationLogTableTableManager(_db, _db.hydrationLog);
  $$WeightLogTableTableManager get weightLog =>
      $$WeightLogTableTableManager(_db, _db.weightLog);
}
