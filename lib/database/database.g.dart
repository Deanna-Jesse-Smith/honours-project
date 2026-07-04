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
    requiredDuringInsert: false,
    defaultValue: const Constant('TRE'),
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
    requiredDuringInsert: false,
    defaultValue: const Constant('Beginner'),
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
  static const VerificationMeta _adfDaysSelectedMeta = const VerificationMeta(
    'adfDaysSelected',
  );
  @override
  late final GeneratedColumn<String> adfDaysSelected = GeneratedColumn<String>(
    'adf_days_selected',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _fiveTwoDaysSelectedMeta =
      const VerificationMeta('fiveTwoDaysSelected');
  @override
  late final GeneratedColumn<String> fiveTwoDaysSelected =
      GeneratedColumn<String>(
        'five_two_days_selected',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
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
    adfDaysSelected,
    fiveTwoDaysSelected,
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
    }
    if (data.containsKey('experience')) {
      context.handle(
        _experienceMeta,
        experience.isAcceptableOrUnknown(data['experience']!, _experienceMeta),
      );
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
    if (data.containsKey('adf_days_selected')) {
      context.handle(
        _adfDaysSelectedMeta,
        adfDaysSelected.isAcceptableOrUnknown(
          data['adf_days_selected']!,
          _adfDaysSelectedMeta,
        ),
      );
    }
    if (data.containsKey('five_two_days_selected')) {
      context.handle(
        _fiveTwoDaysSelectedMeta,
        fiveTwoDaysSelected.isAcceptableOrUnknown(
          data['five_two_days_selected']!,
          _fiveTwoDaysSelectedMeta,
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
      adfDaysSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adf_days_selected'],
      )!,
      fiveTwoDaysSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}five_two_days_selected'],
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
  final String adfDaysSelected;
  final String fiveTwoDaysSelected;
  const User({
    required this.userID,
    required this.name,
    required this.isMetric,
    required this.formIF,
    required this.experience,
    this.typicalEatingStart,
    this.typicalEatingEnd,
    required this.createdDate,
    required this.adfDaysSelected,
    required this.fiveTwoDaysSelected,
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
    map['adf_days_selected'] = Variable<String>(adfDaysSelected);
    map['five_two_days_selected'] = Variable<String>(fiveTwoDaysSelected);
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
      adfDaysSelected: Value(adfDaysSelected),
      fiveTwoDaysSelected: Value(fiveTwoDaysSelected),
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
      adfDaysSelected: serializer.fromJson<String>(json['adfDaysSelected']),
      fiveTwoDaysSelected: serializer.fromJson<String>(
        json['fiveTwoDaysSelected'],
      ),
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
      'adfDaysSelected': serializer.toJson<String>(adfDaysSelected),
      'fiveTwoDaysSelected': serializer.toJson<String>(fiveTwoDaysSelected),
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
    String? adfDaysSelected,
    String? fiveTwoDaysSelected,
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
    adfDaysSelected: adfDaysSelected ?? this.adfDaysSelected,
    fiveTwoDaysSelected: fiveTwoDaysSelected ?? this.fiveTwoDaysSelected,
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
      adfDaysSelected: data.adfDaysSelected.present
          ? data.adfDaysSelected.value
          : this.adfDaysSelected,
      fiveTwoDaysSelected: data.fiveTwoDaysSelected.present
          ? data.fiveTwoDaysSelected.value
          : this.fiveTwoDaysSelected,
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
          ..write('createdDate: $createdDate, ')
          ..write('adfDaysSelected: $adfDaysSelected, ')
          ..write('fiveTwoDaysSelected: $fiveTwoDaysSelected')
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
    adfDaysSelected,
    fiveTwoDaysSelected,
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
          other.createdDate == this.createdDate &&
          other.adfDaysSelected == this.adfDaysSelected &&
          other.fiveTwoDaysSelected == this.fiveTwoDaysSelected);
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
  final Value<String> adfDaysSelected;
  final Value<String> fiveTwoDaysSelected;
  const UsersCompanion({
    this.userID = const Value.absent(),
    this.name = const Value.absent(),
    this.isMetric = const Value.absent(),
    this.formIF = const Value.absent(),
    this.experience = const Value.absent(),
    this.typicalEatingStart = const Value.absent(),
    this.typicalEatingEnd = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.adfDaysSelected = const Value.absent(),
    this.fiveTwoDaysSelected = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userID = const Value.absent(),
    required String name,
    this.isMetric = const Value.absent(),
    this.formIF = const Value.absent(),
    this.experience = const Value.absent(),
    this.typicalEatingStart = const Value.absent(),
    this.typicalEatingEnd = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.adfDaysSelected = const Value.absent(),
    this.fiveTwoDaysSelected = const Value.absent(),
  }) : name = Value(name);
  static Insertable<User> custom({
    Expression<int>? userID,
    Expression<String>? name,
    Expression<bool>? isMetric,
    Expression<String>? formIF,
    Expression<String>? experience,
    Expression<DateTime>? typicalEatingStart,
    Expression<DateTime>? typicalEatingEnd,
    Expression<DateTime>? createdDate,
    Expression<String>? adfDaysSelected,
    Expression<String>? fiveTwoDaysSelected,
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
      if (adfDaysSelected != null) 'adf_days_selected': adfDaysSelected,
      if (fiveTwoDaysSelected != null)
        'five_two_days_selected': fiveTwoDaysSelected,
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
    Value<String>? adfDaysSelected,
    Value<String>? fiveTwoDaysSelected,
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
      adfDaysSelected: adfDaysSelected ?? this.adfDaysSelected,
      fiveTwoDaysSelected: fiveTwoDaysSelected ?? this.fiveTwoDaysSelected,
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
    if (adfDaysSelected.present) {
      map['adf_days_selected'] = Variable<String>(adfDaysSelected.value);
    }
    if (fiveTwoDaysSelected.present) {
      map['five_two_days_selected'] = Variable<String>(
        fiveTwoDaysSelected.value,
      );
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
          ..write('createdDate: $createdDate, ')
          ..write('adfDaysSelected: $adfDaysSelected, ')
          ..write('fiveTwoDaysSelected: $fiveTwoDaysSelected')
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
    requiredDuringInsert: false,
    defaultValue: const Constant('TRE'),
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
    this.formIF = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  }) : userID = Value(userID);
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
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    this.amount = const Value.absent(),
  }) : userID = Value(userID);
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

class $FoodTable extends Food with TableInfo<$FoodTable, FoodData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _foodIDMeta = const VerificationMeta('foodID');
  @override
  late final GeneratedColumn<int> foodID = GeneratedColumn<int>(
    'food_i_d',
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
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fibreMeta = const VerificationMeta('fibre');
  @override
  late final GeneratedColumn<double> fibre = GeneratedColumn<double>(
    'fibre',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    foodID,
    userID,
    carbs,
    fat,
    protein,
    fibre,
    calories,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('food_i_d')) {
      context.handle(
        _foodIDMeta,
        foodID.isAcceptableOrUnknown(data['food_i_d']!, _foodIDMeta),
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
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('fibre')) {
      context.handle(
        _fibreMeta,
        fibre.isAcceptableOrUnknown(data['fibre']!, _fibreMeta),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {foodID};
  @override
  FoodData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodData(
      foodID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}food_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      )!,
      fibre: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fibre'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      )!,
    );
  }

  @override
  $FoodTable createAlias(String alias) {
    return $FoodTable(attachedDatabase, alias);
  }
}

class FoodData extends DataClass implements Insertable<FoodData> {
  final int foodID;
  final int userID;
  final double carbs;
  final double fat;
  final double protein;
  final double fibre;
  final double calories;
  const FoodData({
    required this.foodID,
    required this.userID,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.fibre,
    required this.calories,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['food_i_d'] = Variable<int>(foodID);
    map['user_i_d'] = Variable<int>(userID);
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    map['protein'] = Variable<double>(protein);
    map['fibre'] = Variable<double>(fibre);
    map['calories'] = Variable<double>(calories);
    return map;
  }

  FoodCompanion toCompanion(bool nullToAbsent) {
    return FoodCompanion(
      foodID: Value(foodID),
      userID: Value(userID),
      carbs: Value(carbs),
      fat: Value(fat),
      protein: Value(protein),
      fibre: Value(fibre),
      calories: Value(calories),
    );
  }

  factory FoodData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodData(
      foodID: serializer.fromJson<int>(json['foodID']),
      userID: serializer.fromJson<int>(json['userID']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fat: serializer.fromJson<double>(json['fat']),
      protein: serializer.fromJson<double>(json['protein']),
      fibre: serializer.fromJson<double>(json['fibre']),
      calories: serializer.fromJson<double>(json['calories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'foodID': serializer.toJson<int>(foodID),
      'userID': serializer.toJson<int>(userID),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'protein': serializer.toJson<double>(protein),
      'fibre': serializer.toJson<double>(fibre),
      'calories': serializer.toJson<double>(calories),
    };
  }

  FoodData copyWith({
    int? foodID,
    int? userID,
    double? carbs,
    double? fat,
    double? protein,
    double? fibre,
    double? calories,
  }) => FoodData(
    foodID: foodID ?? this.foodID,
    userID: userID ?? this.userID,
    carbs: carbs ?? this.carbs,
    fat: fat ?? this.fat,
    protein: protein ?? this.protein,
    fibre: fibre ?? this.fibre,
    calories: calories ?? this.calories,
  );
  FoodData copyWithCompanion(FoodCompanion data) {
    return FoodData(
      foodID: data.foodID.present ? data.foodID.value : this.foodID,
      userID: data.userID.present ? data.userID.value : this.userID,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
      protein: data.protein.present ? data.protein.value : this.protein,
      fibre: data.fibre.present ? data.fibre.value : this.fibre,
      calories: data.calories.present ? data.calories.value : this.calories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodData(')
          ..write('foodID: $foodID, ')
          ..write('userID: $userID, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('protein: $protein, ')
          ..write('fibre: $fibre, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(foodID, userID, carbs, fat, protein, fibre, calories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodData &&
          other.foodID == this.foodID &&
          other.userID == this.userID &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.protein == this.protein &&
          other.fibre == this.fibre &&
          other.calories == this.calories);
}

class FoodCompanion extends UpdateCompanion<FoodData> {
  final Value<int> foodID;
  final Value<int> userID;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double> protein;
  final Value<double> fibre;
  final Value<double> calories;
  const FoodCompanion({
    this.foodID = const Value.absent(),
    this.userID = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  });
  FoodCompanion.insert({
    this.foodID = const Value.absent(),
    required int userID,
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<FoodData> custom({
    Expression<int>? foodID,
    Expression<int>? userID,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? protein,
    Expression<double>? fibre,
    Expression<double>? calories,
  }) {
    return RawValuesInsertable({
      if (foodID != null) 'food_i_d': foodID,
      if (userID != null) 'user_i_d': userID,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (protein != null) 'protein': protein,
      if (fibre != null) 'fibre': fibre,
      if (calories != null) 'calories': calories,
    });
  }

  FoodCompanion copyWith({
    Value<int>? foodID,
    Value<int>? userID,
    Value<double>? carbs,
    Value<double>? fat,
    Value<double>? protein,
    Value<double>? fibre,
    Value<double>? calories,
  }) {
    return FoodCompanion(
      foodID: foodID ?? this.foodID,
      userID: userID ?? this.userID,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      protein: protein ?? this.protein,
      fibre: fibre ?? this.fibre,
      calories: calories ?? this.calories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (foodID.present) {
      map['food_i_d'] = Variable<int>(foodID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fibre.present) {
      map['fibre'] = Variable<double>(fibre.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodCompanion(')
          ..write('foodID: $foodID, ')
          ..write('userID: $userID, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('protein: $protein, ')
          ..write('fibre: $fibre, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }
}

class $RecipeTable extends Recipe with TableInfo<$RecipeTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIDMeta = const VerificationMeta(
    'recipeID',
  );
  @override
  late final GeneratedColumn<int> recipeID = GeneratedColumn<int>(
    'recipe_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeNameMeta = const VerificationMeta(
    'recipeName',
  );
  @override
  late final GeneratedColumn<String> recipeName = GeneratedColumn<String>(
    'recipe_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavouriteMeta = const VerificationMeta(
    'isFavourite',
  );
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
    'is_favourite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favourite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [recipeID, recipeName, isFavourite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_i_d')) {
      context.handle(
        _recipeIDMeta,
        recipeID.isAcceptableOrUnknown(data['recipe_i_d']!, _recipeIDMeta),
      );
    }
    if (data.containsKey('recipe_name')) {
      context.handle(
        _recipeNameMeta,
        recipeName.isAcceptableOrUnknown(data['recipe_name']!, _recipeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeNameMeta);
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
        _isFavouriteMeta,
        isFavourite.isAcceptableOrUnknown(
          data['is_favourite']!,
          _isFavouriteMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeID};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      recipeID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_i_d'],
      )!,
      recipeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_name'],
      )!,
      isFavourite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favourite'],
      )!,
    );
  }

  @override
  $RecipeTable createAlias(String alias) {
    return $RecipeTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final int recipeID;
  final String recipeName;
  final bool isFavourite;
  const RecipeData({
    required this.recipeID,
    required this.recipeName,
    required this.isFavourite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_i_d'] = Variable<int>(recipeID);
    map['recipe_name'] = Variable<String>(recipeName);
    map['is_favourite'] = Variable<bool>(isFavourite);
    return map;
  }

  RecipeCompanion toCompanion(bool nullToAbsent) {
    return RecipeCompanion(
      recipeID: Value(recipeID),
      recipeName: Value(recipeName),
      isFavourite: Value(isFavourite),
    );
  }

  factory RecipeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      recipeID: serializer.fromJson<int>(json['recipeID']),
      recipeName: serializer.fromJson<String>(json['recipeName']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeID': serializer.toJson<int>(recipeID),
      'recipeName': serializer.toJson<String>(recipeName),
      'isFavourite': serializer.toJson<bool>(isFavourite),
    };
  }

  RecipeData copyWith({int? recipeID, String? recipeName, bool? isFavourite}) =>
      RecipeData(
        recipeID: recipeID ?? this.recipeID,
        recipeName: recipeName ?? this.recipeName,
        isFavourite: isFavourite ?? this.isFavourite,
      );
  RecipeData copyWithCompanion(RecipeCompanion data) {
    return RecipeData(
      recipeID: data.recipeID.present ? data.recipeID.value : this.recipeID,
      recipeName: data.recipeName.present
          ? data.recipeName.value
          : this.recipeName,
      isFavourite: data.isFavourite.present
          ? data.isFavourite.value
          : this.isFavourite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('recipeID: $recipeID, ')
          ..write('recipeName: $recipeName, ')
          ..write('isFavourite: $isFavourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeID, recipeName, isFavourite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData &&
          other.recipeID == this.recipeID &&
          other.recipeName == this.recipeName &&
          other.isFavourite == this.isFavourite);
}

class RecipeCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> recipeID;
  final Value<String> recipeName;
  final Value<bool> isFavourite;
  const RecipeCompanion({
    this.recipeID = const Value.absent(),
    this.recipeName = const Value.absent(),
    this.isFavourite = const Value.absent(),
  });
  RecipeCompanion.insert({
    this.recipeID = const Value.absent(),
    required String recipeName,
    this.isFavourite = const Value.absent(),
  }) : recipeName = Value(recipeName);
  static Insertable<RecipeData> custom({
    Expression<int>? recipeID,
    Expression<String>? recipeName,
    Expression<bool>? isFavourite,
  }) {
    return RawValuesInsertable({
      if (recipeID != null) 'recipe_i_d': recipeID,
      if (recipeName != null) 'recipe_name': recipeName,
      if (isFavourite != null) 'is_favourite': isFavourite,
    });
  }

  RecipeCompanion copyWith({
    Value<int>? recipeID,
    Value<String>? recipeName,
    Value<bool>? isFavourite,
  }) {
    return RecipeCompanion(
      recipeID: recipeID ?? this.recipeID,
      recipeName: recipeName ?? this.recipeName,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeID.present) {
      map['recipe_i_d'] = Variable<int>(recipeID.value);
    }
    if (recipeName.present) {
      map['recipe_name'] = Variable<String>(recipeName.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCompanion(')
          ..write('recipeID: $recipeID, ')
          ..write('recipeName: $recipeName, ')
          ..write('isFavourite: $isFavourite')
          ..write(')'))
        .toString();
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mealIDMeta = const VerificationMeta('mealID');
  @override
  late final GeneratedColumn<int> mealID = GeneratedColumn<int>(
    'meal_i_d',
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
  static const VerificationMeta _inEatingWindowMeta = const VerificationMeta(
    'inEatingWindow',
  );
  @override
  late final GeneratedColumn<bool> inEatingWindow = GeneratedColumn<bool>(
    'in_eating_window',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("in_eating_window" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _logMethodMeta = const VerificationMeta(
    'logMethod',
  );
  @override
  late final GeneratedColumn<String> logMethod = GeneratedColumn<String>(
    'log_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    mealID,
    userID,
    date,
    inEatingWindow,
    logMethod,
    amount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Meal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meal_i_d')) {
      context.handle(
        _mealIDMeta,
        mealID.isAcceptableOrUnknown(data['meal_i_d']!, _mealIDMeta),
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
    if (data.containsKey('in_eating_window')) {
      context.handle(
        _inEatingWindowMeta,
        inEatingWindow.isAcceptableOrUnknown(
          data['in_eating_window']!,
          _inEatingWindowMeta,
        ),
      );
    }
    if (data.containsKey('log_method')) {
      context.handle(
        _logMethodMeta,
        logMethod.isAcceptableOrUnknown(data['log_method']!, _logMethodMeta),
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
  Set<GeneratedColumn> get $primaryKey => {mealID};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meal(
      mealID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      inEatingWindow: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}in_eating_window'],
      )!,
      logMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}log_method'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(attachedDatabase, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final int mealID;
  final int userID;
  final DateTime date;
  final bool inEatingWindow;
  final String logMethod;
  final double amount;
  const Meal({
    required this.mealID,
    required this.userID,
    required this.date,
    required this.inEatingWindow,
    required this.logMethod,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meal_i_d'] = Variable<int>(mealID);
    map['user_i_d'] = Variable<int>(userID);
    map['date'] = Variable<DateTime>(date);
    map['in_eating_window'] = Variable<bool>(inEatingWindow);
    map['log_method'] = Variable<String>(logMethod);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      mealID: Value(mealID),
      userID: Value(userID),
      date: Value(date),
      inEatingWindow: Value(inEatingWindow),
      logMethod: Value(logMethod),
      amount: Value(amount),
    );
  }

  factory Meal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meal(
      mealID: serializer.fromJson<int>(json['mealID']),
      userID: serializer.fromJson<int>(json['userID']),
      date: serializer.fromJson<DateTime>(json['date']),
      inEatingWindow: serializer.fromJson<bool>(json['inEatingWindow']),
      logMethod: serializer.fromJson<String>(json['logMethod']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealID': serializer.toJson<int>(mealID),
      'userID': serializer.toJson<int>(userID),
      'date': serializer.toJson<DateTime>(date),
      'inEatingWindow': serializer.toJson<bool>(inEatingWindow),
      'logMethod': serializer.toJson<String>(logMethod),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Meal copyWith({
    int? mealID,
    int? userID,
    DateTime? date,
    bool? inEatingWindow,
    String? logMethod,
    double? amount,
  }) => Meal(
    mealID: mealID ?? this.mealID,
    userID: userID ?? this.userID,
    date: date ?? this.date,
    inEatingWindow: inEatingWindow ?? this.inEatingWindow,
    logMethod: logMethod ?? this.logMethod,
    amount: amount ?? this.amount,
  );
  Meal copyWithCompanion(MealsCompanion data) {
    return Meal(
      mealID: data.mealID.present ? data.mealID.value : this.mealID,
      userID: data.userID.present ? data.userID.value : this.userID,
      date: data.date.present ? data.date.value : this.date,
      inEatingWindow: data.inEatingWindow.present
          ? data.inEatingWindow.value
          : this.inEatingWindow,
      logMethod: data.logMethod.present ? data.logMethod.value : this.logMethod,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('mealID: $mealID, ')
          ..write('userID: $userID, ')
          ..write('date: $date, ')
          ..write('inEatingWindow: $inEatingWindow, ')
          ..write('logMethod: $logMethod, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(mealID, userID, date, inEatingWindow, logMethod, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.mealID == this.mealID &&
          other.userID == this.userID &&
          other.date == this.date &&
          other.inEatingWindow == this.inEatingWindow &&
          other.logMethod == this.logMethod &&
          other.amount == this.amount);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> mealID;
  final Value<int> userID;
  final Value<DateTime> date;
  final Value<bool> inEatingWindow;
  final Value<String> logMethod;
  final Value<double> amount;
  const MealsCompanion({
    this.mealID = const Value.absent(),
    this.userID = const Value.absent(),
    this.date = const Value.absent(),
    this.inEatingWindow = const Value.absent(),
    this.logMethod = const Value.absent(),
    this.amount = const Value.absent(),
  });
  MealsCompanion.insert({
    this.mealID = const Value.absent(),
    required int userID,
    this.date = const Value.absent(),
    this.inEatingWindow = const Value.absent(),
    this.logMethod = const Value.absent(),
    this.amount = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<Meal> custom({
    Expression<int>? mealID,
    Expression<int>? userID,
    Expression<DateTime>? date,
    Expression<bool>? inEatingWindow,
    Expression<String>? logMethod,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (mealID != null) 'meal_i_d': mealID,
      if (userID != null) 'user_i_d': userID,
      if (date != null) 'date': date,
      if (inEatingWindow != null) 'in_eating_window': inEatingWindow,
      if (logMethod != null) 'log_method': logMethod,
      if (amount != null) 'amount': amount,
    });
  }

  MealsCompanion copyWith({
    Value<int>? mealID,
    Value<int>? userID,
    Value<DateTime>? date,
    Value<bool>? inEatingWindow,
    Value<String>? logMethod,
    Value<double>? amount,
  }) {
    return MealsCompanion(
      mealID: mealID ?? this.mealID,
      userID: userID ?? this.userID,
      date: date ?? this.date,
      inEatingWindow: inEatingWindow ?? this.inEatingWindow,
      logMethod: logMethod ?? this.logMethod,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealID.present) {
      map['meal_i_d'] = Variable<int>(mealID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (inEatingWindow.present) {
      map['in_eating_window'] = Variable<bool>(inEatingWindow.value);
    }
    if (logMethod.present) {
      map['log_method'] = Variable<String>(logMethod.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('mealID: $mealID, ')
          ..write('userID: $userID, ')
          ..write('date: $date, ')
          ..write('inEatingWindow: $inEatingWindow, ')
          ..write('logMethod: $logMethod, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $RecipeQuantitiesTable extends RecipeQuantities
    with TableInfo<$RecipeQuantitiesTable, RecipeQuantity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeQuantitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIDMeta = const VerificationMeta(
    'recipeID',
  );
  @override
  late final GeneratedColumn<int> recipeID = GeneratedColumn<int>(
    'recipe_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe (recipe_i_d)',
    ),
  );
  static const VerificationMeta _foodIDMeta = const VerificationMeta('foodID');
  @override
  late final GeneratedColumn<int> foodID = GeneratedColumn<int>(
    'food_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES food (food_i_d)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [recipeID, foodID, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_quantities';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeQuantity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_i_d')) {
      context.handle(
        _recipeIDMeta,
        recipeID.isAcceptableOrUnknown(data['recipe_i_d']!, _recipeIDMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIDMeta);
    }
    if (data.containsKey('food_i_d')) {
      context.handle(
        _foodIDMeta,
        foodID.isAcceptableOrUnknown(data['food_i_d']!, _foodIDMeta),
      );
    } else if (isInserting) {
      context.missing(_foodIDMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RecipeQuantity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeQuantity(
      recipeID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_i_d'],
      )!,
      foodID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}food_i_d'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $RecipeQuantitiesTable createAlias(String alias) {
    return $RecipeQuantitiesTable(attachedDatabase, alias);
  }
}

class RecipeQuantity extends DataClass implements Insertable<RecipeQuantity> {
  final int recipeID;
  final int foodID;
  final double quantity;
  const RecipeQuantity({
    required this.recipeID,
    required this.foodID,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_i_d'] = Variable<int>(recipeID);
    map['food_i_d'] = Variable<int>(foodID);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  RecipeQuantitiesCompanion toCompanion(bool nullToAbsent) {
    return RecipeQuantitiesCompanion(
      recipeID: Value(recipeID),
      foodID: Value(foodID),
      quantity: Value(quantity),
    );
  }

  factory RecipeQuantity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeQuantity(
      recipeID: serializer.fromJson<int>(json['recipeID']),
      foodID: serializer.fromJson<int>(json['foodID']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeID': serializer.toJson<int>(recipeID),
      'foodID': serializer.toJson<int>(foodID),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  RecipeQuantity copyWith({int? recipeID, int? foodID, double? quantity}) =>
      RecipeQuantity(
        recipeID: recipeID ?? this.recipeID,
        foodID: foodID ?? this.foodID,
        quantity: quantity ?? this.quantity,
      );
  RecipeQuantity copyWithCompanion(RecipeQuantitiesCompanion data) {
    return RecipeQuantity(
      recipeID: data.recipeID.present ? data.recipeID.value : this.recipeID,
      foodID: data.foodID.present ? data.foodID.value : this.foodID,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeQuantity(')
          ..write('recipeID: $recipeID, ')
          ..write('foodID: $foodID, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeID, foodID, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeQuantity &&
          other.recipeID == this.recipeID &&
          other.foodID == this.foodID &&
          other.quantity == this.quantity);
}

class RecipeQuantitiesCompanion extends UpdateCompanion<RecipeQuantity> {
  final Value<int> recipeID;
  final Value<int> foodID;
  final Value<double> quantity;
  final Value<int> rowid;
  const RecipeQuantitiesCompanion({
    this.recipeID = const Value.absent(),
    this.foodID = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeQuantitiesCompanion.insert({
    required int recipeID,
    required int foodID,
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : recipeID = Value(recipeID),
       foodID = Value(foodID);
  static Insertable<RecipeQuantity> custom({
    Expression<int>? recipeID,
    Expression<int>? foodID,
    Expression<double>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeID != null) 'recipe_i_d': recipeID,
      if (foodID != null) 'food_i_d': foodID,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeQuantitiesCompanion copyWith({
    Value<int>? recipeID,
    Value<int>? foodID,
    Value<double>? quantity,
    Value<int>? rowid,
  }) {
    return RecipeQuantitiesCompanion(
      recipeID: recipeID ?? this.recipeID,
      foodID: foodID ?? this.foodID,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeID.present) {
      map['recipe_i_d'] = Variable<int>(recipeID.value);
    }
    if (foodID.present) {
      map['food_i_d'] = Variable<int>(foodID.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeQuantitiesCompanion(')
          ..write('recipeID: $recipeID, ')
          ..write('foodID: $foodID, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NutritionLogTable extends NutritionLog
    with TableInfo<$NutritionLogTable, NutritionLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutritionLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nutritionLogIDMeta = const VerificationMeta(
    'nutritionLogID',
  );
  @override
  late final GeneratedColumn<int> nutritionLogID = GeneratedColumn<int>(
    'nutrition_log_i_d',
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
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _protienMeta = const VerificationMeta(
    'protien',
  );
  @override
  late final GeneratedColumn<double> protien = GeneratedColumn<double>(
    'protien',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fibreMeta = const VerificationMeta('fibre');
  @override
  late final GeneratedColumn<double> fibre = GeneratedColumn<double>(
    'fibre',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    nutritionLogID,
    userID,
    logDateTime,
    carbs,
    fat,
    protien,
    fibre,
    calories,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrition_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<NutritionLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nutrition_log_i_d')) {
      context.handle(
        _nutritionLogIDMeta,
        nutritionLogID.isAcceptableOrUnknown(
          data['nutrition_log_i_d']!,
          _nutritionLogIDMeta,
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
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('protien')) {
      context.handle(
        _protienMeta,
        protien.isAcceptableOrUnknown(data['protien']!, _protienMeta),
      );
    }
    if (data.containsKey('fibre')) {
      context.handle(
        _fibreMeta,
        fibre.isAcceptableOrUnknown(data['fibre']!, _fibreMeta),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nutritionLogID};
  @override
  NutritionLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutritionLogData(
      nutritionLogID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nutrition_log_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      logDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}log_date_time'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      )!,
      protien: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protien'],
      )!,
      fibre: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fibre'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories'],
      )!,
    );
  }

  @override
  $NutritionLogTable createAlias(String alias) {
    return $NutritionLogTable(attachedDatabase, alias);
  }
}

class NutritionLogData extends DataClass
    implements Insertable<NutritionLogData> {
  final int nutritionLogID;
  final int userID;
  final DateTime logDateTime;
  final double carbs;
  final double fat;
  final double protien;
  final double fibre;
  final int calories;
  const NutritionLogData({
    required this.nutritionLogID,
    required this.userID,
    required this.logDateTime,
    required this.carbs,
    required this.fat,
    required this.protien,
    required this.fibre,
    required this.calories,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nutrition_log_i_d'] = Variable<int>(nutritionLogID);
    map['user_i_d'] = Variable<int>(userID);
    map['log_date_time'] = Variable<DateTime>(logDateTime);
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    map['protien'] = Variable<double>(protien);
    map['fibre'] = Variable<double>(fibre);
    map['calories'] = Variable<int>(calories);
    return map;
  }

  NutritionLogCompanion toCompanion(bool nullToAbsent) {
    return NutritionLogCompanion(
      nutritionLogID: Value(nutritionLogID),
      userID: Value(userID),
      logDateTime: Value(logDateTime),
      carbs: Value(carbs),
      fat: Value(fat),
      protien: Value(protien),
      fibre: Value(fibre),
      calories: Value(calories),
    );
  }

  factory NutritionLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutritionLogData(
      nutritionLogID: serializer.fromJson<int>(json['nutritionLogID']),
      userID: serializer.fromJson<int>(json['userID']),
      logDateTime: serializer.fromJson<DateTime>(json['logDateTime']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fat: serializer.fromJson<double>(json['fat']),
      protien: serializer.fromJson<double>(json['protien']),
      fibre: serializer.fromJson<double>(json['fibre']),
      calories: serializer.fromJson<int>(json['calories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nutritionLogID': serializer.toJson<int>(nutritionLogID),
      'userID': serializer.toJson<int>(userID),
      'logDateTime': serializer.toJson<DateTime>(logDateTime),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'protien': serializer.toJson<double>(protien),
      'fibre': serializer.toJson<double>(fibre),
      'calories': serializer.toJson<int>(calories),
    };
  }

  NutritionLogData copyWith({
    int? nutritionLogID,
    int? userID,
    DateTime? logDateTime,
    double? carbs,
    double? fat,
    double? protien,
    double? fibre,
    int? calories,
  }) => NutritionLogData(
    nutritionLogID: nutritionLogID ?? this.nutritionLogID,
    userID: userID ?? this.userID,
    logDateTime: logDateTime ?? this.logDateTime,
    carbs: carbs ?? this.carbs,
    fat: fat ?? this.fat,
    protien: protien ?? this.protien,
    fibre: fibre ?? this.fibre,
    calories: calories ?? this.calories,
  );
  NutritionLogData copyWithCompanion(NutritionLogCompanion data) {
    return NutritionLogData(
      nutritionLogID: data.nutritionLogID.present
          ? data.nutritionLogID.value
          : this.nutritionLogID,
      userID: data.userID.present ? data.userID.value : this.userID,
      logDateTime: data.logDateTime.present
          ? data.logDateTime.value
          : this.logDateTime,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
      protien: data.protien.present ? data.protien.value : this.protien,
      fibre: data.fibre.present ? data.fibre.value : this.fibre,
      calories: data.calories.present ? data.calories.value : this.calories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutritionLogData(')
          ..write('nutritionLogID: $nutritionLogID, ')
          ..write('userID: $userID, ')
          ..write('logDateTime: $logDateTime, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('protien: $protien, ')
          ..write('fibre: $fibre, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    nutritionLogID,
    userID,
    logDateTime,
    carbs,
    fat,
    protien,
    fibre,
    calories,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutritionLogData &&
          other.nutritionLogID == this.nutritionLogID &&
          other.userID == this.userID &&
          other.logDateTime == this.logDateTime &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.protien == this.protien &&
          other.fibre == this.fibre &&
          other.calories == this.calories);
}

class NutritionLogCompanion extends UpdateCompanion<NutritionLogData> {
  final Value<int> nutritionLogID;
  final Value<int> userID;
  final Value<DateTime> logDateTime;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double> protien;
  final Value<double> fibre;
  final Value<int> calories;
  const NutritionLogCompanion({
    this.nutritionLogID = const Value.absent(),
    this.userID = const Value.absent(),
    this.logDateTime = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protien = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  });
  NutritionLogCompanion.insert({
    this.nutritionLogID = const Value.absent(),
    required int userID,
    this.logDateTime = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protien = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<NutritionLogData> custom({
    Expression<int>? nutritionLogID,
    Expression<int>? userID,
    Expression<DateTime>? logDateTime,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? protien,
    Expression<double>? fibre,
    Expression<int>? calories,
  }) {
    return RawValuesInsertable({
      if (nutritionLogID != null) 'nutrition_log_i_d': nutritionLogID,
      if (userID != null) 'user_i_d': userID,
      if (logDateTime != null) 'log_date_time': logDateTime,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (protien != null) 'protien': protien,
      if (fibre != null) 'fibre': fibre,
      if (calories != null) 'calories': calories,
    });
  }

  NutritionLogCompanion copyWith({
    Value<int>? nutritionLogID,
    Value<int>? userID,
    Value<DateTime>? logDateTime,
    Value<double>? carbs,
    Value<double>? fat,
    Value<double>? protien,
    Value<double>? fibre,
    Value<int>? calories,
  }) {
    return NutritionLogCompanion(
      nutritionLogID: nutritionLogID ?? this.nutritionLogID,
      userID: userID ?? this.userID,
      logDateTime: logDateTime ?? this.logDateTime,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      protien: protien ?? this.protien,
      fibre: fibre ?? this.fibre,
      calories: calories ?? this.calories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nutritionLogID.present) {
      map['nutrition_log_i_d'] = Variable<int>(nutritionLogID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (logDateTime.present) {
      map['log_date_time'] = Variable<DateTime>(logDateTime.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (protien.present) {
      map['protien'] = Variable<double>(protien.value);
    }
    if (fibre.present) {
      map['fibre'] = Variable<double>(fibre.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutritionLogCompanion(')
          ..write('nutritionLogID: $nutritionLogID, ')
          ..write('userID: $userID, ')
          ..write('logDateTime: $logDateTime, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('protien: $protien, ')
          ..write('fibre: $fibre, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }
}

class $MealRecipeContentTable extends MealRecipeContent
    with TableInfo<$MealRecipeContentTable, MealRecipeContentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealRecipeContentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mealIDMeta = const VerificationMeta('mealID');
  @override
  late final GeneratedColumn<int> mealID = GeneratedColumn<int>(
    'meal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meals (meal_i_d)',
    ),
  );
  static const VerificationMeta _recipeIDMeta = const VerificationMeta(
    'recipeID',
  );
  @override
  late final GeneratedColumn<int> recipeID = GeneratedColumn<int>(
    'recipe_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe (recipe_i_d)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [mealID, recipeID, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_recipe_content';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealRecipeContentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meal_i_d')) {
      context.handle(
        _mealIDMeta,
        mealID.isAcceptableOrUnknown(data['meal_i_d']!, _mealIDMeta),
      );
    } else if (isInserting) {
      context.missing(_mealIDMeta);
    }
    if (data.containsKey('recipe_i_d')) {
      context.handle(
        _recipeIDMeta,
        recipeID.isAcceptableOrUnknown(data['recipe_i_d']!, _recipeIDMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIDMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealRecipeContentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealRecipeContentData(
      mealID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_i_d'],
      )!,
      recipeID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_i_d'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $MealRecipeContentTable createAlias(String alias) {
    return $MealRecipeContentTable(attachedDatabase, alias);
  }
}

class MealRecipeContentData extends DataClass
    implements Insertable<MealRecipeContentData> {
  final int mealID;
  final int recipeID;
  final double quantity;
  const MealRecipeContentData({
    required this.mealID,
    required this.recipeID,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meal_i_d'] = Variable<int>(mealID);
    map['recipe_i_d'] = Variable<int>(recipeID);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  MealRecipeContentCompanion toCompanion(bool nullToAbsent) {
    return MealRecipeContentCompanion(
      mealID: Value(mealID),
      recipeID: Value(recipeID),
      quantity: Value(quantity),
    );
  }

  factory MealRecipeContentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealRecipeContentData(
      mealID: serializer.fromJson<int>(json['mealID']),
      recipeID: serializer.fromJson<int>(json['recipeID']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealID': serializer.toJson<int>(mealID),
      'recipeID': serializer.toJson<int>(recipeID),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  MealRecipeContentData copyWith({
    int? mealID,
    int? recipeID,
    double? quantity,
  }) => MealRecipeContentData(
    mealID: mealID ?? this.mealID,
    recipeID: recipeID ?? this.recipeID,
    quantity: quantity ?? this.quantity,
  );
  MealRecipeContentData copyWithCompanion(MealRecipeContentCompanion data) {
    return MealRecipeContentData(
      mealID: data.mealID.present ? data.mealID.value : this.mealID,
      recipeID: data.recipeID.present ? data.recipeID.value : this.recipeID,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealRecipeContentData(')
          ..write('mealID: $mealID, ')
          ..write('recipeID: $recipeID, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mealID, recipeID, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealRecipeContentData &&
          other.mealID == this.mealID &&
          other.recipeID == this.recipeID &&
          other.quantity == this.quantity);
}

class MealRecipeContentCompanion
    extends UpdateCompanion<MealRecipeContentData> {
  final Value<int> mealID;
  final Value<int> recipeID;
  final Value<double> quantity;
  final Value<int> rowid;
  const MealRecipeContentCompanion({
    this.mealID = const Value.absent(),
    this.recipeID = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealRecipeContentCompanion.insert({
    required int mealID,
    required int recipeID,
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : mealID = Value(mealID),
       recipeID = Value(recipeID);
  static Insertable<MealRecipeContentData> custom({
    Expression<int>? mealID,
    Expression<int>? recipeID,
    Expression<double>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mealID != null) 'meal_i_d': mealID,
      if (recipeID != null) 'recipe_i_d': recipeID,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealRecipeContentCompanion copyWith({
    Value<int>? mealID,
    Value<int>? recipeID,
    Value<double>? quantity,
    Value<int>? rowid,
  }) {
    return MealRecipeContentCompanion(
      mealID: mealID ?? this.mealID,
      recipeID: recipeID ?? this.recipeID,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealID.present) {
      map['meal_i_d'] = Variable<int>(mealID.value);
    }
    if (recipeID.present) {
      map['recipe_i_d'] = Variable<int>(recipeID.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealRecipeContentCompanion(')
          ..write('mealID: $mealID, ')
          ..write('recipeID: $recipeID, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealFoodContentTable extends MealFoodContent
    with TableInfo<$MealFoodContentTable, MealFoodContentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealFoodContentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mealIDMeta = const VerificationMeta('mealID');
  @override
  late final GeneratedColumn<int> mealID = GeneratedColumn<int>(
    'meal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meals (meal_i_d)',
    ),
  );
  static const VerificationMeta _foodIDMeta = const VerificationMeta('foodID');
  @override
  late final GeneratedColumn<int> foodID = GeneratedColumn<int>(
    'food_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES food (food_i_d)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [mealID, foodID, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_food_content';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealFoodContentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meal_i_d')) {
      context.handle(
        _mealIDMeta,
        mealID.isAcceptableOrUnknown(data['meal_i_d']!, _mealIDMeta),
      );
    } else if (isInserting) {
      context.missing(_mealIDMeta);
    }
    if (data.containsKey('food_i_d')) {
      context.handle(
        _foodIDMeta,
        foodID.isAcceptableOrUnknown(data['food_i_d']!, _foodIDMeta),
      );
    } else if (isInserting) {
      context.missing(_foodIDMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealFoodContentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealFoodContentData(
      mealID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_i_d'],
      )!,
      foodID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}food_i_d'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $MealFoodContentTable createAlias(String alias) {
    return $MealFoodContentTable(attachedDatabase, alias);
  }
}

class MealFoodContentData extends DataClass
    implements Insertable<MealFoodContentData> {
  final int mealID;
  final int foodID;
  final double quantity;
  const MealFoodContentData({
    required this.mealID,
    required this.foodID,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meal_i_d'] = Variable<int>(mealID);
    map['food_i_d'] = Variable<int>(foodID);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  MealFoodContentCompanion toCompanion(bool nullToAbsent) {
    return MealFoodContentCompanion(
      mealID: Value(mealID),
      foodID: Value(foodID),
      quantity: Value(quantity),
    );
  }

  factory MealFoodContentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealFoodContentData(
      mealID: serializer.fromJson<int>(json['mealID']),
      foodID: serializer.fromJson<int>(json['foodID']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealID': serializer.toJson<int>(mealID),
      'foodID': serializer.toJson<int>(foodID),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  MealFoodContentData copyWith({int? mealID, int? foodID, double? quantity}) =>
      MealFoodContentData(
        mealID: mealID ?? this.mealID,
        foodID: foodID ?? this.foodID,
        quantity: quantity ?? this.quantity,
      );
  MealFoodContentData copyWithCompanion(MealFoodContentCompanion data) {
    return MealFoodContentData(
      mealID: data.mealID.present ? data.mealID.value : this.mealID,
      foodID: data.foodID.present ? data.foodID.value : this.foodID,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealFoodContentData(')
          ..write('mealID: $mealID, ')
          ..write('foodID: $foodID, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mealID, foodID, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealFoodContentData &&
          other.mealID == this.mealID &&
          other.foodID == this.foodID &&
          other.quantity == this.quantity);
}

class MealFoodContentCompanion extends UpdateCompanion<MealFoodContentData> {
  final Value<int> mealID;
  final Value<int> foodID;
  final Value<double> quantity;
  final Value<int> rowid;
  const MealFoodContentCompanion({
    this.mealID = const Value.absent(),
    this.foodID = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealFoodContentCompanion.insert({
    required int mealID,
    required int foodID,
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : mealID = Value(mealID),
       foodID = Value(foodID);
  static Insertable<MealFoodContentData> custom({
    Expression<int>? mealID,
    Expression<int>? foodID,
    Expression<double>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mealID != null) 'meal_i_d': mealID,
      if (foodID != null) 'food_i_d': foodID,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealFoodContentCompanion copyWith({
    Value<int>? mealID,
    Value<int>? foodID,
    Value<double>? quantity,
    Value<int>? rowid,
  }) {
    return MealFoodContentCompanion(
      mealID: mealID ?? this.mealID,
      foodID: foodID ?? this.foodID,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealID.present) {
      map['meal_i_d'] = Variable<int>(mealID.value);
    }
    if (foodID.present) {
      map['food_i_d'] = Variable<int>(foodID.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealFoodContentCompanion(')
          ..write('mealID: $mealID, ')
          ..write('foodID: $foodID, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
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
  late final $FoodTable food = $FoodTable(this);
  late final $RecipeTable recipe = $RecipeTable(this);
  late final $MealsTable meals = $MealsTable(this);
  late final $RecipeQuantitiesTable recipeQuantities = $RecipeQuantitiesTable(
    this,
  );
  late final $NutritionLogTable nutritionLog = $NutritionLogTable(this);
  late final $MealRecipeContentTable mealRecipeContent =
      $MealRecipeContentTable(this);
  late final $MealFoodContentTable mealFoodContent = $MealFoodContentTable(
    this,
  );
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final FastingDao fastingDao = FastingDao(this as AppDatabase);
  late final HydrationDao hydrationDao = HydrationDao(this as AppDatabase);
  late final NutritionDao nutritionDao = NutritionDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    fastLog,
    hydrationLog,
    weightLog,
    food,
    recipe,
    meals,
    recipeQuantities,
    nutritionLog,
    mealRecipeContent,
    mealFoodContent,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userID,
      required String name,
      Value<bool> isMetric,
      Value<String> formIF,
      Value<String> experience,
      Value<DateTime?> typicalEatingStart,
      Value<DateTime?> typicalEatingEnd,
      Value<DateTime> createdDate,
      Value<String> adfDaysSelected,
      Value<String> fiveTwoDaysSelected,
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
      Value<String> adfDaysSelected,
      Value<String> fiveTwoDaysSelected,
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

  static MultiTypedResultKey<$FoodTable, List<FoodData>> _foodRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.food,
    aliasName: 'users__user_i_d__food__user_i_d',
  );

  $$FoodTableProcessedTableManager get foodRefs {
    final manager = $$FoodTableTableManager(
      $_db,
      $_db.food,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_foodRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealsTable, List<Meal>> _mealsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meals,
    aliasName: 'users__user_i_d__meals__user_i_d',
  );

  $$MealsTableProcessedTableManager get mealsRefs {
    final manager = $$MealsTableTableManager(
      $_db,
      $_db.meals,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_mealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NutritionLogTable, List<NutritionLogData>>
  _nutritionLogRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.nutritionLog,
    aliasName: 'users__user_i_d__nutrition_log__user_i_d',
  );

  $$NutritionLogTableProcessedTableManager get nutritionLogRefs {
    final manager = $$NutritionLogTableTableManager(
      $_db,
      $_db.nutritionLog,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_nutritionLogRefsTable($_db));
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

  ColumnFilters<String> get adfDaysSelected => $composableBuilder(
    column: $table.adfDaysSelected,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fiveTwoDaysSelected => $composableBuilder(
    column: $table.fiveTwoDaysSelected,
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

  Expression<bool> foodRefs(
    Expression<bool> Function($$FoodTableFilterComposer f) f,
  ) {
    final $$FoodTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableFilterComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealsRefs(
    Expression<bool> Function($$MealsTableFilterComposer f) f,
  ) {
    final $$MealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableFilterComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> nutritionLogRefs(
    Expression<bool> Function($$NutritionLogTableFilterComposer f) f,
  ) {
    final $$NutritionLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.nutritionLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutritionLogTableFilterComposer(
            $db: $db,
            $table: $db.nutritionLog,
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

  ColumnOrderings<String> get adfDaysSelected => $composableBuilder(
    column: $table.adfDaysSelected,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fiveTwoDaysSelected => $composableBuilder(
    column: $table.fiveTwoDaysSelected,
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

  GeneratedColumn<String> get adfDaysSelected => $composableBuilder(
    column: $table.adfDaysSelected,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fiveTwoDaysSelected => $composableBuilder(
    column: $table.fiveTwoDaysSelected,
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

  Expression<T> foodRefs<T extends Object>(
    Expression<T> Function($$FoodTableAnnotationComposer a) f,
  ) {
    final $$FoodTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableAnnotationComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealsRefs<T extends Object>(
    Expression<T> Function($$MealsTableAnnotationComposer a) f,
  ) {
    final $$MealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableAnnotationComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> nutritionLogRefs<T extends Object>(
    Expression<T> Function($$NutritionLogTableAnnotationComposer a) f,
  ) {
    final $$NutritionLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.nutritionLog,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutritionLogTableAnnotationComposer(
            $db: $db,
            $table: $db.nutritionLog,
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
            bool foodRefs,
            bool mealsRefs,
            bool nutritionLogRefs,
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
                Value<String> adfDaysSelected = const Value.absent(),
                Value<String> fiveTwoDaysSelected = const Value.absent(),
              }) => UsersCompanion(
                userID: userID,
                name: name,
                isMetric: isMetric,
                formIF: formIF,
                experience: experience,
                typicalEatingStart: typicalEatingStart,
                typicalEatingEnd: typicalEatingEnd,
                createdDate: createdDate,
                adfDaysSelected: adfDaysSelected,
                fiveTwoDaysSelected: fiveTwoDaysSelected,
              ),
          createCompanionCallback:
              ({
                Value<int> userID = const Value.absent(),
                required String name,
                Value<bool> isMetric = const Value.absent(),
                Value<String> formIF = const Value.absent(),
                Value<String> experience = const Value.absent(),
                Value<DateTime?> typicalEatingStart = const Value.absent(),
                Value<DateTime?> typicalEatingEnd = const Value.absent(),
                Value<DateTime> createdDate = const Value.absent(),
                Value<String> adfDaysSelected = const Value.absent(),
                Value<String> fiveTwoDaysSelected = const Value.absent(),
              }) => UsersCompanion.insert(
                userID: userID,
                name: name,
                isMetric: isMetric,
                formIF: formIF,
                experience: experience,
                typicalEatingStart: typicalEatingStart,
                typicalEatingEnd: typicalEatingEnd,
                createdDate: createdDate,
                adfDaysSelected: adfDaysSelected,
                fiveTwoDaysSelected: fiveTwoDaysSelected,
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
                foodRefs = false,
                mealsRefs = false,
                nutritionLogRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fastLogRefs) db.fastLog,
                    if (hydrationLogRefs) db.hydrationLog,
                    if (weightLogRefs) db.weightLog,
                    if (foodRefs) db.food,
                    if (mealsRefs) db.meals,
                    if (nutritionLogRefs) db.nutritionLog,
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
                      if (foodRefs)
                        await $_getPrefetchedData<User, $UsersTable, FoodData>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._foodRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).foodRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userID == item.userID,
                              ),
                          typedResults: items,
                        ),
                      if (mealsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Meal>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._mealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).mealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userID == item.userID,
                              ),
                          typedResults: items,
                        ),
                      if (nutritionLogRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          NutritionLogData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._nutritionLogRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).nutritionLogRefs,
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
        bool foodRefs,
        bool mealsRefs,
        bool nutritionLogRefs,
      })
    >;
typedef $$FastLogTableCreateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      required int userID,
      Value<String> formIF,
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
                Value<String> formIF = const Value.absent(),
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
      Value<double> amount,
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
                Value<double> amount = const Value.absent(),
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
typedef $$FoodTableCreateCompanionBuilder =
    FoodCompanion Function({
      Value<int> foodID,
      required int userID,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protein,
      Value<double> fibre,
      Value<double> calories,
    });
typedef $$FoodTableUpdateCompanionBuilder =
    FoodCompanion Function({
      Value<int> foodID,
      Value<int> userID,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protein,
      Value<double> fibre,
      Value<double> calories,
    });

final class $$FoodTableReferences
    extends BaseReferences<_$AppDatabase, $FoodTable, FoodData> {
  $$FoodTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('food__user_i_d__users__user_i_d');

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

  static MultiTypedResultKey<$RecipeQuantitiesTable, List<RecipeQuantity>>
  _recipeQuantitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeQuantities,
    aliasName: 'food__food_i_d__recipe_quantities__food_i_d',
  );

  $$RecipeQuantitiesTableProcessedTableManager get recipeQuantitiesRefs {
    final manager = $$RecipeQuantitiesTableTableManager(
      $_db,
      $_db.recipeQuantities,
    ).filter((f) => f.foodID.foodID.sqlEquals($_itemColumn<int>('food_i_d')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeQuantitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealFoodContentTable, List<MealFoodContentData>>
  _mealFoodContentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealFoodContent,
    aliasName: 'food__food_i_d__meal_food_content__food_i_d',
  );

  $$MealFoodContentTableProcessedTableManager get mealFoodContentRefs {
    final manager = $$MealFoodContentTableTableManager(
      $_db,
      $_db.mealFoodContent,
    ).filter((f) => f.foodID.foodID.sqlEquals($_itemColumn<int>('food_i_d')!));

    final cache = $_typedResult.readTableOrNull(
      _mealFoodContentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FoodTableFilterComposer extends Composer<_$AppDatabase, $FoodTable> {
  $$FoodTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get foodID => $composableBuilder(
    column: $table.foodID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fibre => $composableBuilder(
    column: $table.fibre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
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

  Expression<bool> recipeQuantitiesRefs(
    Expression<bool> Function($$RecipeQuantitiesTableFilterComposer f) f,
  ) {
    final $$RecipeQuantitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.recipeQuantities,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeQuantitiesTableFilterComposer(
            $db: $db,
            $table: $db.recipeQuantities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealFoodContentRefs(
    Expression<bool> Function($$MealFoodContentTableFilterComposer f) f,
  ) {
    final $$MealFoodContentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.mealFoodContent,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealFoodContentTableFilterComposer(
            $db: $db,
            $table: $db.mealFoodContent,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoodTableOrderingComposer extends Composer<_$AppDatabase, $FoodTable> {
  $$FoodTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get foodID => $composableBuilder(
    column: $table.foodID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fibre => $composableBuilder(
    column: $table.fibre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
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

class $$FoodTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodTable> {
  $$FoodTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get foodID =>
      $composableBuilder(column: $table.foodID, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fibre =>
      $composableBuilder(column: $table.fibre, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

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

  Expression<T> recipeQuantitiesRefs<T extends Object>(
    Expression<T> Function($$RecipeQuantitiesTableAnnotationComposer a) f,
  ) {
    final $$RecipeQuantitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.recipeQuantities,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeQuantitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeQuantities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealFoodContentRefs<T extends Object>(
    Expression<T> Function($$MealFoodContentTableAnnotationComposer a) f,
  ) {
    final $$MealFoodContentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.mealFoodContent,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealFoodContentTableAnnotationComposer(
            $db: $db,
            $table: $db.mealFoodContent,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoodTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodTable,
          FoodData,
          $$FoodTableFilterComposer,
          $$FoodTableOrderingComposer,
          $$FoodTableAnnotationComposer,
          $$FoodTableCreateCompanionBuilder,
          $$FoodTableUpdateCompanionBuilder,
          (FoodData, $$FoodTableReferences),
          FoodData,
          PrefetchHooks Function({
            bool userID,
            bool recipeQuantitiesRefs,
            bool mealFoodContentRefs,
          })
        > {
  $$FoodTableTableManager(_$AppDatabase db, $FoodTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> foodID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodCompanion(
                foodID: foodID,
                userID: userID,
                carbs: carbs,
                fat: fat,
                protein: protein,
                fibre: fibre,
                calories: calories,
              ),
          createCompanionCallback:
              ({
                Value<int> foodID = const Value.absent(),
                required int userID,
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodCompanion.insert(
                foodID: foodID,
                userID: userID,
                carbs: carbs,
                fat: fat,
                protein: protein,
                fibre: fibre,
                calories: calories,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$FoodTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userID = false,
                recipeQuantitiesRefs = false,
                mealFoodContentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeQuantitiesRefs) db.recipeQuantities,
                    if (mealFoodContentRefs) db.mealFoodContent,
                  ],
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
                                    referencedTable: $$FoodTableReferences
                                        ._userIDTable(db),
                                    referencedColumn: $$FoodTableReferences
                                        ._userIDTable(db)
                                        .userID,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeQuantitiesRefs)
                        await $_getPrefetchedData<
                          FoodData,
                          $FoodTable,
                          RecipeQuantity
                        >(
                          currentTable: table,
                          referencedTable: $$FoodTableReferences
                              ._recipeQuantitiesRefsTable(db),
                          managerFromTypedResult: (p0) => $$FoodTableReferences(
                            db,
                            table,
                            p0,
                          ).recipeQuantitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.foodID == item.foodID,
                              ),
                          typedResults: items,
                        ),
                      if (mealFoodContentRefs)
                        await $_getPrefetchedData<
                          FoodData,
                          $FoodTable,
                          MealFoodContentData
                        >(
                          currentTable: table,
                          referencedTable: $$FoodTableReferences
                              ._mealFoodContentRefsTable(db),
                          managerFromTypedResult: (p0) => $$FoodTableReferences(
                            db,
                            table,
                            p0,
                          ).mealFoodContentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.foodID == item.foodID,
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

typedef $$FoodTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodTable,
      FoodData,
      $$FoodTableFilterComposer,
      $$FoodTableOrderingComposer,
      $$FoodTableAnnotationComposer,
      $$FoodTableCreateCompanionBuilder,
      $$FoodTableUpdateCompanionBuilder,
      (FoodData, $$FoodTableReferences),
      FoodData,
      PrefetchHooks Function({
        bool userID,
        bool recipeQuantitiesRefs,
        bool mealFoodContentRefs,
      })
    >;
typedef $$RecipeTableCreateCompanionBuilder =
    RecipeCompanion Function({
      Value<int> recipeID,
      required String recipeName,
      Value<bool> isFavourite,
    });
typedef $$RecipeTableUpdateCompanionBuilder =
    RecipeCompanion Function({
      Value<int> recipeID,
      Value<String> recipeName,
      Value<bool> isFavourite,
    });

final class $$RecipeTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeTable, RecipeData> {
  $$RecipeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeQuantitiesTable, List<RecipeQuantity>>
  _recipeQuantitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeQuantities,
    aliasName: 'recipe__recipe_i_d__recipe_quantities__recipe_i_d',
  );

  $$RecipeQuantitiesTableProcessedTableManager get recipeQuantitiesRefs {
    final manager =
        $$RecipeQuantitiesTableTableManager($_db, $_db.recipeQuantities).filter(
          (f) =>
              f.recipeID.recipeID.sqlEquals($_itemColumn<int>('recipe_i_d')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _recipeQuantitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MealRecipeContentTable,
    List<MealRecipeContentData>
  >
  _mealRecipeContentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.mealRecipeContent,
        aliasName: 'recipe__recipe_i_d__meal_recipe_content__recipe_i_d',
      );

  $$MealRecipeContentTableProcessedTableManager get mealRecipeContentRefs {
    final manager =
        $$MealRecipeContentTableTableManager(
          $_db,
          $_db.mealRecipeContent,
        ).filter(
          (f) =>
              f.recipeID.recipeID.sqlEquals($_itemColumn<int>('recipe_i_d')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _mealRecipeContentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTable> {
  $$RecipeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get recipeID => $composableBuilder(
    column: $table.recipeID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipeName => $composableBuilder(
    column: $table.recipeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeQuantitiesRefs(
    Expression<bool> Function($$RecipeQuantitiesTableFilterComposer f) f,
  ) {
    final $$RecipeQuantitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipeQuantities,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeQuantitiesTableFilterComposer(
            $db: $db,
            $table: $db.recipeQuantities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealRecipeContentRefs(
    Expression<bool> Function($$MealRecipeContentTableFilterComposer f) f,
  ) {
    final $$MealRecipeContentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.mealRecipeContent,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealRecipeContentTableFilterComposer(
            $db: $db,
            $table: $db.mealRecipeContent,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTable> {
  $$RecipeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get recipeID => $composableBuilder(
    column: $table.recipeID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipeName => $composableBuilder(
    column: $table.recipeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipeTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTable> {
  $$RecipeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get recipeID =>
      $composableBuilder(column: $table.recipeID, builder: (column) => column);

  GeneratedColumn<String> get recipeName => $composableBuilder(
    column: $table.recipeName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => column,
  );

  Expression<T> recipeQuantitiesRefs<T extends Object>(
    Expression<T> Function($$RecipeQuantitiesTableAnnotationComposer a) f,
  ) {
    final $$RecipeQuantitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipeQuantities,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeQuantitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeQuantities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealRecipeContentRefs<T extends Object>(
    Expression<T> Function($$MealRecipeContentTableAnnotationComposer a) f,
  ) {
    final $$MealRecipeContentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.recipeID,
          referencedTable: $db.mealRecipeContent,
          getReferencedColumn: (t) => t.recipeID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MealRecipeContentTableAnnotationComposer(
                $db: $db,
                $table: $db.mealRecipeContent,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeTable,
          RecipeData,
          $$RecipeTableFilterComposer,
          $$RecipeTableOrderingComposer,
          $$RecipeTableAnnotationComposer,
          $$RecipeTableCreateCompanionBuilder,
          $$RecipeTableUpdateCompanionBuilder,
          (RecipeData, $$RecipeTableReferences),
          RecipeData,
          PrefetchHooks Function({
            bool recipeQuantitiesRefs,
            bool mealRecipeContentRefs,
          })
        > {
  $$RecipeTableTableManager(_$AppDatabase db, $RecipeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> recipeID = const Value.absent(),
                Value<String> recipeName = const Value.absent(),
                Value<bool> isFavourite = const Value.absent(),
              }) => RecipeCompanion(
                recipeID: recipeID,
                recipeName: recipeName,
                isFavourite: isFavourite,
              ),
          createCompanionCallback:
              ({
                Value<int> recipeID = const Value.absent(),
                required String recipeName,
                Value<bool> isFavourite = const Value.absent(),
              }) => RecipeCompanion.insert(
                recipeID: recipeID,
                recipeName: recipeName,
                isFavourite: isFavourite,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RecipeTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({recipeQuantitiesRefs = false, mealRecipeContentRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeQuantitiesRefs) db.recipeQuantities,
                    if (mealRecipeContentRefs) db.mealRecipeContent,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeQuantitiesRefs)
                        await $_getPrefetchedData<
                          RecipeData,
                          $RecipeTable,
                          RecipeQuantity
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeTableReferences
                              ._recipeQuantitiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeQuantitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeID == item.recipeID,
                              ),
                          typedResults: items,
                        ),
                      if (mealRecipeContentRefs)
                        await $_getPrefetchedData<
                          RecipeData,
                          $RecipeTable,
                          MealRecipeContentData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeTableReferences
                              ._mealRecipeContentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeTableReferences(
                                db,
                                table,
                                p0,
                              ).mealRecipeContentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeID == item.recipeID,
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

typedef $$RecipeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeTable,
      RecipeData,
      $$RecipeTableFilterComposer,
      $$RecipeTableOrderingComposer,
      $$RecipeTableAnnotationComposer,
      $$RecipeTableCreateCompanionBuilder,
      $$RecipeTableUpdateCompanionBuilder,
      (RecipeData, $$RecipeTableReferences),
      RecipeData,
      PrefetchHooks Function({
        bool recipeQuantitiesRefs,
        bool mealRecipeContentRefs,
      })
    >;
typedef $$MealsTableCreateCompanionBuilder =
    MealsCompanion Function({
      Value<int> mealID,
      required int userID,
      Value<DateTime> date,
      Value<bool> inEatingWindow,
      Value<String> logMethod,
      Value<double> amount,
    });
typedef $$MealsTableUpdateCompanionBuilder =
    MealsCompanion Function({
      Value<int> mealID,
      Value<int> userID,
      Value<DateTime> date,
      Value<bool> inEatingWindow,
      Value<String> logMethod,
      Value<double> amount,
    });

final class $$MealsTableReferences
    extends BaseReferences<_$AppDatabase, $MealsTable, Meal> {
  $$MealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('meals__user_i_d__users__user_i_d');

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

  static MultiTypedResultKey<
    $MealRecipeContentTable,
    List<MealRecipeContentData>
  >
  _mealRecipeContentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.mealRecipeContent,
        aliasName: 'meals__meal_i_d__meal_recipe_content__meal_i_d',
      );

  $$MealRecipeContentTableProcessedTableManager get mealRecipeContentRefs {
    final manager = $$MealRecipeContentTableTableManager(
      $_db,
      $_db.mealRecipeContent,
    ).filter((f) => f.mealID.mealID.sqlEquals($_itemColumn<int>('meal_i_d')!));

    final cache = $_typedResult.readTableOrNull(
      _mealRecipeContentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealFoodContentTable, List<MealFoodContentData>>
  _mealFoodContentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealFoodContent,
    aliasName: 'meals__meal_i_d__meal_food_content__meal_i_d',
  );

  $$MealFoodContentTableProcessedTableManager get mealFoodContentRefs {
    final manager = $$MealFoodContentTableTableManager(
      $_db,
      $_db.mealFoodContent,
    ).filter((f) => f.mealID.mealID.sqlEquals($_itemColumn<int>('meal_i_d')!));

    final cache = $_typedResult.readTableOrNull(
      _mealFoodContentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealsTableFilterComposer extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get mealID => $composableBuilder(
    column: $table.mealID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inEatingWindow => $composableBuilder(
    column: $table.inEatingWindow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logMethod => $composableBuilder(
    column: $table.logMethod,
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

  Expression<bool> mealRecipeContentRefs(
    Expression<bool> Function($$MealRecipeContentTableFilterComposer f) f,
  ) {
    final $$MealRecipeContentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.mealRecipeContent,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealRecipeContentTableFilterComposer(
            $db: $db,
            $table: $db.mealRecipeContent,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealFoodContentRefs(
    Expression<bool> Function($$MealFoodContentTableFilterComposer f) f,
  ) {
    final $$MealFoodContentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.mealFoodContent,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealFoodContentTableFilterComposer(
            $db: $db,
            $table: $db.mealFoodContent,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get mealID => $composableBuilder(
    column: $table.mealID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inEatingWindow => $composableBuilder(
    column: $table.inEatingWindow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logMethod => $composableBuilder(
    column: $table.logMethod,
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

class $$MealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get mealID =>
      $composableBuilder(column: $table.mealID, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get inEatingWindow => $composableBuilder(
    column: $table.inEatingWindow,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logMethod =>
      $composableBuilder(column: $table.logMethod, builder: (column) => column);

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

  Expression<T> mealRecipeContentRefs<T extends Object>(
    Expression<T> Function($$MealRecipeContentTableAnnotationComposer a) f,
  ) {
    final $$MealRecipeContentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.mealID,
          referencedTable: $db.mealRecipeContent,
          getReferencedColumn: (t) => t.mealID,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MealRecipeContentTableAnnotationComposer(
                $db: $db,
                $table: $db.mealRecipeContent,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> mealFoodContentRefs<T extends Object>(
    Expression<T> Function($$MealFoodContentTableAnnotationComposer a) f,
  ) {
    final $$MealFoodContentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.mealFoodContent,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealFoodContentTableAnnotationComposer(
            $db: $db,
            $table: $db.mealFoodContent,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealsTable,
          Meal,
          $$MealsTableFilterComposer,
          $$MealsTableOrderingComposer,
          $$MealsTableAnnotationComposer,
          $$MealsTableCreateCompanionBuilder,
          $$MealsTableUpdateCompanionBuilder,
          (Meal, $$MealsTableReferences),
          Meal,
          PrefetchHooks Function({
            bool userID,
            bool mealRecipeContentRefs,
            bool mealFoodContentRefs,
          })
        > {
  $$MealsTableTableManager(_$AppDatabase db, $MealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> mealID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> inEatingWindow = const Value.absent(),
                Value<String> logMethod = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => MealsCompanion(
                mealID: mealID,
                userID: userID,
                date: date,
                inEatingWindow: inEatingWindow,
                logMethod: logMethod,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> mealID = const Value.absent(),
                required int userID,
                Value<DateTime> date = const Value.absent(),
                Value<bool> inEatingWindow = const Value.absent(),
                Value<String> logMethod = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => MealsCompanion.insert(
                mealID: mealID,
                userID: userID,
                date: date,
                inEatingWindow: inEatingWindow,
                logMethod: logMethod,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$MealsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userID = false,
                mealRecipeContentRefs = false,
                mealFoodContentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mealRecipeContentRefs) db.mealRecipeContent,
                    if (mealFoodContentRefs) db.mealFoodContent,
                  ],
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
                                    referencedTable: $$MealsTableReferences
                                        ._userIDTable(db),
                                    referencedColumn: $$MealsTableReferences
                                        ._userIDTable(db)
                                        .userID,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mealRecipeContentRefs)
                        await $_getPrefetchedData<
                          Meal,
                          $MealsTable,
                          MealRecipeContentData
                        >(
                          currentTable: table,
                          referencedTable: $$MealsTableReferences
                              ._mealRecipeContentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealRecipeContentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mealID == item.mealID,
                              ),
                          typedResults: items,
                        ),
                      if (mealFoodContentRefs)
                        await $_getPrefetchedData<
                          Meal,
                          $MealsTable,
                          MealFoodContentData
                        >(
                          currentTable: table,
                          referencedTable: $$MealsTableReferences
                              ._mealFoodContentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealFoodContentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mealID == item.mealID,
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

typedef $$MealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealsTable,
      Meal,
      $$MealsTableFilterComposer,
      $$MealsTableOrderingComposer,
      $$MealsTableAnnotationComposer,
      $$MealsTableCreateCompanionBuilder,
      $$MealsTableUpdateCompanionBuilder,
      (Meal, $$MealsTableReferences),
      Meal,
      PrefetchHooks Function({
        bool userID,
        bool mealRecipeContentRefs,
        bool mealFoodContentRefs,
      })
    >;
typedef $$RecipeQuantitiesTableCreateCompanionBuilder =
    RecipeQuantitiesCompanion Function({
      required int recipeID,
      required int foodID,
      Value<double> quantity,
      Value<int> rowid,
    });
typedef $$RecipeQuantitiesTableUpdateCompanionBuilder =
    RecipeQuantitiesCompanion Function({
      Value<int> recipeID,
      Value<int> foodID,
      Value<double> quantity,
      Value<int> rowid,
    });

final class $$RecipeQuantitiesTableReferences
    extends
        BaseReferences<_$AppDatabase, $RecipeQuantitiesTable, RecipeQuantity> {
  $$RecipeQuantitiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeTable _recipeIDTable(_$AppDatabase db) => db.recipe.createAlias(
    'recipe_quantities__recipe_i_d__recipe__recipe_i_d',
  );

  $$RecipeTableProcessedTableManager get recipeID {
    final $_column = $_itemColumn<int>('recipe_i_d')!;

    final manager = $$RecipeTableTableManager(
      $_db,
      $_db.recipe,
    ).filter((f) => f.recipeID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FoodTable _foodIDTable(_$AppDatabase db) =>
      db.food.createAlias('recipe_quantities__food_i_d__food__food_i_d');

  $$FoodTableProcessedTableManager get foodID {
    final $_column = $_itemColumn<int>('food_i_d')!;

    final manager = $$FoodTableTableManager(
      $_db,
      $_db.food,
    ).filter((f) => f.foodID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_foodIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeQuantitiesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeQuantitiesTable> {
  $$RecipeQuantitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipeTableFilterComposer get recipeID {
    final $$RecipeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableFilterComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodTableFilterComposer get foodID {
    final $$FoodTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableFilterComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeQuantitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeQuantitiesTable> {
  $$RecipeQuantitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipeTableOrderingComposer get recipeID {
    final $$RecipeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableOrderingComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodTableOrderingComposer get foodID {
    final $$FoodTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableOrderingComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeQuantitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeQuantitiesTable> {
  $$RecipeQuantitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$RecipeTableAnnotationComposer get recipeID {
    final $$RecipeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableAnnotationComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodTableAnnotationComposer get foodID {
    final $$FoodTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableAnnotationComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeQuantitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeQuantitiesTable,
          RecipeQuantity,
          $$RecipeQuantitiesTableFilterComposer,
          $$RecipeQuantitiesTableOrderingComposer,
          $$RecipeQuantitiesTableAnnotationComposer,
          $$RecipeQuantitiesTableCreateCompanionBuilder,
          $$RecipeQuantitiesTableUpdateCompanionBuilder,
          (RecipeQuantity, $$RecipeQuantitiesTableReferences),
          RecipeQuantity,
          PrefetchHooks Function({bool recipeID, bool foodID})
        > {
  $$RecipeQuantitiesTableTableManager(
    _$AppDatabase db,
    $RecipeQuantitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeQuantitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeQuantitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeQuantitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> recipeID = const Value.absent(),
                Value<int> foodID = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeQuantitiesCompanion(
                recipeID: recipeID,
                foodID: foodID,
                quantity: quantity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int recipeID,
                required int foodID,
                Value<double> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeQuantitiesCompanion.insert(
                recipeID: recipeID,
                foodID: foodID,
                quantity: quantity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeQuantitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeID = false, foodID = false}) {
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
                    if (recipeID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeID,
                                referencedTable:
                                    $$RecipeQuantitiesTableReferences
                                        ._recipeIDTable(db),
                                referencedColumn:
                                    $$RecipeQuantitiesTableReferences
                                        ._recipeIDTable(db)
                                        .recipeID,
                              )
                              as T;
                    }
                    if (foodID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.foodID,
                                referencedTable:
                                    $$RecipeQuantitiesTableReferences
                                        ._foodIDTable(db),
                                referencedColumn:
                                    $$RecipeQuantitiesTableReferences
                                        ._foodIDTable(db)
                                        .foodID,
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

typedef $$RecipeQuantitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeQuantitiesTable,
      RecipeQuantity,
      $$RecipeQuantitiesTableFilterComposer,
      $$RecipeQuantitiesTableOrderingComposer,
      $$RecipeQuantitiesTableAnnotationComposer,
      $$RecipeQuantitiesTableCreateCompanionBuilder,
      $$RecipeQuantitiesTableUpdateCompanionBuilder,
      (RecipeQuantity, $$RecipeQuantitiesTableReferences),
      RecipeQuantity,
      PrefetchHooks Function({bool recipeID, bool foodID})
    >;
typedef $$NutritionLogTableCreateCompanionBuilder =
    NutritionLogCompanion Function({
      Value<int> nutritionLogID,
      required int userID,
      Value<DateTime> logDateTime,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protien,
      Value<double> fibre,
      Value<int> calories,
    });
typedef $$NutritionLogTableUpdateCompanionBuilder =
    NutritionLogCompanion Function({
      Value<int> nutritionLogID,
      Value<int> userID,
      Value<DateTime> logDateTime,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protien,
      Value<double> fibre,
      Value<int> calories,
    });

final class $$NutritionLogTableReferences
    extends
        BaseReferences<_$AppDatabase, $NutritionLogTable, NutritionLogData> {
  $$NutritionLogTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('nutrition_log__user_i_d__users__user_i_d');

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

class $$NutritionLogTableFilterComposer
    extends Composer<_$AppDatabase, $NutritionLogTable> {
  $$NutritionLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get nutritionLogID => $composableBuilder(
    column: $table.nutritionLogID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get logDateTime => $composableBuilder(
    column: $table.logDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protien => $composableBuilder(
    column: $table.protien,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fibre => $composableBuilder(
    column: $table.fibre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get calories => $composableBuilder(
    column: $table.calories,
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

class $$NutritionLogTableOrderingComposer
    extends Composer<_$AppDatabase, $NutritionLogTable> {
  $$NutritionLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get nutritionLogID => $composableBuilder(
    column: $table.nutritionLogID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get logDateTime => $composableBuilder(
    column: $table.logDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protien => $composableBuilder(
    column: $table.protien,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fibre => $composableBuilder(
    column: $table.fibre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calories => $composableBuilder(
    column: $table.calories,
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

class $$NutritionLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutritionLogTable> {
  $$NutritionLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get nutritionLogID => $composableBuilder(
    column: $table.nutritionLogID,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get logDateTime => $composableBuilder(
    column: $table.logDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get protien =>
      $composableBuilder(column: $table.protien, builder: (column) => column);

  GeneratedColumn<double> get fibre =>
      $composableBuilder(column: $table.fibre, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

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

class $$NutritionLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NutritionLogTable,
          NutritionLogData,
          $$NutritionLogTableFilterComposer,
          $$NutritionLogTableOrderingComposer,
          $$NutritionLogTableAnnotationComposer,
          $$NutritionLogTableCreateCompanionBuilder,
          $$NutritionLogTableUpdateCompanionBuilder,
          (NutritionLogData, $$NutritionLogTableReferences),
          NutritionLogData,
          PrefetchHooks Function({bool userID})
        > {
  $$NutritionLogTableTableManager(_$AppDatabase db, $NutritionLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutritionLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutritionLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutritionLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> nutritionLogID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<DateTime> logDateTime = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protien = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<int> calories = const Value.absent(),
              }) => NutritionLogCompanion(
                nutritionLogID: nutritionLogID,
                userID: userID,
                logDateTime: logDateTime,
                carbs: carbs,
                fat: fat,
                protien: protien,
                fibre: fibre,
                calories: calories,
              ),
          createCompanionCallback:
              ({
                Value<int> nutritionLogID = const Value.absent(),
                required int userID,
                Value<DateTime> logDateTime = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protien = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<int> calories = const Value.absent(),
              }) => NutritionLogCompanion.insert(
                nutritionLogID: nutritionLogID,
                userID: userID,
                logDateTime: logDateTime,
                carbs: carbs,
                fat: fat,
                protien: protien,
                fibre: fibre,
                calories: calories,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NutritionLogTableReferences(db, table, e),
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
                                referencedTable: $$NutritionLogTableReferences
                                    ._userIDTable(db),
                                referencedColumn: $$NutritionLogTableReferences
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

typedef $$NutritionLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NutritionLogTable,
      NutritionLogData,
      $$NutritionLogTableFilterComposer,
      $$NutritionLogTableOrderingComposer,
      $$NutritionLogTableAnnotationComposer,
      $$NutritionLogTableCreateCompanionBuilder,
      $$NutritionLogTableUpdateCompanionBuilder,
      (NutritionLogData, $$NutritionLogTableReferences),
      NutritionLogData,
      PrefetchHooks Function({bool userID})
    >;
typedef $$MealRecipeContentTableCreateCompanionBuilder =
    MealRecipeContentCompanion Function({
      required int mealID,
      required int recipeID,
      Value<double> quantity,
      Value<int> rowid,
    });
typedef $$MealRecipeContentTableUpdateCompanionBuilder =
    MealRecipeContentCompanion Function({
      Value<int> mealID,
      Value<int> recipeID,
      Value<double> quantity,
      Value<int> rowid,
    });

final class $$MealRecipeContentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MealRecipeContentTable,
          MealRecipeContentData
        > {
  $$MealRecipeContentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MealsTable _mealIDTable(_$AppDatabase db) =>
      db.meals.createAlias('meal_recipe_content__meal_i_d__meals__meal_i_d');

  $$MealsTableProcessedTableManager get mealID {
    final $_column = $_itemColumn<int>('meal_i_d')!;

    final manager = $$MealsTableTableManager(
      $_db,
      $_db.meals,
    ).filter((f) => f.mealID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipeTable _recipeIDTable(_$AppDatabase db) => db.recipe.createAlias(
    'meal_recipe_content__recipe_i_d__recipe__recipe_i_d',
  );

  $$RecipeTableProcessedTableManager get recipeID {
    final $_column = $_itemColumn<int>('recipe_i_d')!;

    final manager = $$RecipeTableTableManager(
      $_db,
      $_db.recipe,
    ).filter((f) => f.recipeID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealRecipeContentTableFilterComposer
    extends Composer<_$AppDatabase, $MealRecipeContentTable> {
  $$MealRecipeContentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  $$MealsTableFilterComposer get mealID {
    final $$MealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableFilterComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeTableFilterComposer get recipeID {
    final $$RecipeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableFilterComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealRecipeContentTableOrderingComposer
    extends Composer<_$AppDatabase, $MealRecipeContentTable> {
  $$MealRecipeContentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealsTableOrderingComposer get mealID {
    final $$MealsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableOrderingComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeTableOrderingComposer get recipeID {
    final $$RecipeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableOrderingComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealRecipeContentTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealRecipeContentTable> {
  $$MealRecipeContentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$MealsTableAnnotationComposer get mealID {
    final $$MealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableAnnotationComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeTableAnnotationComposer get recipeID {
    final $$RecipeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeID,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.recipeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableAnnotationComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealRecipeContentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealRecipeContentTable,
          MealRecipeContentData,
          $$MealRecipeContentTableFilterComposer,
          $$MealRecipeContentTableOrderingComposer,
          $$MealRecipeContentTableAnnotationComposer,
          $$MealRecipeContentTableCreateCompanionBuilder,
          $$MealRecipeContentTableUpdateCompanionBuilder,
          (MealRecipeContentData, $$MealRecipeContentTableReferences),
          MealRecipeContentData,
          PrefetchHooks Function({bool mealID, bool recipeID})
        > {
  $$MealRecipeContentTableTableManager(
    _$AppDatabase db,
    $MealRecipeContentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealRecipeContentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealRecipeContentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealRecipeContentTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> mealID = const Value.absent(),
                Value<int> recipeID = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealRecipeContentCompanion(
                mealID: mealID,
                recipeID: recipeID,
                quantity: quantity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int mealID,
                required int recipeID,
                Value<double> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealRecipeContentCompanion.insert(
                mealID: mealID,
                recipeID: recipeID,
                quantity: quantity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealRecipeContentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealID = false, recipeID = false}) {
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
                    if (mealID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mealID,
                                referencedTable:
                                    $$MealRecipeContentTableReferences
                                        ._mealIDTable(db),
                                referencedColumn:
                                    $$MealRecipeContentTableReferences
                                        ._mealIDTable(db)
                                        .mealID,
                              )
                              as T;
                    }
                    if (recipeID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeID,
                                referencedTable:
                                    $$MealRecipeContentTableReferences
                                        ._recipeIDTable(db),
                                referencedColumn:
                                    $$MealRecipeContentTableReferences
                                        ._recipeIDTable(db)
                                        .recipeID,
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

typedef $$MealRecipeContentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealRecipeContentTable,
      MealRecipeContentData,
      $$MealRecipeContentTableFilterComposer,
      $$MealRecipeContentTableOrderingComposer,
      $$MealRecipeContentTableAnnotationComposer,
      $$MealRecipeContentTableCreateCompanionBuilder,
      $$MealRecipeContentTableUpdateCompanionBuilder,
      (MealRecipeContentData, $$MealRecipeContentTableReferences),
      MealRecipeContentData,
      PrefetchHooks Function({bool mealID, bool recipeID})
    >;
typedef $$MealFoodContentTableCreateCompanionBuilder =
    MealFoodContentCompanion Function({
      required int mealID,
      required int foodID,
      Value<double> quantity,
      Value<int> rowid,
    });
typedef $$MealFoodContentTableUpdateCompanionBuilder =
    MealFoodContentCompanion Function({
      Value<int> mealID,
      Value<int> foodID,
      Value<double> quantity,
      Value<int> rowid,
    });

final class $$MealFoodContentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MealFoodContentTable,
          MealFoodContentData
        > {
  $$MealFoodContentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MealsTable _mealIDTable(_$AppDatabase db) =>
      db.meals.createAlias('meal_food_content__meal_i_d__meals__meal_i_d');

  $$MealsTableProcessedTableManager get mealID {
    final $_column = $_itemColumn<int>('meal_i_d')!;

    final manager = $$MealsTableTableManager(
      $_db,
      $_db.meals,
    ).filter((f) => f.mealID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FoodTable _foodIDTable(_$AppDatabase db) =>
      db.food.createAlias('meal_food_content__food_i_d__food__food_i_d');

  $$FoodTableProcessedTableManager get foodID {
    final $_column = $_itemColumn<int>('food_i_d')!;

    final manager = $$FoodTableTableManager(
      $_db,
      $_db.food,
    ).filter((f) => f.foodID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_foodIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealFoodContentTableFilterComposer
    extends Composer<_$AppDatabase, $MealFoodContentTable> {
  $$MealFoodContentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  $$MealsTableFilterComposer get mealID {
    final $$MealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableFilterComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodTableFilterComposer get foodID {
    final $$FoodTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableFilterComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealFoodContentTableOrderingComposer
    extends Composer<_$AppDatabase, $MealFoodContentTable> {
  $$MealFoodContentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealsTableOrderingComposer get mealID {
    final $$MealsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableOrderingComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodTableOrderingComposer get foodID {
    final $$FoodTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableOrderingComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealFoodContentTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealFoodContentTable> {
  $$MealFoodContentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$MealsTableAnnotationComposer get mealID {
    final $$MealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealID,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.mealID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableAnnotationComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodTableAnnotationComposer get foodID {
    final $$FoodTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodID,
      referencedTable: $db.food,
      getReferencedColumn: (t) => t.foodID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodTableAnnotationComposer(
            $db: $db,
            $table: $db.food,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealFoodContentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealFoodContentTable,
          MealFoodContentData,
          $$MealFoodContentTableFilterComposer,
          $$MealFoodContentTableOrderingComposer,
          $$MealFoodContentTableAnnotationComposer,
          $$MealFoodContentTableCreateCompanionBuilder,
          $$MealFoodContentTableUpdateCompanionBuilder,
          (MealFoodContentData, $$MealFoodContentTableReferences),
          MealFoodContentData,
          PrefetchHooks Function({bool mealID, bool foodID})
        > {
  $$MealFoodContentTableTableManager(
    _$AppDatabase db,
    $MealFoodContentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealFoodContentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealFoodContentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealFoodContentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> mealID = const Value.absent(),
                Value<int> foodID = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealFoodContentCompanion(
                mealID: mealID,
                foodID: foodID,
                quantity: quantity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int mealID,
                required int foodID,
                Value<double> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealFoodContentCompanion.insert(
                mealID: mealID,
                foodID: foodID,
                quantity: quantity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealFoodContentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealID = false, foodID = false}) {
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
                    if (mealID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mealID,
                                referencedTable:
                                    $$MealFoodContentTableReferences
                                        ._mealIDTable(db),
                                referencedColumn:
                                    $$MealFoodContentTableReferences
                                        ._mealIDTable(db)
                                        .mealID,
                              )
                              as T;
                    }
                    if (foodID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.foodID,
                                referencedTable:
                                    $$MealFoodContentTableReferences
                                        ._foodIDTable(db),
                                referencedColumn:
                                    $$MealFoodContentTableReferences
                                        ._foodIDTable(db)
                                        .foodID,
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

typedef $$MealFoodContentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealFoodContentTable,
      MealFoodContentData,
      $$MealFoodContentTableFilterComposer,
      $$MealFoodContentTableOrderingComposer,
      $$MealFoodContentTableAnnotationComposer,
      $$MealFoodContentTableCreateCompanionBuilder,
      $$MealFoodContentTableUpdateCompanionBuilder,
      (MealFoodContentData, $$MealFoodContentTableReferences),
      MealFoodContentData,
      PrefetchHooks Function({bool mealID, bool foodID})
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
  $$FoodTableTableManager get food => $$FoodTableTableManager(_db, _db.food);
  $$RecipeTableTableManager get recipe =>
      $$RecipeTableTableManager(_db, _db.recipe);
  $$MealsTableTableManager get meals =>
      $$MealsTableTableManager(_db, _db.meals);
  $$RecipeQuantitiesTableTableManager get recipeQuantities =>
      $$RecipeQuantitiesTableTableManager(_db, _db.recipeQuantities);
  $$NutritionLogTableTableManager get nutritionLog =>
      $$NutritionLogTableTableManager(_db, _db.nutritionLog);
  $$MealRecipeContentTableTableManager get mealRecipeContent =>
      $$MealRecipeContentTableTableManager(_db, _db.mealRecipeContent);
  $$MealFoodContentTableTableManager get mealFoodContent =>
      $$MealFoodContentTableTableManager(_db, _db.mealFoodContent);
}
