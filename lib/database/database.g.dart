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
  static const VerificationMeta _fastResultMeta = const VerificationMeta(
    'fastResult',
  );
  @override
  late final GeneratedColumn<String> fastResult = GeneratedColumn<String>(
    'fast_result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    fastLogID,
    userID,
    formIF,
    fastResult,
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
    if (data.containsKey('fast_result')) {
      context.handle(
        _fastResultMeta,
        fastResult.isAcceptableOrUnknown(data['fast_result']!, _fastResultMeta),
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
      fastResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fast_result'],
      )!,
      startDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date_time'],
      )!,
      endDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date_time'],
      ),
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
  final String fastResult;
  final DateTime startDateTime;
  final DateTime? endDateTime;
  const FastLogData({
    required this.fastLogID,
    required this.userID,
    required this.formIF,
    required this.fastResult,
    required this.startDateTime,
    this.endDateTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['fast_log_i_d'] = Variable<int>(fastLogID);
    map['user_i_d'] = Variable<int>(userID);
    map['form_i_f'] = Variable<String>(formIF);
    map['fast_result'] = Variable<String>(fastResult);
    map['start_date_time'] = Variable<DateTime>(startDateTime);
    if (!nullToAbsent || endDateTime != null) {
      map['end_date_time'] = Variable<DateTime>(endDateTime);
    }
    return map;
  }

  FastLogCompanion toCompanion(bool nullToAbsent) {
    return FastLogCompanion(
      fastLogID: Value(fastLogID),
      userID: Value(userID),
      formIF: Value(formIF),
      fastResult: Value(fastResult),
      startDateTime: Value(startDateTime),
      endDateTime: endDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endDateTime),
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
      fastResult: serializer.fromJson<String>(json['fastResult']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      endDateTime: serializer.fromJson<DateTime?>(json['endDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fastLogID': serializer.toJson<int>(fastLogID),
      'userID': serializer.toJson<int>(userID),
      'formIF': serializer.toJson<String>(formIF),
      'fastResult': serializer.toJson<String>(fastResult),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'endDateTime': serializer.toJson<DateTime?>(endDateTime),
    };
  }

  FastLogData copyWith({
    int? fastLogID,
    int? userID,
    String? formIF,
    String? fastResult,
    DateTime? startDateTime,
    Value<DateTime?> endDateTime = const Value.absent(),
  }) => FastLogData(
    fastLogID: fastLogID ?? this.fastLogID,
    userID: userID ?? this.userID,
    formIF: formIF ?? this.formIF,
    fastResult: fastResult ?? this.fastResult,
    startDateTime: startDateTime ?? this.startDateTime,
    endDateTime: endDateTime.present ? endDateTime.value : this.endDateTime,
  );
  FastLogData copyWithCompanion(FastLogCompanion data) {
    return FastLogData(
      fastLogID: data.fastLogID.present ? data.fastLogID.value : this.fastLogID,
      userID: data.userID.present ? data.userID.value : this.userID,
      formIF: data.formIF.present ? data.formIF.value : this.formIF,
      fastResult: data.fastResult.present
          ? data.fastResult.value
          : this.fastResult,
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
          ..write('fastResult: $fastResult, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    fastLogID,
    userID,
    formIF,
    fastResult,
    startDateTime,
    endDateTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FastLogData &&
          other.fastLogID == this.fastLogID &&
          other.userID == this.userID &&
          other.formIF == this.formIF &&
          other.fastResult == this.fastResult &&
          other.startDateTime == this.startDateTime &&
          other.endDateTime == this.endDateTime);
}

class FastLogCompanion extends UpdateCompanion<FastLogData> {
  final Value<int> fastLogID;
  final Value<int> userID;
  final Value<String> formIF;
  final Value<String> fastResult;
  final Value<DateTime> startDateTime;
  final Value<DateTime?> endDateTime;
  const FastLogCompanion({
    this.fastLogID = const Value.absent(),
    this.userID = const Value.absent(),
    this.formIF = const Value.absent(),
    this.fastResult = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  });
  FastLogCompanion.insert({
    this.fastLogID = const Value.absent(),
    required int userID,
    this.formIF = const Value.absent(),
    this.fastResult = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<FastLogData> custom({
    Expression<int>? fastLogID,
    Expression<int>? userID,
    Expression<String>? formIF,
    Expression<String>? fastResult,
    Expression<DateTime>? startDateTime,
    Expression<DateTime>? endDateTime,
  }) {
    return RawValuesInsertable({
      if (fastLogID != null) 'fast_log_i_d': fastLogID,
      if (userID != null) 'user_i_d': userID,
      if (formIF != null) 'form_i_f': formIF,
      if (fastResult != null) 'fast_result': fastResult,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (endDateTime != null) 'end_date_time': endDateTime,
    });
  }

  FastLogCompanion copyWith({
    Value<int>? fastLogID,
    Value<int>? userID,
    Value<String>? formIF,
    Value<String>? fastResult,
    Value<DateTime>? startDateTime,
    Value<DateTime?>? endDateTime,
  }) {
    return FastLogCompanion(
      fastLogID: fastLogID ?? this.fastLogID,
      userID: userID ?? this.userID,
      formIF: formIF ?? this.formIF,
      fastResult: fastResult ?? this.fastResult,
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
    if (fastResult.present) {
      map['fast_result'] = Variable<String>(fastResult.value);
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
          ..write('fastResult: $fastResult, ')
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingDescriptionMeta =
      const VerificationMeta('servingDescription');
  @override
  late final GeneratedColumn<String> servingDescription =
      GeneratedColumn<String>(
        'serving_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _servingGramsMeta = const VerificationMeta(
    'servingGrams',
  );
  @override
  late final GeneratedColumn<int> servingGrams = GeneratedColumn<int>(
    'serving_grams',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
    name,
    servingDescription,
    servingGrams,
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('serving_description')) {
      context.handle(
        _servingDescriptionMeta,
        servingDescription.isAcceptableOrUnknown(
          data['serving_description']!,
          _servingDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingDescriptionMeta);
    }
    if (data.containsKey('serving_grams')) {
      context.handle(
        _servingGramsMeta,
        servingGrams.isAcceptableOrUnknown(
          data['serving_grams']!,
          _servingGramsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingGramsMeta);
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      servingDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serving_description'],
      )!,
      servingGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}serving_grams'],
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
  final String name;
  final String servingDescription;
  final int servingGrams;
  final double carbs;
  final double fat;
  final double protein;
  final double fibre;
  final double calories;
  const FoodData({
    required this.foodID,
    required this.name,
    required this.servingDescription,
    required this.servingGrams,
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
    map['name'] = Variable<String>(name);
    map['serving_description'] = Variable<String>(servingDescription);
    map['serving_grams'] = Variable<int>(servingGrams);
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
      name: Value(name),
      servingDescription: Value(servingDescription),
      servingGrams: Value(servingGrams),
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
      name: serializer.fromJson<String>(json['name']),
      servingDescription: serializer.fromJson<String>(
        json['servingDescription'],
      ),
      servingGrams: serializer.fromJson<int>(json['servingGrams']),
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
      'name': serializer.toJson<String>(name),
      'servingDescription': serializer.toJson<String>(servingDescription),
      'servingGrams': serializer.toJson<int>(servingGrams),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'protein': serializer.toJson<double>(protein),
      'fibre': serializer.toJson<double>(fibre),
      'calories': serializer.toJson<double>(calories),
    };
  }

  FoodData copyWith({
    int? foodID,
    String? name,
    String? servingDescription,
    int? servingGrams,
    double? carbs,
    double? fat,
    double? protein,
    double? fibre,
    double? calories,
  }) => FoodData(
    foodID: foodID ?? this.foodID,
    name: name ?? this.name,
    servingDescription: servingDescription ?? this.servingDescription,
    servingGrams: servingGrams ?? this.servingGrams,
    carbs: carbs ?? this.carbs,
    fat: fat ?? this.fat,
    protein: protein ?? this.protein,
    fibre: fibre ?? this.fibre,
    calories: calories ?? this.calories,
  );
  FoodData copyWithCompanion(FoodCompanion data) {
    return FoodData(
      foodID: data.foodID.present ? data.foodID.value : this.foodID,
      name: data.name.present ? data.name.value : this.name,
      servingDescription: data.servingDescription.present
          ? data.servingDescription.value
          : this.servingDescription,
      servingGrams: data.servingGrams.present
          ? data.servingGrams.value
          : this.servingGrams,
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
          ..write('name: $name, ')
          ..write('servingDescription: $servingDescription, ')
          ..write('servingGrams: $servingGrams, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('protein: $protein, ')
          ..write('fibre: $fibre, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    foodID,
    name,
    servingDescription,
    servingGrams,
    carbs,
    fat,
    protein,
    fibre,
    calories,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodData &&
          other.foodID == this.foodID &&
          other.name == this.name &&
          other.servingDescription == this.servingDescription &&
          other.servingGrams == this.servingGrams &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.protein == this.protein &&
          other.fibre == this.fibre &&
          other.calories == this.calories);
}

class FoodCompanion extends UpdateCompanion<FoodData> {
  final Value<int> foodID;
  final Value<String> name;
  final Value<String> servingDescription;
  final Value<int> servingGrams;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double> protein;
  final Value<double> fibre;
  final Value<double> calories;
  const FoodCompanion({
    this.foodID = const Value.absent(),
    this.name = const Value.absent(),
    this.servingDescription = const Value.absent(),
    this.servingGrams = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  });
  FoodCompanion.insert({
    this.foodID = const Value.absent(),
    required String name,
    required String servingDescription,
    required int servingGrams,
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  }) : name = Value(name),
       servingDescription = Value(servingDescription),
       servingGrams = Value(servingGrams);
  static Insertable<FoodData> custom({
    Expression<int>? foodID,
    Expression<String>? name,
    Expression<String>? servingDescription,
    Expression<int>? servingGrams,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? protein,
    Expression<double>? fibre,
    Expression<double>? calories,
  }) {
    return RawValuesInsertable({
      if (foodID != null) 'food_i_d': foodID,
      if (name != null) 'name': name,
      if (servingDescription != null) 'serving_description': servingDescription,
      if (servingGrams != null) 'serving_grams': servingGrams,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (protein != null) 'protein': protein,
      if (fibre != null) 'fibre': fibre,
      if (calories != null) 'calories': calories,
    });
  }

  FoodCompanion copyWith({
    Value<int>? foodID,
    Value<String>? name,
    Value<String>? servingDescription,
    Value<int>? servingGrams,
    Value<double>? carbs,
    Value<double>? fat,
    Value<double>? protein,
    Value<double>? fibre,
    Value<double>? calories,
  }) {
    return FoodCompanion(
      foodID: foodID ?? this.foodID,
      name: name ?? this.name,
      servingDescription: servingDescription ?? this.servingDescription,
      servingGrams: servingGrams ?? this.servingGrams,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (servingDescription.present) {
      map['serving_description'] = Variable<String>(servingDescription.value);
    }
    if (servingGrams.present) {
      map['serving_grams'] = Variable<int>(servingGrams.value);
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
          ..write('name: $name, ')
          ..write('servingDescription: $servingDescription, ')
          ..write('servingGrams: $servingGrams, ')
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
  static const VerificationMeta _mealTypeMeta = const VerificationMeta(
    'mealType',
  );
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
    'meal_type',
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
    mealType,
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
    if (data.containsKey('meal_type')) {
      context.handle(
        _mealTypeMeta,
        mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta),
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
      mealType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_type'],
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
  final String mealType;
  final double amount;
  const Meal({
    required this.mealID,
    required this.userID,
    required this.date,
    required this.inEatingWindow,
    required this.logMethod,
    required this.mealType,
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
    map['meal_type'] = Variable<String>(mealType);
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
      mealType: Value(mealType),
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
      mealType: serializer.fromJson<String>(json['mealType']),
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
      'mealType': serializer.toJson<String>(mealType),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Meal copyWith({
    int? mealID,
    int? userID,
    DateTime? date,
    bool? inEatingWindow,
    String? logMethod,
    String? mealType,
    double? amount,
  }) => Meal(
    mealID: mealID ?? this.mealID,
    userID: userID ?? this.userID,
    date: date ?? this.date,
    inEatingWindow: inEatingWindow ?? this.inEatingWindow,
    logMethod: logMethod ?? this.logMethod,
    mealType: mealType ?? this.mealType,
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
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
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
          ..write('mealType: $mealType, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    mealID,
    userID,
    date,
    inEatingWindow,
    logMethod,
    mealType,
    amount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.mealID == this.mealID &&
          other.userID == this.userID &&
          other.date == this.date &&
          other.inEatingWindow == this.inEatingWindow &&
          other.logMethod == this.logMethod &&
          other.mealType == this.mealType &&
          other.amount == this.amount);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> mealID;
  final Value<int> userID;
  final Value<DateTime> date;
  final Value<bool> inEatingWindow;
  final Value<String> logMethod;
  final Value<String> mealType;
  final Value<double> amount;
  const MealsCompanion({
    this.mealID = const Value.absent(),
    this.userID = const Value.absent(),
    this.date = const Value.absent(),
    this.inEatingWindow = const Value.absent(),
    this.logMethod = const Value.absent(),
    this.mealType = const Value.absent(),
    this.amount = const Value.absent(),
  });
  MealsCompanion.insert({
    this.mealID = const Value.absent(),
    required int userID,
    this.date = const Value.absent(),
    this.inEatingWindow = const Value.absent(),
    this.logMethod = const Value.absent(),
    this.mealType = const Value.absent(),
    this.amount = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<Meal> custom({
    Expression<int>? mealID,
    Expression<int>? userID,
    Expression<DateTime>? date,
    Expression<bool>? inEatingWindow,
    Expression<String>? logMethod,
    Expression<String>? mealType,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (mealID != null) 'meal_i_d': mealID,
      if (userID != null) 'user_i_d': userID,
      if (date != null) 'date': date,
      if (inEatingWindow != null) 'in_eating_window': inEatingWindow,
      if (logMethod != null) 'log_method': logMethod,
      if (mealType != null) 'meal_type': mealType,
      if (amount != null) 'amount': amount,
    });
  }

  MealsCompanion copyWith({
    Value<int>? mealID,
    Value<int>? userID,
    Value<DateTime>? date,
    Value<bool>? inEatingWindow,
    Value<String>? logMethod,
    Value<String>? mealType,
    Value<double>? amount,
  }) {
    return MealsCompanion(
      mealID: mealID ?? this.mealID,
      userID: userID ?? this.userID,
      date: date ?? this.date,
      inEatingWindow: inEatingWindow ?? this.inEatingWindow,
      logMethod: logMethod ?? this.logMethod,
      mealType: mealType ?? this.mealType,
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
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
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
          ..write('mealType: $mealType, ')
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

class $StreaksTable extends Streaks with TableInfo<$StreaksTable, Streak> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreaksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _streakIDMeta = const VerificationMeta(
    'streakID',
  );
  @override
  late final GeneratedColumn<int> streakID = GeneratedColumn<int>(
    'streak_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _streakProgressMeta = const VerificationMeta(
    'streakProgress',
  );
  @override
  late final GeneratedColumn<int> streakProgress = GeneratedColumn<int>(
    'streak_progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bestStreakMeta = const VerificationMeta(
    'bestStreak',
  );
  @override
  late final GeneratedColumn<int> bestStreak = GeneratedColumn<int>(
    'best_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<StreakType, String> streakType =
      GeneratedColumn<String>(
        'streak_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<StreakType>($StreaksTable.$converterstreakType);
  @override
  late final GeneratedColumnWithTypeConverter<UnlockType?, String> unlockType =
      GeneratedColumn<String>(
        'unlock_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<UnlockType?>($StreaksTable.$converterunlockTypen);
  @override
  List<GeneratedColumn> get $columns => [
    streakID,
    streakProgress,
    bestStreak,
    startDate,
    endDate,
    streakType,
    unlockType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streaks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Streak> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('streak_i_d')) {
      context.handle(
        _streakIDMeta,
        streakID.isAcceptableOrUnknown(data['streak_i_d']!, _streakIDMeta),
      );
    }
    if (data.containsKey('streak_progress')) {
      context.handle(
        _streakProgressMeta,
        streakProgress.isAcceptableOrUnknown(
          data['streak_progress']!,
          _streakProgressMeta,
        ),
      );
    }
    if (data.containsKey('best_streak')) {
      context.handle(
        _bestStreakMeta,
        bestStreak.isAcceptableOrUnknown(data['best_streak']!, _bestStreakMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {streakID};
  @override
  Streak map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Streak(
      streakID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_i_d'],
      )!,
      streakProgress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_progress'],
      )!,
      bestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}best_streak'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      streakType: $StreaksTable.$converterstreakType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}streak_type'],
        )!,
      ),
      unlockType: $StreaksTable.$converterunlockTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unlock_type'],
        ),
      ),
    );
  }

  @override
  $StreaksTable createAlias(String alias) {
    return $StreaksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<StreakType, String, String> $converterstreakType =
      const EnumNameConverter<StreakType>(StreakType.values);
  static JsonTypeConverter2<UnlockType, String, String> $converterunlockType =
      const EnumNameConverter<UnlockType>(UnlockType.values);
  static JsonTypeConverter2<UnlockType?, String?, String?>
  $converterunlockTypen = JsonTypeConverter2.asNullable($converterunlockType);
}

class Streak extends DataClass implements Insertable<Streak> {
  final int streakID;
  final int streakProgress;
  final int bestStreak;
  final DateTime? startDate;
  final DateTime? endDate;
  final StreakType streakType;
  final UnlockType? unlockType;
  const Streak({
    required this.streakID,
    required this.streakProgress,
    required this.bestStreak,
    this.startDate,
    this.endDate,
    required this.streakType,
    this.unlockType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['streak_i_d'] = Variable<int>(streakID);
    map['streak_progress'] = Variable<int>(streakProgress);
    map['best_streak'] = Variable<int>(bestStreak);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    {
      map['streak_type'] = Variable<String>(
        $StreaksTable.$converterstreakType.toSql(streakType),
      );
    }
    if (!nullToAbsent || unlockType != null) {
      map['unlock_type'] = Variable<String>(
        $StreaksTable.$converterunlockTypen.toSql(unlockType),
      );
    }
    return map;
  }

  StreaksCompanion toCompanion(bool nullToAbsent) {
    return StreaksCompanion(
      streakID: Value(streakID),
      streakProgress: Value(streakProgress),
      bestStreak: Value(bestStreak),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      streakType: Value(streakType),
      unlockType: unlockType == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockType),
    );
  }

  factory Streak.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Streak(
      streakID: serializer.fromJson<int>(json['streakID']),
      streakProgress: serializer.fromJson<int>(json['streakProgress']),
      bestStreak: serializer.fromJson<int>(json['bestStreak']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      streakType: $StreaksTable.$converterstreakType.fromJson(
        serializer.fromJson<String>(json['streakType']),
      ),
      unlockType: $StreaksTable.$converterunlockTypen.fromJson(
        serializer.fromJson<String?>(json['unlockType']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'streakID': serializer.toJson<int>(streakID),
      'streakProgress': serializer.toJson<int>(streakProgress),
      'bestStreak': serializer.toJson<int>(bestStreak),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'streakType': serializer.toJson<String>(
        $StreaksTable.$converterstreakType.toJson(streakType),
      ),
      'unlockType': serializer.toJson<String?>(
        $StreaksTable.$converterunlockTypen.toJson(unlockType),
      ),
    };
  }

  Streak copyWith({
    int? streakID,
    int? streakProgress,
    int? bestStreak,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    StreakType? streakType,
    Value<UnlockType?> unlockType = const Value.absent(),
  }) => Streak(
    streakID: streakID ?? this.streakID,
    streakProgress: streakProgress ?? this.streakProgress,
    bestStreak: bestStreak ?? this.bestStreak,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    streakType: streakType ?? this.streakType,
    unlockType: unlockType.present ? unlockType.value : this.unlockType,
  );
  Streak copyWithCompanion(StreaksCompanion data) {
    return Streak(
      streakID: data.streakID.present ? data.streakID.value : this.streakID,
      streakProgress: data.streakProgress.present
          ? data.streakProgress.value
          : this.streakProgress,
      bestStreak: data.bestStreak.present
          ? data.bestStreak.value
          : this.bestStreak,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      streakType: data.streakType.present
          ? data.streakType.value
          : this.streakType,
      unlockType: data.unlockType.present
          ? data.unlockType.value
          : this.unlockType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Streak(')
          ..write('streakID: $streakID, ')
          ..write('streakProgress: $streakProgress, ')
          ..write('bestStreak: $bestStreak, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('streakType: $streakType, ')
          ..write('unlockType: $unlockType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    streakID,
    streakProgress,
    bestStreak,
    startDate,
    endDate,
    streakType,
    unlockType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Streak &&
          other.streakID == this.streakID &&
          other.streakProgress == this.streakProgress &&
          other.bestStreak == this.bestStreak &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.streakType == this.streakType &&
          other.unlockType == this.unlockType);
}

class StreaksCompanion extends UpdateCompanion<Streak> {
  final Value<int> streakID;
  final Value<int> streakProgress;
  final Value<int> bestStreak;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<StreakType> streakType;
  final Value<UnlockType?> unlockType;
  const StreaksCompanion({
    this.streakID = const Value.absent(),
    this.streakProgress = const Value.absent(),
    this.bestStreak = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.streakType = const Value.absent(),
    this.unlockType = const Value.absent(),
  });
  StreaksCompanion.insert({
    this.streakID = const Value.absent(),
    this.streakProgress = const Value.absent(),
    this.bestStreak = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    required StreakType streakType,
    this.unlockType = const Value.absent(),
  }) : streakType = Value(streakType);
  static Insertable<Streak> custom({
    Expression<int>? streakID,
    Expression<int>? streakProgress,
    Expression<int>? bestStreak,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? streakType,
    Expression<String>? unlockType,
  }) {
    return RawValuesInsertable({
      if (streakID != null) 'streak_i_d': streakID,
      if (streakProgress != null) 'streak_progress': streakProgress,
      if (bestStreak != null) 'best_streak': bestStreak,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (streakType != null) 'streak_type': streakType,
      if (unlockType != null) 'unlock_type': unlockType,
    });
  }

  StreaksCompanion copyWith({
    Value<int>? streakID,
    Value<int>? streakProgress,
    Value<int>? bestStreak,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<StreakType>? streakType,
    Value<UnlockType?>? unlockType,
  }) {
    return StreaksCompanion(
      streakID: streakID ?? this.streakID,
      streakProgress: streakProgress ?? this.streakProgress,
      bestStreak: bestStreak ?? this.bestStreak,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      streakType: streakType ?? this.streakType,
      unlockType: unlockType ?? this.unlockType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (streakID.present) {
      map['streak_i_d'] = Variable<int>(streakID.value);
    }
    if (streakProgress.present) {
      map['streak_progress'] = Variable<int>(streakProgress.value);
    }
    if (bestStreak.present) {
      map['best_streak'] = Variable<int>(bestStreak.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (streakType.present) {
      map['streak_type'] = Variable<String>(
        $StreaksTable.$converterstreakType.toSql(streakType.value),
      );
    }
    if (unlockType.present) {
      map['unlock_type'] = Variable<String>(
        $StreaksTable.$converterunlockTypen.toSql(unlockType.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreaksCompanion(')
          ..write('streakID: $streakID, ')
          ..write('streakProgress: $streakProgress, ')
          ..write('bestStreak: $bestStreak, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('streakType: $streakType, ')
          ..write('unlockType: $unlockType')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<int> goalID = GeneratedColumn<int>(
    'goal_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<GoalType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<GoalType>($GoalsTable.$convertertype);
  static const VerificationMeta _thresholdValueMeta = const VerificationMeta(
    'thresholdValue',
  );
  @override
  late final GeneratedColumn<double> thresholdValue = GeneratedColumn<double>(
    'threshold_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metricTypeMeta = const VerificationMeta(
    'metricType',
  );
  @override
  late final GeneratedColumn<String> metricType = GeneratedColumn<String>(
    'metric_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operatorMeta = const VerificationMeta(
    'operator',
  );
  @override
  late final GeneratedColumn<String> operator = GeneratedColumn<String>(
    'operator',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _streakIDMeta = const VerificationMeta(
    'streakID',
  );
  @override
  late final GeneratedColumn<int> streakID = GeneratedColumn<int>(
    'streak_i_d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES streaks (streak_i_d)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    goalID,
    type,
    thresholdValue,
    metricType,
    operator,
    streakID,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    }
    if (data.containsKey('threshold_value')) {
      context.handle(
        _thresholdValueMeta,
        thresholdValue.isAcceptableOrUnknown(
          data['threshold_value']!,
          _thresholdValueMeta,
        ),
      );
    }
    if (data.containsKey('metric_type')) {
      context.handle(
        _metricTypeMeta,
        metricType.isAcceptableOrUnknown(data['metric_type']!, _metricTypeMeta),
      );
    }
    if (data.containsKey('operator')) {
      context.handle(
        _operatorMeta,
        operator.isAcceptableOrUnknown(data['operator']!, _operatorMeta),
      );
    }
    if (data.containsKey('streak_i_d')) {
      context.handle(
        _streakIDMeta,
        streakID.isAcceptableOrUnknown(data['streak_i_d']!, _streakIDMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {goalID};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      type: $GoalsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      thresholdValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}threshold_value'],
      ),
      metricType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metric_type'],
      ),
      operator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operator'],
      ),
      streakID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_i_d'],
      ),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GoalType, String, String> $convertertype =
      const EnumNameConverter<GoalType>(GoalType.values);
}

class Goal extends DataClass implements Insertable<Goal> {
  final int goalID;
  final GoalType type;
  final double? thresholdValue;
  final String? metricType;
  final String? operator;
  final int? streakID;
  const Goal({
    required this.goalID,
    required this.type,
    this.thresholdValue,
    this.metricType,
    this.operator,
    this.streakID,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    {
      map['type'] = Variable<String>($GoalsTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || thresholdValue != null) {
      map['threshold_value'] = Variable<double>(thresholdValue);
    }
    if (!nullToAbsent || metricType != null) {
      map['metric_type'] = Variable<String>(metricType);
    }
    if (!nullToAbsent || operator != null) {
      map['operator'] = Variable<String>(operator);
    }
    if (!nullToAbsent || streakID != null) {
      map['streak_i_d'] = Variable<int>(streakID);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      goalID: Value(goalID),
      type: Value(type),
      thresholdValue: thresholdValue == null && nullToAbsent
          ? const Value.absent()
          : Value(thresholdValue),
      metricType: metricType == null && nullToAbsent
          ? const Value.absent()
          : Value(metricType),
      operator: operator == null && nullToAbsent
          ? const Value.absent()
          : Value(operator),
      streakID: streakID == null && nullToAbsent
          ? const Value.absent()
          : Value(streakID),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      goalID: serializer.fromJson<int>(json['goalID']),
      type: $GoalsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      thresholdValue: serializer.fromJson<double?>(json['thresholdValue']),
      metricType: serializer.fromJson<String?>(json['metricType']),
      operator: serializer.fromJson<String?>(json['operator']),
      streakID: serializer.fromJson<int?>(json['streakID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'type': serializer.toJson<String>(
        $GoalsTable.$convertertype.toJson(type),
      ),
      'thresholdValue': serializer.toJson<double?>(thresholdValue),
      'metricType': serializer.toJson<String?>(metricType),
      'operator': serializer.toJson<String?>(operator),
      'streakID': serializer.toJson<int?>(streakID),
    };
  }

  Goal copyWith({
    int? goalID,
    GoalType? type,
    Value<double?> thresholdValue = const Value.absent(),
    Value<String?> metricType = const Value.absent(),
    Value<String?> operator = const Value.absent(),
    Value<int?> streakID = const Value.absent(),
  }) => Goal(
    goalID: goalID ?? this.goalID,
    type: type ?? this.type,
    thresholdValue: thresholdValue.present
        ? thresholdValue.value
        : this.thresholdValue,
    metricType: metricType.present ? metricType.value : this.metricType,
    operator: operator.present ? operator.value : this.operator,
    streakID: streakID.present ? streakID.value : this.streakID,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      type: data.type.present ? data.type.value : this.type,
      thresholdValue: data.thresholdValue.present
          ? data.thresholdValue.value
          : this.thresholdValue,
      metricType: data.metricType.present
          ? data.metricType.value
          : this.metricType,
      operator: data.operator.present ? data.operator.value : this.operator,
      streakID: data.streakID.present ? data.streakID.value : this.streakID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('goalID: $goalID, ')
          ..write('type: $type, ')
          ..write('thresholdValue: $thresholdValue, ')
          ..write('metricType: $metricType, ')
          ..write('operator: $operator, ')
          ..write('streakID: $streakID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(goalID, type, thresholdValue, metricType, operator, streakID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.goalID == this.goalID &&
          other.type == this.type &&
          other.thresholdValue == this.thresholdValue &&
          other.metricType == this.metricType &&
          other.operator == this.operator &&
          other.streakID == this.streakID);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> goalID;
  final Value<GoalType> type;
  final Value<double?> thresholdValue;
  final Value<String?> metricType;
  final Value<String?> operator;
  final Value<int?> streakID;
  const GoalsCompanion({
    this.goalID = const Value.absent(),
    this.type = const Value.absent(),
    this.thresholdValue = const Value.absent(),
    this.metricType = const Value.absent(),
    this.operator = const Value.absent(),
    this.streakID = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.goalID = const Value.absent(),
    required GoalType type,
    this.thresholdValue = const Value.absent(),
    this.metricType = const Value.absent(),
    this.operator = const Value.absent(),
    this.streakID = const Value.absent(),
  }) : type = Value(type);
  static Insertable<Goal> custom({
    Expression<int>? goalID,
    Expression<String>? type,
    Expression<double>? thresholdValue,
    Expression<String>? metricType,
    Expression<String>? operator,
    Expression<int>? streakID,
  }) {
    return RawValuesInsertable({
      if (goalID != null) 'goal_i_d': goalID,
      if (type != null) 'type': type,
      if (thresholdValue != null) 'threshold_value': thresholdValue,
      if (metricType != null) 'metric_type': metricType,
      if (operator != null) 'operator': operator,
      if (streakID != null) 'streak_i_d': streakID,
    });
  }

  GoalsCompanion copyWith({
    Value<int>? goalID,
    Value<GoalType>? type,
    Value<double?>? thresholdValue,
    Value<String?>? metricType,
    Value<String?>? operator,
    Value<int?>? streakID,
  }) {
    return GoalsCompanion(
      goalID: goalID ?? this.goalID,
      type: type ?? this.type,
      thresholdValue: thresholdValue ?? this.thresholdValue,
      metricType: metricType ?? this.metricType,
      operator: operator ?? this.operator,
      streakID: streakID ?? this.streakID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $GoalsTable.$convertertype.toSql(type.value),
      );
    }
    if (thresholdValue.present) {
      map['threshold_value'] = Variable<double>(thresholdValue.value);
    }
    if (metricType.present) {
      map['metric_type'] = Variable<String>(metricType.value);
    }
    if (operator.present) {
      map['operator'] = Variable<String>(operator.value);
    }
    if (streakID.present) {
      map['streak_i_d'] = Variable<int>(streakID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('goalID: $goalID, ')
          ..write('type: $type, ')
          ..write('thresholdValue: $thresholdValue, ')
          ..write('metricType: $metricType, ')
          ..write('operator: $operator, ')
          ..write('streakID: $streakID')
          ..write(')'))
        .toString();
  }
}

class $FastingGoalsTable extends FastingGoals
    with TableInfo<$FastingGoalsTable, FastingGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FastingGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<int> goalID = GeneratedColumn<int>(
    'goal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (goal_i_d)',
    ),
  );
  static const VerificationMeta _targetHoursMeta = const VerificationMeta(
    'targetHours',
  );
  @override
  late final GeneratedColumn<double> targetHours = GeneratedColumn<double>(
    'target_hours',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDaysMeta = const VerificationMeta(
    'targetDays',
  );
  @override
  late final GeneratedColumn<int> targetDays = GeneratedColumn<int>(
    'target_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetCaloriesMeta = const VerificationMeta(
    'targetCalories',
  );
  @override
  late final GeneratedColumn<int> targetCalories = GeneratedColumn<int>(
    'target_calories',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    goalID,
    targetHours,
    targetDays,
    targetCalories,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fasting_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<FastingGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    }
    if (data.containsKey('target_hours')) {
      context.handle(
        _targetHoursMeta,
        targetHours.isAcceptableOrUnknown(
          data['target_hours']!,
          _targetHoursMeta,
        ),
      );
    }
    if (data.containsKey('target_days')) {
      context.handle(
        _targetDaysMeta,
        targetDays.isAcceptableOrUnknown(data['target_days']!, _targetDaysMeta),
      );
    }
    if (data.containsKey('target_calories')) {
      context.handle(
        _targetCaloriesMeta,
        targetCalories.isAcceptableOrUnknown(
          data['target_calories']!,
          _targetCaloriesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {goalID};
  @override
  FastingGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FastingGoal(
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      targetHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_hours'],
      ),
      targetDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_days'],
      ),
      targetCalories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_calories'],
      ),
    );
  }

  @override
  $FastingGoalsTable createAlias(String alias) {
    return $FastingGoalsTable(attachedDatabase, alias);
  }
}

class FastingGoal extends DataClass implements Insertable<FastingGoal> {
  final int goalID;
  final double? targetHours;
  final int? targetDays;
  final int? targetCalories;
  const FastingGoal({
    required this.goalID,
    this.targetHours,
    this.targetDays,
    this.targetCalories,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    if (!nullToAbsent || targetHours != null) {
      map['target_hours'] = Variable<double>(targetHours);
    }
    if (!nullToAbsent || targetDays != null) {
      map['target_days'] = Variable<int>(targetDays);
    }
    if (!nullToAbsent || targetCalories != null) {
      map['target_calories'] = Variable<int>(targetCalories);
    }
    return map;
  }

  FastingGoalsCompanion toCompanion(bool nullToAbsent) {
    return FastingGoalsCompanion(
      goalID: Value(goalID),
      targetHours: targetHours == null && nullToAbsent
          ? const Value.absent()
          : Value(targetHours),
      targetDays: targetDays == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDays),
      targetCalories: targetCalories == null && nullToAbsent
          ? const Value.absent()
          : Value(targetCalories),
    );
  }

  factory FastingGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FastingGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      targetHours: serializer.fromJson<double?>(json['targetHours']),
      targetDays: serializer.fromJson<int?>(json['targetDays']),
      targetCalories: serializer.fromJson<int?>(json['targetCalories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'targetHours': serializer.toJson<double?>(targetHours),
      'targetDays': serializer.toJson<int?>(targetDays),
      'targetCalories': serializer.toJson<int?>(targetCalories),
    };
  }

  FastingGoal copyWith({
    int? goalID,
    Value<double?> targetHours = const Value.absent(),
    Value<int?> targetDays = const Value.absent(),
    Value<int?> targetCalories = const Value.absent(),
  }) => FastingGoal(
    goalID: goalID ?? this.goalID,
    targetHours: targetHours.present ? targetHours.value : this.targetHours,
    targetDays: targetDays.present ? targetDays.value : this.targetDays,
    targetCalories: targetCalories.present
        ? targetCalories.value
        : this.targetCalories,
  );
  FastingGoal copyWithCompanion(FastingGoalsCompanion data) {
    return FastingGoal(
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      targetHours: data.targetHours.present
          ? data.targetHours.value
          : this.targetHours,
      targetDays: data.targetDays.present
          ? data.targetDays.value
          : this.targetDays,
      targetCalories: data.targetCalories.present
          ? data.targetCalories.value
          : this.targetCalories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FastingGoal(')
          ..write('goalID: $goalID, ')
          ..write('targetHours: $targetHours, ')
          ..write('targetDays: $targetDays, ')
          ..write('targetCalories: $targetCalories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(goalID, targetHours, targetDays, targetCalories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FastingGoal &&
          other.goalID == this.goalID &&
          other.targetHours == this.targetHours &&
          other.targetDays == this.targetDays &&
          other.targetCalories == this.targetCalories);
}

class FastingGoalsCompanion extends UpdateCompanion<FastingGoal> {
  final Value<int> goalID;
  final Value<double?> targetHours;
  final Value<int?> targetDays;
  final Value<int?> targetCalories;
  const FastingGoalsCompanion({
    this.goalID = const Value.absent(),
    this.targetHours = const Value.absent(),
    this.targetDays = const Value.absent(),
    this.targetCalories = const Value.absent(),
  });
  FastingGoalsCompanion.insert({
    this.goalID = const Value.absent(),
    this.targetHours = const Value.absent(),
    this.targetDays = const Value.absent(),
    this.targetCalories = const Value.absent(),
  });
  static Insertable<FastingGoal> custom({
    Expression<int>? goalID,
    Expression<double>? targetHours,
    Expression<int>? targetDays,
    Expression<int>? targetCalories,
  }) {
    return RawValuesInsertable({
      if (goalID != null) 'goal_i_d': goalID,
      if (targetHours != null) 'target_hours': targetHours,
      if (targetDays != null) 'target_days': targetDays,
      if (targetCalories != null) 'target_calories': targetCalories,
    });
  }

  FastingGoalsCompanion copyWith({
    Value<int>? goalID,
    Value<double?>? targetHours,
    Value<int?>? targetDays,
    Value<int?>? targetCalories,
  }) {
    return FastingGoalsCompanion(
      goalID: goalID ?? this.goalID,
      targetHours: targetHours ?? this.targetHours,
      targetDays: targetDays ?? this.targetDays,
      targetCalories: targetCalories ?? this.targetCalories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (targetHours.present) {
      map['target_hours'] = Variable<double>(targetHours.value);
    }
    if (targetDays.present) {
      map['target_days'] = Variable<int>(targetDays.value);
    }
    if (targetCalories.present) {
      map['target_calories'] = Variable<int>(targetCalories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FastingGoalsCompanion(')
          ..write('goalID: $goalID, ')
          ..write('targetHours: $targetHours, ')
          ..write('targetDays: $targetDays, ')
          ..write('targetCalories: $targetCalories')
          ..write(')'))
        .toString();
  }
}

class $WeightGoalsTable extends WeightGoals
    with TableInfo<$WeightGoalsTable, WeightGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<int> goalID = GeneratedColumn<int>(
    'goal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (goal_i_d)',
    ),
  );
  static const VerificationMeta _targetWeightMeta = const VerificationMeta(
    'targetWeight',
  );
  @override
  late final GeneratedColumn<double> targetWeight = GeneratedColumn<double>(
    'target_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startWeightMeta = const VerificationMeta(
    'startWeight',
  );
  @override
  late final GeneratedColumn<double> startWeight = GeneratedColumn<double>(
    'start_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [goalID, targetWeight, startWeight];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeightGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    }
    if (data.containsKey('target_weight')) {
      context.handle(
        _targetWeightMeta,
        targetWeight.isAcceptableOrUnknown(
          data['target_weight']!,
          _targetWeightMeta,
        ),
      );
    }
    if (data.containsKey('start_weight')) {
      context.handle(
        _startWeightMeta,
        startWeight.isAcceptableOrUnknown(
          data['start_weight']!,
          _startWeightMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {goalID};
  @override
  WeightGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightGoal(
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      targetWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_weight'],
      ),
      startWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_weight'],
      ),
    );
  }

  @override
  $WeightGoalsTable createAlias(String alias) {
    return $WeightGoalsTable(attachedDatabase, alias);
  }
}

class WeightGoal extends DataClass implements Insertable<WeightGoal> {
  final int goalID;
  final double? targetWeight;
  final double? startWeight;
  const WeightGoal({required this.goalID, this.targetWeight, this.startWeight});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    if (!nullToAbsent || targetWeight != null) {
      map['target_weight'] = Variable<double>(targetWeight);
    }
    if (!nullToAbsent || startWeight != null) {
      map['start_weight'] = Variable<double>(startWeight);
    }
    return map;
  }

  WeightGoalsCompanion toCompanion(bool nullToAbsent) {
    return WeightGoalsCompanion(
      goalID: Value(goalID),
      targetWeight: targetWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(targetWeight),
      startWeight: startWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(startWeight),
    );
  }

  factory WeightGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      targetWeight: serializer.fromJson<double?>(json['targetWeight']),
      startWeight: serializer.fromJson<double?>(json['startWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'targetWeight': serializer.toJson<double?>(targetWeight),
      'startWeight': serializer.toJson<double?>(startWeight),
    };
  }

  WeightGoal copyWith({
    int? goalID,
    Value<double?> targetWeight = const Value.absent(),
    Value<double?> startWeight = const Value.absent(),
  }) => WeightGoal(
    goalID: goalID ?? this.goalID,
    targetWeight: targetWeight.present ? targetWeight.value : this.targetWeight,
    startWeight: startWeight.present ? startWeight.value : this.startWeight,
  );
  WeightGoal copyWithCompanion(WeightGoalsCompanion data) {
    return WeightGoal(
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      targetWeight: data.targetWeight.present
          ? data.targetWeight.value
          : this.targetWeight,
      startWeight: data.startWeight.present
          ? data.startWeight.value
          : this.startWeight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightGoal(')
          ..write('goalID: $goalID, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('startWeight: $startWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(goalID, targetWeight, startWeight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightGoal &&
          other.goalID == this.goalID &&
          other.targetWeight == this.targetWeight &&
          other.startWeight == this.startWeight);
}

class WeightGoalsCompanion extends UpdateCompanion<WeightGoal> {
  final Value<int> goalID;
  final Value<double?> targetWeight;
  final Value<double?> startWeight;
  const WeightGoalsCompanion({
    this.goalID = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.startWeight = const Value.absent(),
  });
  WeightGoalsCompanion.insert({
    this.goalID = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.startWeight = const Value.absent(),
  });
  static Insertable<WeightGoal> custom({
    Expression<int>? goalID,
    Expression<double>? targetWeight,
    Expression<double>? startWeight,
  }) {
    return RawValuesInsertable({
      if (goalID != null) 'goal_i_d': goalID,
      if (targetWeight != null) 'target_weight': targetWeight,
      if (startWeight != null) 'start_weight': startWeight,
    });
  }

  WeightGoalsCompanion copyWith({
    Value<int>? goalID,
    Value<double?>? targetWeight,
    Value<double?>? startWeight,
  }) {
    return WeightGoalsCompanion(
      goalID: goalID ?? this.goalID,
      targetWeight: targetWeight ?? this.targetWeight,
      startWeight: startWeight ?? this.startWeight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (targetWeight.present) {
      map['target_weight'] = Variable<double>(targetWeight.value);
    }
    if (startWeight.present) {
      map['start_weight'] = Variable<double>(startWeight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightGoalsCompanion(')
          ..write('goalID: $goalID, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('startWeight: $startWeight')
          ..write(')'))
        .toString();
  }
}

class $HydrationGoalsTable extends HydrationGoals
    with TableInfo<$HydrationGoalsTable, HydrationGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HydrationGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<int> goalID = GeneratedColumn<int>(
    'goal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (goal_i_d)',
    ),
  );
  static const VerificationMeta _hdrAmountMeta = const VerificationMeta(
    'hdrAmount',
  );
  @override
  late final GeneratedColumn<int> hdrAmount = GeneratedColumn<int>(
    'hdr_amount',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hdrDateMeta = const VerificationMeta(
    'hdrDate',
  );
  @override
  late final GeneratedColumn<DateTime> hdrDate = GeneratedColumn<DateTime>(
    'hdr_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [goalID, hdrAmount, hdrDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hydration_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<HydrationGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    }
    if (data.containsKey('hdr_amount')) {
      context.handle(
        _hdrAmountMeta,
        hdrAmount.isAcceptableOrUnknown(data['hdr_amount']!, _hdrAmountMeta),
      );
    }
    if (data.containsKey('hdr_date')) {
      context.handle(
        _hdrDateMeta,
        hdrDate.isAcceptableOrUnknown(data['hdr_date']!, _hdrDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {goalID};
  @override
  HydrationGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HydrationGoal(
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      hdrAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hdr_amount'],
      ),
      hdrDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hdr_date'],
      ),
    );
  }

  @override
  $HydrationGoalsTable createAlias(String alias) {
    return $HydrationGoalsTable(attachedDatabase, alias);
  }
}

class HydrationGoal extends DataClass implements Insertable<HydrationGoal> {
  final int goalID;
  final int? hdrAmount;
  final DateTime? hdrDate;
  const HydrationGoal({required this.goalID, this.hdrAmount, this.hdrDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    if (!nullToAbsent || hdrAmount != null) {
      map['hdr_amount'] = Variable<int>(hdrAmount);
    }
    if (!nullToAbsent || hdrDate != null) {
      map['hdr_date'] = Variable<DateTime>(hdrDate);
    }
    return map;
  }

  HydrationGoalsCompanion toCompanion(bool nullToAbsent) {
    return HydrationGoalsCompanion(
      goalID: Value(goalID),
      hdrAmount: hdrAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(hdrAmount),
      hdrDate: hdrDate == null && nullToAbsent
          ? const Value.absent()
          : Value(hdrDate),
    );
  }

  factory HydrationGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HydrationGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      hdrAmount: serializer.fromJson<int?>(json['hdrAmount']),
      hdrDate: serializer.fromJson<DateTime?>(json['hdrDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'hdrAmount': serializer.toJson<int?>(hdrAmount),
      'hdrDate': serializer.toJson<DateTime?>(hdrDate),
    };
  }

  HydrationGoal copyWith({
    int? goalID,
    Value<int?> hdrAmount = const Value.absent(),
    Value<DateTime?> hdrDate = const Value.absent(),
  }) => HydrationGoal(
    goalID: goalID ?? this.goalID,
    hdrAmount: hdrAmount.present ? hdrAmount.value : this.hdrAmount,
    hdrDate: hdrDate.present ? hdrDate.value : this.hdrDate,
  );
  HydrationGoal copyWithCompanion(HydrationGoalsCompanion data) {
    return HydrationGoal(
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      hdrAmount: data.hdrAmount.present ? data.hdrAmount.value : this.hdrAmount,
      hdrDate: data.hdrDate.present ? data.hdrDate.value : this.hdrDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HydrationGoal(')
          ..write('goalID: $goalID, ')
          ..write('hdrAmount: $hdrAmount, ')
          ..write('hdrDate: $hdrDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(goalID, hdrAmount, hdrDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HydrationGoal &&
          other.goalID == this.goalID &&
          other.hdrAmount == this.hdrAmount &&
          other.hdrDate == this.hdrDate);
}

class HydrationGoalsCompanion extends UpdateCompanion<HydrationGoal> {
  final Value<int> goalID;
  final Value<int?> hdrAmount;
  final Value<DateTime?> hdrDate;
  const HydrationGoalsCompanion({
    this.goalID = const Value.absent(),
    this.hdrAmount = const Value.absent(),
    this.hdrDate = const Value.absent(),
  });
  HydrationGoalsCompanion.insert({
    this.goalID = const Value.absent(),
    this.hdrAmount = const Value.absent(),
    this.hdrDate = const Value.absent(),
  });
  static Insertable<HydrationGoal> custom({
    Expression<int>? goalID,
    Expression<int>? hdrAmount,
    Expression<DateTime>? hdrDate,
  }) {
    return RawValuesInsertable({
      if (goalID != null) 'goal_i_d': goalID,
      if (hdrAmount != null) 'hdr_amount': hdrAmount,
      if (hdrDate != null) 'hdr_date': hdrDate,
    });
  }

  HydrationGoalsCompanion copyWith({
    Value<int>? goalID,
    Value<int?>? hdrAmount,
    Value<DateTime?>? hdrDate,
  }) {
    return HydrationGoalsCompanion(
      goalID: goalID ?? this.goalID,
      hdrAmount: hdrAmount ?? this.hdrAmount,
      hdrDate: hdrDate ?? this.hdrDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (hdrAmount.present) {
      map['hdr_amount'] = Variable<int>(hdrAmount.value);
    }
    if (hdrDate.present) {
      map['hdr_date'] = Variable<DateTime>(hdrDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HydrationGoalsCompanion(')
          ..write('goalID: $goalID, ')
          ..write('hdrAmount: $hdrAmount, ')
          ..write('hdrDate: $hdrDate')
          ..write(')'))
        .toString();
  }
}

class $NutritionGoalsTable extends NutritionGoals
    with TableInfo<$NutritionGoalsTable, NutritionGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutritionGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<int> goalID = GeneratedColumn<int>(
    'goal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (goal_i_d)',
    ),
  );
  static const VerificationMeta _nutrientTypeMeta = const VerificationMeta(
    'nutrientType',
  );
  @override
  late final GeneratedColumn<String> nutrientType = GeneratedColumn<String>(
    'nutrient_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nutritionDailyTargetMeta =
      const VerificationMeta('nutritionDailyTarget');
  @override
  late final GeneratedColumn<int> nutritionDailyTarget = GeneratedColumn<int>(
    'nutrition_daily_target',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    goalID,
    nutrientType,
    nutritionDailyTarget,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrition_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<NutritionGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    }
    if (data.containsKey('nutrient_type')) {
      context.handle(
        _nutrientTypeMeta,
        nutrientType.isAcceptableOrUnknown(
          data['nutrient_type']!,
          _nutrientTypeMeta,
        ),
      );
    }
    if (data.containsKey('nutrition_daily_target')) {
      context.handle(
        _nutritionDailyTargetMeta,
        nutritionDailyTarget.isAcceptableOrUnknown(
          data['nutrition_daily_target']!,
          _nutritionDailyTargetMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {goalID};
  @override
  NutritionGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutritionGoal(
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      nutrientType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrient_type'],
      ),
      nutritionDailyTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nutrition_daily_target'],
      ),
    );
  }

  @override
  $NutritionGoalsTable createAlias(String alias) {
    return $NutritionGoalsTable(attachedDatabase, alias);
  }
}

class NutritionGoal extends DataClass implements Insertable<NutritionGoal> {
  final int goalID;
  final String? nutrientType;
  final int? nutritionDailyTarget;
  const NutritionGoal({
    required this.goalID,
    this.nutrientType,
    this.nutritionDailyTarget,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    if (!nullToAbsent || nutrientType != null) {
      map['nutrient_type'] = Variable<String>(nutrientType);
    }
    if (!nullToAbsent || nutritionDailyTarget != null) {
      map['nutrition_daily_target'] = Variable<int>(nutritionDailyTarget);
    }
    return map;
  }

  NutritionGoalsCompanion toCompanion(bool nullToAbsent) {
    return NutritionGoalsCompanion(
      goalID: Value(goalID),
      nutrientType: nutrientType == null && nullToAbsent
          ? const Value.absent()
          : Value(nutrientType),
      nutritionDailyTarget: nutritionDailyTarget == null && nullToAbsent
          ? const Value.absent()
          : Value(nutritionDailyTarget),
    );
  }

  factory NutritionGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutritionGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      nutrientType: serializer.fromJson<String?>(json['nutrientType']),
      nutritionDailyTarget: serializer.fromJson<int?>(
        json['nutritionDailyTarget'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'nutrientType': serializer.toJson<String?>(nutrientType),
      'nutritionDailyTarget': serializer.toJson<int?>(nutritionDailyTarget),
    };
  }

  NutritionGoal copyWith({
    int? goalID,
    Value<String?> nutrientType = const Value.absent(),
    Value<int?> nutritionDailyTarget = const Value.absent(),
  }) => NutritionGoal(
    goalID: goalID ?? this.goalID,
    nutrientType: nutrientType.present ? nutrientType.value : this.nutrientType,
    nutritionDailyTarget: nutritionDailyTarget.present
        ? nutritionDailyTarget.value
        : this.nutritionDailyTarget,
  );
  NutritionGoal copyWithCompanion(NutritionGoalsCompanion data) {
    return NutritionGoal(
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      nutrientType: data.nutrientType.present
          ? data.nutrientType.value
          : this.nutrientType,
      nutritionDailyTarget: data.nutritionDailyTarget.present
          ? data.nutritionDailyTarget.value
          : this.nutritionDailyTarget,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutritionGoal(')
          ..write('goalID: $goalID, ')
          ..write('nutrientType: $nutrientType, ')
          ..write('nutritionDailyTarget: $nutritionDailyTarget')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(goalID, nutrientType, nutritionDailyTarget);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutritionGoal &&
          other.goalID == this.goalID &&
          other.nutrientType == this.nutrientType &&
          other.nutritionDailyTarget == this.nutritionDailyTarget);
}

class NutritionGoalsCompanion extends UpdateCompanion<NutritionGoal> {
  final Value<int> goalID;
  final Value<String?> nutrientType;
  final Value<int?> nutritionDailyTarget;
  const NutritionGoalsCompanion({
    this.goalID = const Value.absent(),
    this.nutrientType = const Value.absent(),
    this.nutritionDailyTarget = const Value.absent(),
  });
  NutritionGoalsCompanion.insert({
    this.goalID = const Value.absent(),
    this.nutrientType = const Value.absent(),
    this.nutritionDailyTarget = const Value.absent(),
  });
  static Insertable<NutritionGoal> custom({
    Expression<int>? goalID,
    Expression<String>? nutrientType,
    Expression<int>? nutritionDailyTarget,
  }) {
    return RawValuesInsertable({
      if (goalID != null) 'goal_i_d': goalID,
      if (nutrientType != null) 'nutrient_type': nutrientType,
      if (nutritionDailyTarget != null)
        'nutrition_daily_target': nutritionDailyTarget,
    });
  }

  NutritionGoalsCompanion copyWith({
    Value<int>? goalID,
    Value<String?>? nutrientType,
    Value<int?>? nutritionDailyTarget,
  }) {
    return NutritionGoalsCompanion(
      goalID: goalID ?? this.goalID,
      nutrientType: nutrientType ?? this.nutrientType,
      nutritionDailyTarget: nutritionDailyTarget ?? this.nutritionDailyTarget,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (nutrientType.present) {
      map['nutrient_type'] = Variable<String>(nutrientType.value);
    }
    if (nutritionDailyTarget.present) {
      map['nutrition_daily_target'] = Variable<int>(nutritionDailyTarget.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutritionGoalsCompanion(')
          ..write('goalID: $goalID, ')
          ..write('nutrientType: $nutrientType, ')
          ..write('nutritionDailyTarget: $nutritionDailyTarget')
          ..write(')'))
        .toString();
  }
}

class $UserGoalProgressTable extends UserGoalProgress
    with TableInfo<$UserGoalProgressTable, UserGoalProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserGoalProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userGoalIDMeta = const VerificationMeta(
    'userGoalID',
  );
  @override
  late final GeneratedColumn<int> userGoalID = GeneratedColumn<int>(
    'user_goal_i_d',
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
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<int> goalID = GeneratedColumn<int>(
    'goal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (goal_i_d)',
    ),
  );
  static const VerificationMeta _dateCreatedMeta = const VerificationMeta(
    'dateCreated',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
    'date_created',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isMainMeta = const VerificationMeta('isMain');
  @override
  late final GeneratedColumn<bool> isMain = GeneratedColumn<bool>(
    'is_main',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_main" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isCompleteMeta = const VerificationMeta(
    'isComplete',
  );
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
    'is_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _progressValueMeta = const VerificationMeta(
    'progressValue',
  );
  @override
  late final GeneratedColumn<double> progressValue = GeneratedColumn<double>(
    'progress_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userGoalID,
    userID,
    goalID,
    dateCreated,
    isMain,
    isComplete,
    progressValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_goal_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserGoalProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_goal_i_d')) {
      context.handle(
        _userGoalIDMeta,
        userGoalID.isAcceptableOrUnknown(
          data['user_goal_i_d']!,
          _userGoalIDMeta,
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
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIDMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
        _dateCreatedMeta,
        dateCreated.isAcceptableOrUnknown(
          data['date_created']!,
          _dateCreatedMeta,
        ),
      );
    }
    if (data.containsKey('is_main')) {
      context.handle(
        _isMainMeta,
        isMain.isAcceptableOrUnknown(data['is_main']!, _isMainMeta),
      );
    }
    if (data.containsKey('is_complete')) {
      context.handle(
        _isCompleteMeta,
        isComplete.isAcceptableOrUnknown(data['is_complete']!, _isCompleteMeta),
      );
    }
    if (data.containsKey('progress_value')) {
      context.handle(
        _progressValueMeta,
        progressValue.isAcceptableOrUnknown(
          data['progress_value']!,
          _progressValueMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userGoalID};
  @override
  UserGoalProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserGoalProgressData(
      userGoalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_goal_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      dateCreated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_created'],
      )!,
      isMain: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_main'],
      )!,
      isComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_complete'],
      )!,
      progressValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress_value'],
      )!,
    );
  }

  @override
  $UserGoalProgressTable createAlias(String alias) {
    return $UserGoalProgressTable(attachedDatabase, alias);
  }
}

class UserGoalProgressData extends DataClass
    implements Insertable<UserGoalProgressData> {
  final int userGoalID;
  final int userID;
  final int goalID;
  final DateTime dateCreated;
  final bool isMain;
  final bool isComplete;
  final double progressValue;
  const UserGoalProgressData({
    required this.userGoalID,
    required this.userID,
    required this.goalID,
    required this.dateCreated,
    required this.isMain,
    required this.isComplete,
    required this.progressValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_goal_i_d'] = Variable<int>(userGoalID);
    map['user_i_d'] = Variable<int>(userID);
    map['goal_i_d'] = Variable<int>(goalID);
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['is_main'] = Variable<bool>(isMain);
    map['is_complete'] = Variable<bool>(isComplete);
    map['progress_value'] = Variable<double>(progressValue);
    return map;
  }

  UserGoalProgressCompanion toCompanion(bool nullToAbsent) {
    return UserGoalProgressCompanion(
      userGoalID: Value(userGoalID),
      userID: Value(userID),
      goalID: Value(goalID),
      dateCreated: Value(dateCreated),
      isMain: Value(isMain),
      isComplete: Value(isComplete),
      progressValue: Value(progressValue),
    );
  }

  factory UserGoalProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserGoalProgressData(
      userGoalID: serializer.fromJson<int>(json['userGoalID']),
      userID: serializer.fromJson<int>(json['userID']),
      goalID: serializer.fromJson<int>(json['goalID']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      isMain: serializer.fromJson<bool>(json['isMain']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      progressValue: serializer.fromJson<double>(json['progressValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userGoalID': serializer.toJson<int>(userGoalID),
      'userID': serializer.toJson<int>(userID),
      'goalID': serializer.toJson<int>(goalID),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'isMain': serializer.toJson<bool>(isMain),
      'isComplete': serializer.toJson<bool>(isComplete),
      'progressValue': serializer.toJson<double>(progressValue),
    };
  }

  UserGoalProgressData copyWith({
    int? userGoalID,
    int? userID,
    int? goalID,
    DateTime? dateCreated,
    bool? isMain,
    bool? isComplete,
    double? progressValue,
  }) => UserGoalProgressData(
    userGoalID: userGoalID ?? this.userGoalID,
    userID: userID ?? this.userID,
    goalID: goalID ?? this.goalID,
    dateCreated: dateCreated ?? this.dateCreated,
    isMain: isMain ?? this.isMain,
    isComplete: isComplete ?? this.isComplete,
    progressValue: progressValue ?? this.progressValue,
  );
  UserGoalProgressData copyWithCompanion(UserGoalProgressCompanion data) {
    return UserGoalProgressData(
      userGoalID: data.userGoalID.present
          ? data.userGoalID.value
          : this.userGoalID,
      userID: data.userID.present ? data.userID.value : this.userID,
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      dateCreated: data.dateCreated.present
          ? data.dateCreated.value
          : this.dateCreated,
      isMain: data.isMain.present ? data.isMain.value : this.isMain,
      isComplete: data.isComplete.present
          ? data.isComplete.value
          : this.isComplete,
      progressValue: data.progressValue.present
          ? data.progressValue.value
          : this.progressValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserGoalProgressData(')
          ..write('userGoalID: $userGoalID, ')
          ..write('userID: $userID, ')
          ..write('goalID: $goalID, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('isMain: $isMain, ')
          ..write('isComplete: $isComplete, ')
          ..write('progressValue: $progressValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userGoalID,
    userID,
    goalID,
    dateCreated,
    isMain,
    isComplete,
    progressValue,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserGoalProgressData &&
          other.userGoalID == this.userGoalID &&
          other.userID == this.userID &&
          other.goalID == this.goalID &&
          other.dateCreated == this.dateCreated &&
          other.isMain == this.isMain &&
          other.isComplete == this.isComplete &&
          other.progressValue == this.progressValue);
}

class UserGoalProgressCompanion extends UpdateCompanion<UserGoalProgressData> {
  final Value<int> userGoalID;
  final Value<int> userID;
  final Value<int> goalID;
  final Value<DateTime> dateCreated;
  final Value<bool> isMain;
  final Value<bool> isComplete;
  final Value<double> progressValue;
  const UserGoalProgressCompanion({
    this.userGoalID = const Value.absent(),
    this.userID = const Value.absent(),
    this.goalID = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.isMain = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.progressValue = const Value.absent(),
  });
  UserGoalProgressCompanion.insert({
    this.userGoalID = const Value.absent(),
    required int userID,
    required int goalID,
    this.dateCreated = const Value.absent(),
    this.isMain = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.progressValue = const Value.absent(),
  }) : userID = Value(userID),
       goalID = Value(goalID);
  static Insertable<UserGoalProgressData> custom({
    Expression<int>? userGoalID,
    Expression<int>? userID,
    Expression<int>? goalID,
    Expression<DateTime>? dateCreated,
    Expression<bool>? isMain,
    Expression<bool>? isComplete,
    Expression<double>? progressValue,
  }) {
    return RawValuesInsertable({
      if (userGoalID != null) 'user_goal_i_d': userGoalID,
      if (userID != null) 'user_i_d': userID,
      if (goalID != null) 'goal_i_d': goalID,
      if (dateCreated != null) 'date_created': dateCreated,
      if (isMain != null) 'is_main': isMain,
      if (isComplete != null) 'is_complete': isComplete,
      if (progressValue != null) 'progress_value': progressValue,
    });
  }

  UserGoalProgressCompanion copyWith({
    Value<int>? userGoalID,
    Value<int>? userID,
    Value<int>? goalID,
    Value<DateTime>? dateCreated,
    Value<bool>? isMain,
    Value<bool>? isComplete,
    Value<double>? progressValue,
  }) {
    return UserGoalProgressCompanion(
      userGoalID: userGoalID ?? this.userGoalID,
      userID: userID ?? this.userID,
      goalID: goalID ?? this.goalID,
      dateCreated: dateCreated ?? this.dateCreated,
      isMain: isMain ?? this.isMain,
      isComplete: isComplete ?? this.isComplete,
      progressValue: progressValue ?? this.progressValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userGoalID.present) {
      map['user_goal_i_d'] = Variable<int>(userGoalID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (isMain.present) {
      map['is_main'] = Variable<bool>(isMain.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (progressValue.present) {
      map['progress_value'] = Variable<double>(progressValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserGoalProgressCompanion(')
          ..write('userGoalID: $userGoalID, ')
          ..write('userID: $userID, ')
          ..write('goalID: $goalID, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('isMain: $isMain, ')
          ..write('isComplete: $isComplete, ')
          ..write('progressValue: $progressValue')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, Achievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _achIDMeta = const VerificationMeta('achID');
  @override
  late final GeneratedColumn<int> achID = GeneratedColumn<int>(
    'ach_i_d',
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AchievementType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AchievementType>($AchievementsTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<UnlockType, String> unlockType =
      GeneratedColumn<String>(
        'unlock_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UnlockType>($AchievementsTable.$converterunlockType);
  @override
  List<GeneratedColumn> get $columns => [
    achID,
    name,
    description,
    type,
    unlockType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Achievement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ach_i_d')) {
      context.handle(
        _achIDMeta,
        achID.isAcceptableOrUnknown(data['ach_i_d']!, _achIDMeta),
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {achID};
  @override
  Achievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achievement(
      achID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ach_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      type: $AchievementsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      unlockType: $AchievementsTable.$converterunlockType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unlock_type'],
        )!,
      ),
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AchievementType, String, String> $convertertype =
      const EnumNameConverter<AchievementType>(AchievementType.values);
  static JsonTypeConverter2<UnlockType, String, String> $converterunlockType =
      const EnumNameConverter<UnlockType>(UnlockType.values);
}

class Achievement extends DataClass implements Insertable<Achievement> {
  final int achID;
  final String name;
  final String description;
  final AchievementType type;
  final UnlockType unlockType;
  const Achievement({
    required this.achID,
    required this.name,
    required this.description,
    required this.type,
    required this.unlockType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ach_i_d'] = Variable<int>(achID);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    {
      map['type'] = Variable<String>(
        $AchievementsTable.$convertertype.toSql(type),
      );
    }
    {
      map['unlock_type'] = Variable<String>(
        $AchievementsTable.$converterunlockType.toSql(unlockType),
      );
    }
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      achID: Value(achID),
      name: Value(name),
      description: Value(description),
      type: Value(type),
      unlockType: Value(unlockType),
    );
  }

  factory Achievement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achievement(
      achID: serializer.fromJson<int>(json['achID']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      type: $AchievementsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      unlockType: $AchievementsTable.$converterunlockType.fromJson(
        serializer.fromJson<String>(json['unlockType']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'achID': serializer.toJson<int>(achID),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'type': serializer.toJson<String>(
        $AchievementsTable.$convertertype.toJson(type),
      ),
      'unlockType': serializer.toJson<String>(
        $AchievementsTable.$converterunlockType.toJson(unlockType),
      ),
    };
  }

  Achievement copyWith({
    int? achID,
    String? name,
    String? description,
    AchievementType? type,
    UnlockType? unlockType,
  }) => Achievement(
    achID: achID ?? this.achID,
    name: name ?? this.name,
    description: description ?? this.description,
    type: type ?? this.type,
    unlockType: unlockType ?? this.unlockType,
  );
  Achievement copyWithCompanion(AchievementsCompanion data) {
    return Achievement(
      achID: data.achID.present ? data.achID.value : this.achID,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      type: data.type.present ? data.type.value : this.type,
      unlockType: data.unlockType.present
          ? data.unlockType.value
          : this.unlockType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Achievement(')
          ..write('achID: $achID, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('unlockType: $unlockType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(achID, name, description, type, unlockType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          other.achID == this.achID &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.unlockType == this.unlockType);
}

class AchievementsCompanion extends UpdateCompanion<Achievement> {
  final Value<int> achID;
  final Value<String> name;
  final Value<String> description;
  final Value<AchievementType> type;
  final Value<UnlockType> unlockType;
  const AchievementsCompanion({
    this.achID = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.unlockType = const Value.absent(),
  });
  AchievementsCompanion.insert({
    this.achID = const Value.absent(),
    required String name,
    required String description,
    required AchievementType type,
    required UnlockType unlockType,
  }) : name = Value(name),
       description = Value(description),
       type = Value(type),
       unlockType = Value(unlockType);
  static Insertable<Achievement> custom({
    Expression<int>? achID,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? unlockType,
  }) {
    return RawValuesInsertable({
      if (achID != null) 'ach_i_d': achID,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (unlockType != null) 'unlock_type': unlockType,
    });
  }

  AchievementsCompanion copyWith({
    Value<int>? achID,
    Value<String>? name,
    Value<String>? description,
    Value<AchievementType>? type,
    Value<UnlockType>? unlockType,
  }) {
    return AchievementsCompanion(
      achID: achID ?? this.achID,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      unlockType: unlockType ?? this.unlockType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (achID.present) {
      map['ach_i_d'] = Variable<int>(achID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $AchievementsTable.$convertertype.toSql(type.value),
      );
    }
    if (unlockType.present) {
      map['unlock_type'] = Variable<String>(
        $AchievementsTable.$converterunlockType.toSql(unlockType.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('achID: $achID, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('unlockType: $unlockType')
          ..write(')'))
        .toString();
  }
}

class $ReinforcementsTable extends Reinforcements
    with TableInfo<$ReinforcementsTable, Reinforcement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReinforcementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reinIDMeta = const VerificationMeta('reinID');
  @override
  late final GeneratedColumn<int> reinID = GeneratedColumn<int>(
    'rein_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userGoalIDMeta = const VerificationMeta(
    'userGoalID',
  );
  @override
  late final GeneratedColumn<int> userGoalID = GeneratedColumn<int>(
    'user_goal_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_goal_progress (user_goal_i_d)',
    ),
  );
  static const VerificationMeta _achIDMeta = const VerificationMeta('achID');
  @override
  late final GeneratedColumn<int> achID = GeneratedColumn<int>(
    'ach_i_d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES achievements (ach_i_d)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ReinforcementType, String>
  reinType = GeneratedColumn<String>(
    'rein_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<ReinforcementType>($ReinforcementsTable.$converterreinType);
  static const VerificationMeta _displayContextMeta = const VerificationMeta(
    'displayContext',
  );
  @override
  late final GeneratedColumn<String> displayContext = GeneratedColumn<String>(
    'display_context',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    reinID,
    userGoalID,
    achID,
    reinType,
    displayContext,
    priority,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reinforcements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reinforcement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('rein_i_d')) {
      context.handle(
        _reinIDMeta,
        reinID.isAcceptableOrUnknown(data['rein_i_d']!, _reinIDMeta),
      );
    }
    if (data.containsKey('user_goal_i_d')) {
      context.handle(
        _userGoalIDMeta,
        userGoalID.isAcceptableOrUnknown(
          data['user_goal_i_d']!,
          _userGoalIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userGoalIDMeta);
    }
    if (data.containsKey('ach_i_d')) {
      context.handle(
        _achIDMeta,
        achID.isAcceptableOrUnknown(data['ach_i_d']!, _achIDMeta),
      );
    }
    if (data.containsKey('display_context')) {
      context.handle(
        _displayContextMeta,
        displayContext.isAcceptableOrUnknown(
          data['display_context']!,
          _displayContextMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reinID};
  @override
  Reinforcement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reinforcement(
      reinID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rein_i_d'],
      )!,
      userGoalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_goal_i_d'],
      )!,
      achID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ach_i_d'],
      ),
      reinType: $ReinforcementsTable.$converterreinType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}rein_type'],
        )!,
      ),
      displayContext: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_context'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
    );
  }

  @override
  $ReinforcementsTable createAlias(String alias) {
    return $ReinforcementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ReinforcementType, String, String>
  $converterreinType = const EnumNameConverter<ReinforcementType>(
    ReinforcementType.values,
  );
}

class Reinforcement extends DataClass implements Insertable<Reinforcement> {
  final int reinID;
  final int userGoalID;
  final int? achID;
  final ReinforcementType reinType;
  final String displayContext;
  final int priority;
  const Reinforcement({
    required this.reinID,
    required this.userGoalID,
    this.achID,
    required this.reinType,
    required this.displayContext,
    required this.priority,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rein_i_d'] = Variable<int>(reinID);
    map['user_goal_i_d'] = Variable<int>(userGoalID);
    if (!nullToAbsent || achID != null) {
      map['ach_i_d'] = Variable<int>(achID);
    }
    {
      map['rein_type'] = Variable<String>(
        $ReinforcementsTable.$converterreinType.toSql(reinType),
      );
    }
    map['display_context'] = Variable<String>(displayContext);
    map['priority'] = Variable<int>(priority);
    return map;
  }

  ReinforcementsCompanion toCompanion(bool nullToAbsent) {
    return ReinforcementsCompanion(
      reinID: Value(reinID),
      userGoalID: Value(userGoalID),
      achID: achID == null && nullToAbsent
          ? const Value.absent()
          : Value(achID),
      reinType: Value(reinType),
      displayContext: Value(displayContext),
      priority: Value(priority),
    );
  }

  factory Reinforcement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reinforcement(
      reinID: serializer.fromJson<int>(json['reinID']),
      userGoalID: serializer.fromJson<int>(json['userGoalID']),
      achID: serializer.fromJson<int?>(json['achID']),
      reinType: $ReinforcementsTable.$converterreinType.fromJson(
        serializer.fromJson<String>(json['reinType']),
      ),
      displayContext: serializer.fromJson<String>(json['displayContext']),
      priority: serializer.fromJson<int>(json['priority']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reinID': serializer.toJson<int>(reinID),
      'userGoalID': serializer.toJson<int>(userGoalID),
      'achID': serializer.toJson<int?>(achID),
      'reinType': serializer.toJson<String>(
        $ReinforcementsTable.$converterreinType.toJson(reinType),
      ),
      'displayContext': serializer.toJson<String>(displayContext),
      'priority': serializer.toJson<int>(priority),
    };
  }

  Reinforcement copyWith({
    int? reinID,
    int? userGoalID,
    Value<int?> achID = const Value.absent(),
    ReinforcementType? reinType,
    String? displayContext,
    int? priority,
  }) => Reinforcement(
    reinID: reinID ?? this.reinID,
    userGoalID: userGoalID ?? this.userGoalID,
    achID: achID.present ? achID.value : this.achID,
    reinType: reinType ?? this.reinType,
    displayContext: displayContext ?? this.displayContext,
    priority: priority ?? this.priority,
  );
  Reinforcement copyWithCompanion(ReinforcementsCompanion data) {
    return Reinforcement(
      reinID: data.reinID.present ? data.reinID.value : this.reinID,
      userGoalID: data.userGoalID.present
          ? data.userGoalID.value
          : this.userGoalID,
      achID: data.achID.present ? data.achID.value : this.achID,
      reinType: data.reinType.present ? data.reinType.value : this.reinType,
      displayContext: data.displayContext.present
          ? data.displayContext.value
          : this.displayContext,
      priority: data.priority.present ? data.priority.value : this.priority,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reinforcement(')
          ..write('reinID: $reinID, ')
          ..write('userGoalID: $userGoalID, ')
          ..write('achID: $achID, ')
          ..write('reinType: $reinType, ')
          ..write('displayContext: $displayContext, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    reinID,
    userGoalID,
    achID,
    reinType,
    displayContext,
    priority,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reinforcement &&
          other.reinID == this.reinID &&
          other.userGoalID == this.userGoalID &&
          other.achID == this.achID &&
          other.reinType == this.reinType &&
          other.displayContext == this.displayContext &&
          other.priority == this.priority);
}

class ReinforcementsCompanion extends UpdateCompanion<Reinforcement> {
  final Value<int> reinID;
  final Value<int> userGoalID;
  final Value<int?> achID;
  final Value<ReinforcementType> reinType;
  final Value<String> displayContext;
  final Value<int> priority;
  const ReinforcementsCompanion({
    this.reinID = const Value.absent(),
    this.userGoalID = const Value.absent(),
    this.achID = const Value.absent(),
    this.reinType = const Value.absent(),
    this.displayContext = const Value.absent(),
    this.priority = const Value.absent(),
  });
  ReinforcementsCompanion.insert({
    this.reinID = const Value.absent(),
    required int userGoalID,
    this.achID = const Value.absent(),
    required ReinforcementType reinType,
    this.displayContext = const Value.absent(),
    this.priority = const Value.absent(),
  }) : userGoalID = Value(userGoalID),
       reinType = Value(reinType);
  static Insertable<Reinforcement> custom({
    Expression<int>? reinID,
    Expression<int>? userGoalID,
    Expression<int>? achID,
    Expression<String>? reinType,
    Expression<String>? displayContext,
    Expression<int>? priority,
  }) {
    return RawValuesInsertable({
      if (reinID != null) 'rein_i_d': reinID,
      if (userGoalID != null) 'user_goal_i_d': userGoalID,
      if (achID != null) 'ach_i_d': achID,
      if (reinType != null) 'rein_type': reinType,
      if (displayContext != null) 'display_context': displayContext,
      if (priority != null) 'priority': priority,
    });
  }

  ReinforcementsCompanion copyWith({
    Value<int>? reinID,
    Value<int>? userGoalID,
    Value<int?>? achID,
    Value<ReinforcementType>? reinType,
    Value<String>? displayContext,
    Value<int>? priority,
  }) {
    return ReinforcementsCompanion(
      reinID: reinID ?? this.reinID,
      userGoalID: userGoalID ?? this.userGoalID,
      achID: achID ?? this.achID,
      reinType: reinType ?? this.reinType,
      displayContext: displayContext ?? this.displayContext,
      priority: priority ?? this.priority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reinID.present) {
      map['rein_i_d'] = Variable<int>(reinID.value);
    }
    if (userGoalID.present) {
      map['user_goal_i_d'] = Variable<int>(userGoalID.value);
    }
    if (achID.present) {
      map['ach_i_d'] = Variable<int>(achID.value);
    }
    if (reinType.present) {
      map['rein_type'] = Variable<String>(
        $ReinforcementsTable.$converterreinType.toSql(reinType.value),
      );
    }
    if (displayContext.present) {
      map['display_context'] = Variable<String>(displayContext.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReinforcementsCompanion(')
          ..write('reinID: $reinID, ')
          ..write('userGoalID: $userGoalID, ')
          ..write('achID: $achID, ')
          ..write('reinType: $reinType, ')
          ..write('displayContext: $displayContext, ')
          ..write('priority: $priority')
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
  late final $StreaksTable streaks = $StreaksTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $FastingGoalsTable fastingGoals = $FastingGoalsTable(this);
  late final $WeightGoalsTable weightGoals = $WeightGoalsTable(this);
  late final $HydrationGoalsTable hydrationGoals = $HydrationGoalsTable(this);
  late final $NutritionGoalsTable nutritionGoals = $NutritionGoalsTable(this);
  late final $UserGoalProgressTable userGoalProgress = $UserGoalProgressTable(
    this,
  );
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $ReinforcementsTable reinforcements = $ReinforcementsTable(this);
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
    streaks,
    goals,
    fastingGoals,
    weightGoals,
    hydrationGoals,
    nutritionGoals,
    userGoalProgress,
    achievements,
    reinforcements,
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

  static MultiTypedResultKey<$UserGoalProgressTable, List<UserGoalProgressData>>
  _userGoalProgressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userGoalProgress,
    aliasName: 'users__user_i_d__user_goal_progress__user_i_d',
  );

  $$UserGoalProgressTableProcessedTableManager get userGoalProgressRefs {
    final manager = $$UserGoalProgressTableTableManager(
      $_db,
      $_db.userGoalProgress,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(
      _userGoalProgressRefsTable($_db),
    );
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

  Expression<bool> userGoalProgressRefs(
    Expression<bool> Function($$UserGoalProgressTableFilterComposer f) f,
  ) {
    final $$UserGoalProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableFilterComposer(
            $db: $db,
            $table: $db.userGoalProgress,
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

  Expression<T> userGoalProgressRefs<T extends Object>(
    Expression<T> Function($$UserGoalProgressTableAnnotationComposer a) f,
  ) {
    final $$UserGoalProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.userGoalProgress,
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
            bool mealsRefs,
            bool nutritionLogRefs,
            bool userGoalProgressRefs,
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
                mealsRefs = false,
                nutritionLogRefs = false,
                userGoalProgressRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fastLogRefs) db.fastLog,
                    if (hydrationLogRefs) db.hydrationLog,
                    if (weightLogRefs) db.weightLog,
                    if (mealsRefs) db.meals,
                    if (nutritionLogRefs) db.nutritionLog,
                    if (userGoalProgressRefs) db.userGoalProgress,
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
                      if (userGoalProgressRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserGoalProgressData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userGoalProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userGoalProgressRefs,
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
        bool mealsRefs,
        bool nutritionLogRefs,
        bool userGoalProgressRefs,
      })
    >;
typedef $$FastLogTableCreateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      required int userID,
      Value<String> formIF,
      Value<String> fastResult,
      Value<DateTime> startDateTime,
      Value<DateTime?> endDateTime,
    });
typedef $$FastLogTableUpdateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      Value<int> userID,
      Value<String> formIF,
      Value<String> fastResult,
      Value<DateTime> startDateTime,
      Value<DateTime?> endDateTime,
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

  ColumnFilters<String> get fastResult => $composableBuilder(
    column: $table.fastResult,
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

  ColumnOrderings<String> get fastResult => $composableBuilder(
    column: $table.fastResult,
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

  GeneratedColumn<String> get fastResult => $composableBuilder(
    column: $table.fastResult,
    builder: (column) => column,
  );

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
                Value<String> fastResult = const Value.absent(),
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime?> endDateTime = const Value.absent(),
              }) => FastLogCompanion(
                fastLogID: fastLogID,
                userID: userID,
                formIF: formIF,
                fastResult: fastResult,
                startDateTime: startDateTime,
                endDateTime: endDateTime,
              ),
          createCompanionCallback:
              ({
                Value<int> fastLogID = const Value.absent(),
                required int userID,
                Value<String> formIF = const Value.absent(),
                Value<String> fastResult = const Value.absent(),
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime?> endDateTime = const Value.absent(),
              }) => FastLogCompanion.insert(
                fastLogID: fastLogID,
                userID: userID,
                formIF: formIF,
                fastResult: fastResult,
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
      required String name,
      required String servingDescription,
      required int servingGrams,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protein,
      Value<double> fibre,
      Value<double> calories,
    });
typedef $$FoodTableUpdateCompanionBuilder =
    FoodCompanion Function({
      Value<int> foodID,
      Value<String> name,
      Value<String> servingDescription,
      Value<int> servingGrams,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protein,
      Value<double> fibre,
      Value<double> calories,
    });

final class $$FoodTableReferences
    extends BaseReferences<_$AppDatabase, $FoodTable, FoodData> {
  $$FoodTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get servingDescription => $composableBuilder(
    column: $table.servingDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servingGrams => $composableBuilder(
    column: $table.servingGrams,
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get servingDescription => $composableBuilder(
    column: $table.servingDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servingGrams => $composableBuilder(
    column: $table.servingGrams,
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get servingDescription => $composableBuilder(
    column: $table.servingDescription,
    builder: (column) => column,
  );

  GeneratedColumn<int> get servingGrams => $composableBuilder(
    column: $table.servingGrams,
    builder: (column) => column,
  );

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
                Value<String> name = const Value.absent(),
                Value<String> servingDescription = const Value.absent(),
                Value<int> servingGrams = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodCompanion(
                foodID: foodID,
                name: name,
                servingDescription: servingDescription,
                servingGrams: servingGrams,
                carbs: carbs,
                fat: fat,
                protein: protein,
                fibre: fibre,
                calories: calories,
              ),
          createCompanionCallback:
              ({
                Value<int> foodID = const Value.absent(),
                required String name,
                required String servingDescription,
                required int servingGrams,
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodCompanion.insert(
                foodID: foodID,
                name: name,
                servingDescription: servingDescription,
                servingGrams: servingGrams,
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
              ({recipeQuantitiesRefs = false, mealFoodContentRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeQuantitiesRefs) db.recipeQuantities,
                    if (mealFoodContentRefs) db.mealFoodContent,
                  ],
                  addJoins: null,
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
      Value<String> mealType,
      Value<double> amount,
    });
typedef $$MealsTableUpdateCompanionBuilder =
    MealsCompanion Function({
      Value<int> mealID,
      Value<int> userID,
      Value<DateTime> date,
      Value<bool> inEatingWindow,
      Value<String> logMethod,
      Value<String> mealType,
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

  ColumnFilters<String> get mealType => $composableBuilder(
    column: $table.mealType,
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

  ColumnOrderings<String> get mealType => $composableBuilder(
    column: $table.mealType,
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

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

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
                Value<String> mealType = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => MealsCompanion(
                mealID: mealID,
                userID: userID,
                date: date,
                inEatingWindow: inEatingWindow,
                logMethod: logMethod,
                mealType: mealType,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> mealID = const Value.absent(),
                required int userID,
                Value<DateTime> date = const Value.absent(),
                Value<bool> inEatingWindow = const Value.absent(),
                Value<String> logMethod = const Value.absent(),
                Value<String> mealType = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => MealsCompanion.insert(
                mealID: mealID,
                userID: userID,
                date: date,
                inEatingWindow: inEatingWindow,
                logMethod: logMethod,
                mealType: mealType,
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
typedef $$StreaksTableCreateCompanionBuilder =
    StreaksCompanion Function({
      Value<int> streakID,
      Value<int> streakProgress,
      Value<int> bestStreak,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      required StreakType streakType,
      Value<UnlockType?> unlockType,
    });
typedef $$StreaksTableUpdateCompanionBuilder =
    StreaksCompanion Function({
      Value<int> streakID,
      Value<int> streakProgress,
      Value<int> bestStreak,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<StreakType> streakType,
      Value<UnlockType?> unlockType,
    });

final class $$StreaksTableReferences
    extends BaseReferences<_$AppDatabase, $StreaksTable, Streak> {
  $$StreaksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GoalsTable, List<Goal>> _goalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.goals,
    aliasName: 'streaks__streak_i_d__goals__streak_i_d',
  );

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager($_db, $_db.goals).filter(
      (f) => f.streakID.streakID.sqlEquals($_itemColumn<int>('streak_i_d')!),
    );

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StreaksTableFilterComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get streakID => $composableBuilder(
    column: $table.streakID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streakProgress => $composableBuilder(
    column: $table.streakProgress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestStreak => $composableBuilder(
    column: $table.bestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StreakType, StreakType, String>
  get streakType => $composableBuilder(
    column: $table.streakType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<UnlockType?, UnlockType, String>
  get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> goalsRefs(
    Expression<bool> Function($$GoalsTableFilterComposer f) f,
  ) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.streakID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.streakID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StreaksTableOrderingComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get streakID => $composableBuilder(
    column: $table.streakID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streakProgress => $composableBuilder(
    column: $table.streakProgress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestStreak => $composableBuilder(
    column: $table.bestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streakType => $composableBuilder(
    column: $table.streakType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreaksTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get streakID =>
      $composableBuilder(column: $table.streakID, builder: (column) => column);

  GeneratedColumn<int> get streakProgress => $composableBuilder(
    column: $table.streakProgress,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bestStreak => $composableBuilder(
    column: $table.bestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StreakType, String> get streakType =>
      $composableBuilder(
        column: $table.streakType,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<UnlockType?, String> get unlockType =>
      $composableBuilder(
        column: $table.unlockType,
        builder: (column) => column,
      );

  Expression<T> goalsRefs<T extends Object>(
    Expression<T> Function($$GoalsTableAnnotationComposer a) f,
  ) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.streakID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.streakID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StreaksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreaksTable,
          Streak,
          $$StreaksTableFilterComposer,
          $$StreaksTableOrderingComposer,
          $$StreaksTableAnnotationComposer,
          $$StreaksTableCreateCompanionBuilder,
          $$StreaksTableUpdateCompanionBuilder,
          (Streak, $$StreaksTableReferences),
          Streak,
          PrefetchHooks Function({bool goalsRefs})
        > {
  $$StreaksTableTableManager(_$AppDatabase db, $StreaksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreaksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreaksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreaksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> streakID = const Value.absent(),
                Value<int> streakProgress = const Value.absent(),
                Value<int> bestStreak = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<StreakType> streakType = const Value.absent(),
                Value<UnlockType?> unlockType = const Value.absent(),
              }) => StreaksCompanion(
                streakID: streakID,
                streakProgress: streakProgress,
                bestStreak: bestStreak,
                startDate: startDate,
                endDate: endDate,
                streakType: streakType,
                unlockType: unlockType,
              ),
          createCompanionCallback:
              ({
                Value<int> streakID = const Value.absent(),
                Value<int> streakProgress = const Value.absent(),
                Value<int> bestStreak = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                required StreakType streakType,
                Value<UnlockType?> unlockType = const Value.absent(),
              }) => StreaksCompanion.insert(
                streakID: streakID,
                streakProgress: streakProgress,
                bestStreak: bestStreak,
                startDate: startDate,
                endDate: endDate,
                streakType: streakType,
                unlockType: unlockType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StreaksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalsRefs) db.goals],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalsRefs)
                    await $_getPrefetchedData<Streak, $StreaksTable, Goal>(
                      currentTable: table,
                      referencedTable: $$StreaksTableReferences._goalsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$StreaksTableReferences(db, table, p0).goalsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.streakID == item.streakID,
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

typedef $$StreaksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreaksTable,
      Streak,
      $$StreaksTableFilterComposer,
      $$StreaksTableOrderingComposer,
      $$StreaksTableAnnotationComposer,
      $$StreaksTableCreateCompanionBuilder,
      $$StreaksTableUpdateCompanionBuilder,
      (Streak, $$StreaksTableReferences),
      Streak,
      PrefetchHooks Function({bool goalsRefs})
    >;
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> goalID,
      required GoalType type,
      Value<double?> thresholdValue,
      Value<String?> metricType,
      Value<String?> operator,
      Value<int?> streakID,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> goalID,
      Value<GoalType> type,
      Value<double?> thresholdValue,
      Value<String?> metricType,
      Value<String?> operator,
      Value<int?> streakID,
    });

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StreaksTable _streakIDTable(_$AppDatabase db) =>
      db.streaks.createAlias('goals__streak_i_d__streaks__streak_i_d');

  $$StreaksTableProcessedTableManager? get streakID {
    final $_column = $_itemColumn<int>('streak_i_d');
    if ($_column == null) return null;
    final manager = $$StreaksTableTableManager(
      $_db,
      $_db.streaks,
    ).filter((f) => f.streakID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_streakIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FastingGoalsTable, List<FastingGoal>>
  _fastingGoalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.fastingGoals,
    aliasName: 'goals__goal_i_d__fasting_goals__goal_i_d',
  );

  $$FastingGoalsTableProcessedTableManager get fastingGoalsRefs {
    final manager = $$FastingGoalsTableTableManager(
      $_db,
      $_db.fastingGoals,
    ).filter((f) => f.goalID.goalID.sqlEquals($_itemColumn<int>('goal_i_d')!));

    final cache = $_typedResult.readTableOrNull(_fastingGoalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WeightGoalsTable, List<WeightGoal>>
  _weightGoalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.weightGoals,
    aliasName: 'goals__goal_i_d__weight_goals__goal_i_d',
  );

  $$WeightGoalsTableProcessedTableManager get weightGoalsRefs {
    final manager = $$WeightGoalsTableTableManager(
      $_db,
      $_db.weightGoals,
    ).filter((f) => f.goalID.goalID.sqlEquals($_itemColumn<int>('goal_i_d')!));

    final cache = $_typedResult.readTableOrNull(_weightGoalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HydrationGoalsTable, List<HydrationGoal>>
  _hydrationGoalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hydrationGoals,
    aliasName: 'goals__goal_i_d__hydration_goals__goal_i_d',
  );

  $$HydrationGoalsTableProcessedTableManager get hydrationGoalsRefs {
    final manager = $$HydrationGoalsTableTableManager(
      $_db,
      $_db.hydrationGoals,
    ).filter((f) => f.goalID.goalID.sqlEquals($_itemColumn<int>('goal_i_d')!));

    final cache = $_typedResult.readTableOrNull(_hydrationGoalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NutritionGoalsTable, List<NutritionGoal>>
  _nutritionGoalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.nutritionGoals,
    aliasName: 'goals__goal_i_d__nutrition_goals__goal_i_d',
  );

  $$NutritionGoalsTableProcessedTableManager get nutritionGoalsRefs {
    final manager = $$NutritionGoalsTableTableManager(
      $_db,
      $_db.nutritionGoals,
    ).filter((f) => f.goalID.goalID.sqlEquals($_itemColumn<int>('goal_i_d')!));

    final cache = $_typedResult.readTableOrNull(_nutritionGoalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserGoalProgressTable, List<UserGoalProgressData>>
  _userGoalProgressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userGoalProgress,
    aliasName: 'goals__goal_i_d__user_goal_progress__goal_i_d',
  );

  $$UserGoalProgressTableProcessedTableManager get userGoalProgressRefs {
    final manager = $$UserGoalProgressTableTableManager(
      $_db,
      $_db.userGoalProgress,
    ).filter((f) => f.goalID.goalID.sqlEquals($_itemColumn<int>('goal_i_d')!));

    final cache = $_typedResult.readTableOrNull(
      _userGoalProgressRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get goalID => $composableBuilder(
    column: $table.goalID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GoalType, GoalType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get thresholdValue => $composableBuilder(
    column: $table.thresholdValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operator => $composableBuilder(
    column: $table.operator,
    builder: (column) => ColumnFilters(column),
  );

  $$StreaksTableFilterComposer get streakID {
    final $$StreaksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.streakID,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.streakID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StreaksTableFilterComposer(
            $db: $db,
            $table: $db.streaks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> fastingGoalsRefs(
    Expression<bool> Function($$FastingGoalsTableFilterComposer f) f,
  ) {
    final $$FastingGoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.fastingGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FastingGoalsTableFilterComposer(
            $db: $db,
            $table: $db.fastingGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> weightGoalsRefs(
    Expression<bool> Function($$WeightGoalsTableFilterComposer f) f,
  ) {
    final $$WeightGoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.weightGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeightGoalsTableFilterComposer(
            $db: $db,
            $table: $db.weightGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> hydrationGoalsRefs(
    Expression<bool> Function($$HydrationGoalsTableFilterComposer f) f,
  ) {
    final $$HydrationGoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.hydrationGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HydrationGoalsTableFilterComposer(
            $db: $db,
            $table: $db.hydrationGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> nutritionGoalsRefs(
    Expression<bool> Function($$NutritionGoalsTableFilterComposer f) f,
  ) {
    final $$NutritionGoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.nutritionGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutritionGoalsTableFilterComposer(
            $db: $db,
            $table: $db.nutritionGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userGoalProgressRefs(
    Expression<bool> Function($$UserGoalProgressTableFilterComposer f) f,
  ) {
    final $$UserGoalProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableFilterComposer(
            $db: $db,
            $table: $db.userGoalProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get goalID => $composableBuilder(
    column: $table.goalID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thresholdValue => $composableBuilder(
    column: $table.thresholdValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operator => $composableBuilder(
    column: $table.operator,
    builder: (column) => ColumnOrderings(column),
  );

  $$StreaksTableOrderingComposer get streakID {
    final $$StreaksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.streakID,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.streakID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StreaksTableOrderingComposer(
            $db: $db,
            $table: $db.streaks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get goalID =>
      $composableBuilder(column: $table.goalID, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GoalType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get thresholdValue => $composableBuilder(
    column: $table.thresholdValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operator =>
      $composableBuilder(column: $table.operator, builder: (column) => column);

  $$StreaksTableAnnotationComposer get streakID {
    final $$StreaksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.streakID,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.streakID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StreaksTableAnnotationComposer(
            $db: $db,
            $table: $db.streaks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> fastingGoalsRefs<T extends Object>(
    Expression<T> Function($$FastingGoalsTableAnnotationComposer a) f,
  ) {
    final $$FastingGoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.fastingGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FastingGoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.fastingGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> weightGoalsRefs<T extends Object>(
    Expression<T> Function($$WeightGoalsTableAnnotationComposer a) f,
  ) {
    final $$WeightGoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.weightGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeightGoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.weightGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> hydrationGoalsRefs<T extends Object>(
    Expression<T> Function($$HydrationGoalsTableAnnotationComposer a) f,
  ) {
    final $$HydrationGoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.hydrationGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HydrationGoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.hydrationGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> nutritionGoalsRefs<T extends Object>(
    Expression<T> Function($$NutritionGoalsTableAnnotationComposer a) f,
  ) {
    final $$NutritionGoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.nutritionGoals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutritionGoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.nutritionGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userGoalProgressRefs<T extends Object>(
    Expression<T> Function($$UserGoalProgressTableAnnotationComposer a) f,
  ) {
    final $$UserGoalProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.userGoalProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, $$GoalsTableReferences),
          Goal,
          PrefetchHooks Function({
            bool streakID,
            bool fastingGoalsRefs,
            bool weightGoalsRefs,
            bool hydrationGoalsRefs,
            bool nutritionGoalsRefs,
            bool userGoalProgressRefs,
          })
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<GoalType> type = const Value.absent(),
                Value<double?> thresholdValue = const Value.absent(),
                Value<String?> metricType = const Value.absent(),
                Value<String?> operator = const Value.absent(),
                Value<int?> streakID = const Value.absent(),
              }) => GoalsCompanion(
                goalID: goalID,
                type: type,
                thresholdValue: thresholdValue,
                metricType: metricType,
                operator: operator,
                streakID: streakID,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                required GoalType type,
                Value<double?> thresholdValue = const Value.absent(),
                Value<String?> metricType = const Value.absent(),
                Value<String?> operator = const Value.absent(),
                Value<int?> streakID = const Value.absent(),
              }) => GoalsCompanion.insert(
                goalID: goalID,
                type: type,
                thresholdValue: thresholdValue,
                metricType: metricType,
                operator: operator,
                streakID: streakID,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GoalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                streakID = false,
                fastingGoalsRefs = false,
                weightGoalsRefs = false,
                hydrationGoalsRefs = false,
                nutritionGoalsRefs = false,
                userGoalProgressRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fastingGoalsRefs) db.fastingGoals,
                    if (weightGoalsRefs) db.weightGoals,
                    if (hydrationGoalsRefs) db.hydrationGoals,
                    if (nutritionGoalsRefs) db.nutritionGoals,
                    if (userGoalProgressRefs) db.userGoalProgress,
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
                        if (streakID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.streakID,
                                    referencedTable: $$GoalsTableReferences
                                        ._streakIDTable(db),
                                    referencedColumn: $$GoalsTableReferences
                                        ._streakIDTable(db)
                                        .streakID,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (fastingGoalsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          FastingGoal
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._fastingGoalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).fastingGoalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalID == item.goalID,
                              ),
                          typedResults: items,
                        ),
                      if (weightGoalsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          WeightGoal
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._weightGoalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).weightGoalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalID == item.goalID,
                              ),
                          typedResults: items,
                        ),
                      if (hydrationGoalsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          HydrationGoal
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._hydrationGoalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).hydrationGoalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalID == item.goalID,
                              ),
                          typedResults: items,
                        ),
                      if (nutritionGoalsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          NutritionGoal
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._nutritionGoalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).nutritionGoalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalID == item.goalID,
                              ),
                          typedResults: items,
                        ),
                      if (userGoalProgressRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          UserGoalProgressData
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._userGoalProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).userGoalProgressRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalID == item.goalID,
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

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, $$GoalsTableReferences),
      Goal,
      PrefetchHooks Function({
        bool streakID,
        bool fastingGoalsRefs,
        bool weightGoalsRefs,
        bool hydrationGoalsRefs,
        bool nutritionGoalsRefs,
        bool userGoalProgressRefs,
      })
    >;
typedef $$FastingGoalsTableCreateCompanionBuilder =
    FastingGoalsCompanion Function({
      Value<int> goalID,
      Value<double?> targetHours,
      Value<int?> targetDays,
      Value<int?> targetCalories,
    });
typedef $$FastingGoalsTableUpdateCompanionBuilder =
    FastingGoalsCompanion Function({
      Value<int> goalID,
      Value<double?> targetHours,
      Value<int?> targetDays,
      Value<int?> targetCalories,
    });

final class $$FastingGoalsTableReferences
    extends BaseReferences<_$AppDatabase, $FastingGoalsTable, FastingGoal> {
  $$FastingGoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIDTable(_$AppDatabase db) =>
      db.goals.createAlias('fasting_goals__goal_i_d__goals__goal_i_d');

  $$GoalsTableProcessedTableManager get goalID {
    final $_column = $_itemColumn<int>('goal_i_d')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.goalID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FastingGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $FastingGoalsTable> {
  $$FastingGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get targetHours => $composableBuilder(
    column: $table.targetHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetDays => $composableBuilder(
    column: $table.targetDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetCalories => $composableBuilder(
    column: $table.targetCalories,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalID {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FastingGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $FastingGoalsTable> {
  $$FastingGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get targetHours => $composableBuilder(
    column: $table.targetHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetDays => $composableBuilder(
    column: $table.targetDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetCalories => $composableBuilder(
    column: $table.targetCalories,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalID {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FastingGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FastingGoalsTable> {
  $$FastingGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get targetHours => $composableBuilder(
    column: $table.targetHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetDays => $composableBuilder(
    column: $table.targetDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetCalories => $composableBuilder(
    column: $table.targetCalories,
    builder: (column) => column,
  );

  $$GoalsTableAnnotationComposer get goalID {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FastingGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FastingGoalsTable,
          FastingGoal,
          $$FastingGoalsTableFilterComposer,
          $$FastingGoalsTableOrderingComposer,
          $$FastingGoalsTableAnnotationComposer,
          $$FastingGoalsTableCreateCompanionBuilder,
          $$FastingGoalsTableUpdateCompanionBuilder,
          (FastingGoal, $$FastingGoalsTableReferences),
          FastingGoal,
          PrefetchHooks Function({bool goalID})
        > {
  $$FastingGoalsTableTableManager(_$AppDatabase db, $FastingGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FastingGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FastingGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FastingGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<double?> targetHours = const Value.absent(),
                Value<int?> targetDays = const Value.absent(),
                Value<int?> targetCalories = const Value.absent(),
              }) => FastingGoalsCompanion(
                goalID: goalID,
                targetHours: targetHours,
                targetDays: targetDays,
                targetCalories: targetCalories,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<double?> targetHours = const Value.absent(),
                Value<int?> targetDays = const Value.absent(),
                Value<int?> targetCalories = const Value.absent(),
              }) => FastingGoalsCompanion.insert(
                goalID: goalID,
                targetHours: targetHours,
                targetDays: targetDays,
                targetCalories: targetCalories,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FastingGoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalID = false}) {
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
                    if (goalID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.goalID,
                                referencedTable: $$FastingGoalsTableReferences
                                    ._goalIDTable(db),
                                referencedColumn: $$FastingGoalsTableReferences
                                    ._goalIDTable(db)
                                    .goalID,
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

typedef $$FastingGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FastingGoalsTable,
      FastingGoal,
      $$FastingGoalsTableFilterComposer,
      $$FastingGoalsTableOrderingComposer,
      $$FastingGoalsTableAnnotationComposer,
      $$FastingGoalsTableCreateCompanionBuilder,
      $$FastingGoalsTableUpdateCompanionBuilder,
      (FastingGoal, $$FastingGoalsTableReferences),
      FastingGoal,
      PrefetchHooks Function({bool goalID})
    >;
typedef $$WeightGoalsTableCreateCompanionBuilder =
    WeightGoalsCompanion Function({
      Value<int> goalID,
      Value<double?> targetWeight,
      Value<double?> startWeight,
    });
typedef $$WeightGoalsTableUpdateCompanionBuilder =
    WeightGoalsCompanion Function({
      Value<int> goalID,
      Value<double?> targetWeight,
      Value<double?> startWeight,
    });

final class $$WeightGoalsTableReferences
    extends BaseReferences<_$AppDatabase, $WeightGoalsTable, WeightGoal> {
  $$WeightGoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIDTable(_$AppDatabase db) =>
      db.goals.createAlias('weight_goals__goal_i_d__goals__goal_i_d');

  $$GoalsTableProcessedTableManager get goalID {
    final $_column = $_itemColumn<int>('goal_i_d')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.goalID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeightGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $WeightGoalsTable> {
  $$WeightGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startWeight => $composableBuilder(
    column: $table.startWeight,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalID {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeightGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightGoalsTable> {
  $$WeightGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startWeight => $composableBuilder(
    column: $table.startWeight,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalID {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeightGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightGoalsTable> {
  $$WeightGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get startWeight => $composableBuilder(
    column: $table.startWeight,
    builder: (column) => column,
  );

  $$GoalsTableAnnotationComposer get goalID {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeightGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeightGoalsTable,
          WeightGoal,
          $$WeightGoalsTableFilterComposer,
          $$WeightGoalsTableOrderingComposer,
          $$WeightGoalsTableAnnotationComposer,
          $$WeightGoalsTableCreateCompanionBuilder,
          $$WeightGoalsTableUpdateCompanionBuilder,
          (WeightGoal, $$WeightGoalsTableReferences),
          WeightGoal,
          PrefetchHooks Function({bool goalID})
        > {
  $$WeightGoalsTableTableManager(_$AppDatabase db, $WeightGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<double?> targetWeight = const Value.absent(),
                Value<double?> startWeight = const Value.absent(),
              }) => WeightGoalsCompanion(
                goalID: goalID,
                targetWeight: targetWeight,
                startWeight: startWeight,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<double?> targetWeight = const Value.absent(),
                Value<double?> startWeight = const Value.absent(),
              }) => WeightGoalsCompanion.insert(
                goalID: goalID,
                targetWeight: targetWeight,
                startWeight: startWeight,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeightGoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalID = false}) {
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
                    if (goalID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.goalID,
                                referencedTable: $$WeightGoalsTableReferences
                                    ._goalIDTable(db),
                                referencedColumn: $$WeightGoalsTableReferences
                                    ._goalIDTable(db)
                                    .goalID,
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

typedef $$WeightGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeightGoalsTable,
      WeightGoal,
      $$WeightGoalsTableFilterComposer,
      $$WeightGoalsTableOrderingComposer,
      $$WeightGoalsTableAnnotationComposer,
      $$WeightGoalsTableCreateCompanionBuilder,
      $$WeightGoalsTableUpdateCompanionBuilder,
      (WeightGoal, $$WeightGoalsTableReferences),
      WeightGoal,
      PrefetchHooks Function({bool goalID})
    >;
typedef $$HydrationGoalsTableCreateCompanionBuilder =
    HydrationGoalsCompanion Function({
      Value<int> goalID,
      Value<int?> hdrAmount,
      Value<DateTime?> hdrDate,
    });
typedef $$HydrationGoalsTableUpdateCompanionBuilder =
    HydrationGoalsCompanion Function({
      Value<int> goalID,
      Value<int?> hdrAmount,
      Value<DateTime?> hdrDate,
    });

final class $$HydrationGoalsTableReferences
    extends BaseReferences<_$AppDatabase, $HydrationGoalsTable, HydrationGoal> {
  $$HydrationGoalsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GoalsTable _goalIDTable(_$AppDatabase db) =>
      db.goals.createAlias('hydration_goals__goal_i_d__goals__goal_i_d');

  $$GoalsTableProcessedTableManager get goalID {
    final $_column = $_itemColumn<int>('goal_i_d')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.goalID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HydrationGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $HydrationGoalsTable> {
  $$HydrationGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get hdrAmount => $composableBuilder(
    column: $table.hdrAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hdrDate => $composableBuilder(
    column: $table.hdrDate,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalID {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HydrationGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $HydrationGoalsTable> {
  $$HydrationGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get hdrAmount => $composableBuilder(
    column: $table.hdrAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hdrDate => $composableBuilder(
    column: $table.hdrDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalID {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HydrationGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HydrationGoalsTable> {
  $$HydrationGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get hdrAmount =>
      $composableBuilder(column: $table.hdrAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get hdrDate =>
      $composableBuilder(column: $table.hdrDate, builder: (column) => column);

  $$GoalsTableAnnotationComposer get goalID {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HydrationGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HydrationGoalsTable,
          HydrationGoal,
          $$HydrationGoalsTableFilterComposer,
          $$HydrationGoalsTableOrderingComposer,
          $$HydrationGoalsTableAnnotationComposer,
          $$HydrationGoalsTableCreateCompanionBuilder,
          $$HydrationGoalsTableUpdateCompanionBuilder,
          (HydrationGoal, $$HydrationGoalsTableReferences),
          HydrationGoal,
          PrefetchHooks Function({bool goalID})
        > {
  $$HydrationGoalsTableTableManager(
    _$AppDatabase db,
    $HydrationGoalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HydrationGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HydrationGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HydrationGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<int?> hdrAmount = const Value.absent(),
                Value<DateTime?> hdrDate = const Value.absent(),
              }) => HydrationGoalsCompanion(
                goalID: goalID,
                hdrAmount: hdrAmount,
                hdrDate: hdrDate,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<int?> hdrAmount = const Value.absent(),
                Value<DateTime?> hdrDate = const Value.absent(),
              }) => HydrationGoalsCompanion.insert(
                goalID: goalID,
                hdrAmount: hdrAmount,
                hdrDate: hdrDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HydrationGoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalID = false}) {
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
                    if (goalID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.goalID,
                                referencedTable: $$HydrationGoalsTableReferences
                                    ._goalIDTable(db),
                                referencedColumn:
                                    $$HydrationGoalsTableReferences
                                        ._goalIDTable(db)
                                        .goalID,
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

typedef $$HydrationGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HydrationGoalsTable,
      HydrationGoal,
      $$HydrationGoalsTableFilterComposer,
      $$HydrationGoalsTableOrderingComposer,
      $$HydrationGoalsTableAnnotationComposer,
      $$HydrationGoalsTableCreateCompanionBuilder,
      $$HydrationGoalsTableUpdateCompanionBuilder,
      (HydrationGoal, $$HydrationGoalsTableReferences),
      HydrationGoal,
      PrefetchHooks Function({bool goalID})
    >;
typedef $$NutritionGoalsTableCreateCompanionBuilder =
    NutritionGoalsCompanion Function({
      Value<int> goalID,
      Value<String?> nutrientType,
      Value<int?> nutritionDailyTarget,
    });
typedef $$NutritionGoalsTableUpdateCompanionBuilder =
    NutritionGoalsCompanion Function({
      Value<int> goalID,
      Value<String?> nutrientType,
      Value<int?> nutritionDailyTarget,
    });

final class $$NutritionGoalsTableReferences
    extends BaseReferences<_$AppDatabase, $NutritionGoalsTable, NutritionGoal> {
  $$NutritionGoalsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GoalsTable _goalIDTable(_$AppDatabase db) =>
      db.goals.createAlias('nutrition_goals__goal_i_d__goals__goal_i_d');

  $$GoalsTableProcessedTableManager get goalID {
    final $_column = $_itemColumn<int>('goal_i_d')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.goalID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NutritionGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $NutritionGoalsTable> {
  $$NutritionGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nutrientType => $composableBuilder(
    column: $table.nutrientType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nutritionDailyTarget => $composableBuilder(
    column: $table.nutritionDailyTarget,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalID {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NutritionGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $NutritionGoalsTable> {
  $$NutritionGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nutrientType => $composableBuilder(
    column: $table.nutrientType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nutritionDailyTarget => $composableBuilder(
    column: $table.nutritionDailyTarget,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalID {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NutritionGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutritionGoalsTable> {
  $$NutritionGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nutrientType => $composableBuilder(
    column: $table.nutrientType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nutritionDailyTarget => $composableBuilder(
    column: $table.nutritionDailyTarget,
    builder: (column) => column,
  );

  $$GoalsTableAnnotationComposer get goalID {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NutritionGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NutritionGoalsTable,
          NutritionGoal,
          $$NutritionGoalsTableFilterComposer,
          $$NutritionGoalsTableOrderingComposer,
          $$NutritionGoalsTableAnnotationComposer,
          $$NutritionGoalsTableCreateCompanionBuilder,
          $$NutritionGoalsTableUpdateCompanionBuilder,
          (NutritionGoal, $$NutritionGoalsTableReferences),
          NutritionGoal,
          PrefetchHooks Function({bool goalID})
        > {
  $$NutritionGoalsTableTableManager(
    _$AppDatabase db,
    $NutritionGoalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutritionGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutritionGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutritionGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<String?> nutrientType = const Value.absent(),
                Value<int?> nutritionDailyTarget = const Value.absent(),
              }) => NutritionGoalsCompanion(
                goalID: goalID,
                nutrientType: nutrientType,
                nutritionDailyTarget: nutritionDailyTarget,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<String?> nutrientType = const Value.absent(),
                Value<int?> nutritionDailyTarget = const Value.absent(),
              }) => NutritionGoalsCompanion.insert(
                goalID: goalID,
                nutrientType: nutrientType,
                nutritionDailyTarget: nutritionDailyTarget,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NutritionGoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalID = false}) {
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
                    if (goalID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.goalID,
                                referencedTable: $$NutritionGoalsTableReferences
                                    ._goalIDTable(db),
                                referencedColumn:
                                    $$NutritionGoalsTableReferences
                                        ._goalIDTable(db)
                                        .goalID,
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

typedef $$NutritionGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NutritionGoalsTable,
      NutritionGoal,
      $$NutritionGoalsTableFilterComposer,
      $$NutritionGoalsTableOrderingComposer,
      $$NutritionGoalsTableAnnotationComposer,
      $$NutritionGoalsTableCreateCompanionBuilder,
      $$NutritionGoalsTableUpdateCompanionBuilder,
      (NutritionGoal, $$NutritionGoalsTableReferences),
      NutritionGoal,
      PrefetchHooks Function({bool goalID})
    >;
typedef $$UserGoalProgressTableCreateCompanionBuilder =
    UserGoalProgressCompanion Function({
      Value<int> userGoalID,
      required int userID,
      required int goalID,
      Value<DateTime> dateCreated,
      Value<bool> isMain,
      Value<bool> isComplete,
      Value<double> progressValue,
    });
typedef $$UserGoalProgressTableUpdateCompanionBuilder =
    UserGoalProgressCompanion Function({
      Value<int> userGoalID,
      Value<int> userID,
      Value<int> goalID,
      Value<DateTime> dateCreated,
      Value<bool> isMain,
      Value<bool> isComplete,
      Value<double> progressValue,
    });

final class $$UserGoalProgressTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserGoalProgressTable,
          UserGoalProgressData
        > {
  $$UserGoalProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('user_goal_progress__user_i_d__users__user_i_d');

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

  static $GoalsTable _goalIDTable(_$AppDatabase db) =>
      db.goals.createAlias('user_goal_progress__goal_i_d__goals__goal_i_d');

  $$GoalsTableProcessedTableManager get goalID {
    final $_column = $_itemColumn<int>('goal_i_d')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.goalID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ReinforcementsTable, List<Reinforcement>>
  _reinforcementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reinforcements,
    aliasName:
        'user_goal_progress__user_goal_i_d__reinforcements__user_goal_i_d',
  );

  $$ReinforcementsTableProcessedTableManager get reinforcementsRefs {
    final manager = $$ReinforcementsTableTableManager($_db, $_db.reinforcements)
        .filter(
          (f) => f.userGoalID.userGoalID.sqlEquals(
            $_itemColumn<int>('user_goal_i_d')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_reinforcementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserGoalProgressTableFilterComposer
    extends Composer<_$AppDatabase, $UserGoalProgressTable> {
  $$UserGoalProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userGoalID => $composableBuilder(
    column: $table.userGoalID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMain => $composableBuilder(
    column: $table.isMain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progressValue => $composableBuilder(
    column: $table.progressValue,
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

  $$GoalsTableFilterComposer get goalID {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> reinforcementsRefs(
    Expression<bool> Function($$ReinforcementsTableFilterComposer f) f,
  ) {
    final $$ReinforcementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGoalID,
      referencedTable: $db.reinforcements,
      getReferencedColumn: (t) => t.userGoalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReinforcementsTableFilterComposer(
            $db: $db,
            $table: $db.reinforcements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserGoalProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $UserGoalProgressTable> {
  $$UserGoalProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userGoalID => $composableBuilder(
    column: $table.userGoalID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMain => $composableBuilder(
    column: $table.isMain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progressValue => $composableBuilder(
    column: $table.progressValue,
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

  $$GoalsTableOrderingComposer get goalID {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserGoalProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserGoalProgressTable> {
  $$UserGoalProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userGoalID => $composableBuilder(
    column: $table.userGoalID,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMain =>
      $composableBuilder(column: $table.isMain, builder: (column) => column);

  GeneratedColumn<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => column,
  );

  GeneratedColumn<double> get progressValue => $composableBuilder(
    column: $table.progressValue,
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

  $$GoalsTableAnnotationComposer get goalID {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.goalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> reinforcementsRefs<T extends Object>(
    Expression<T> Function($$ReinforcementsTableAnnotationComposer a) f,
  ) {
    final $$ReinforcementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGoalID,
      referencedTable: $db.reinforcements,
      getReferencedColumn: (t) => t.userGoalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReinforcementsTableAnnotationComposer(
            $db: $db,
            $table: $db.reinforcements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserGoalProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserGoalProgressTable,
          UserGoalProgressData,
          $$UserGoalProgressTableFilterComposer,
          $$UserGoalProgressTableOrderingComposer,
          $$UserGoalProgressTableAnnotationComposer,
          $$UserGoalProgressTableCreateCompanionBuilder,
          $$UserGoalProgressTableUpdateCompanionBuilder,
          (UserGoalProgressData, $$UserGoalProgressTableReferences),
          UserGoalProgressData,
          PrefetchHooks Function({
            bool userID,
            bool goalID,
            bool reinforcementsRefs,
          })
        > {
  $$UserGoalProgressTableTableManager(
    _$AppDatabase db,
    $UserGoalProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserGoalProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserGoalProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserGoalProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userGoalID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<int> goalID = const Value.absent(),
                Value<DateTime> dateCreated = const Value.absent(),
                Value<bool> isMain = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
                Value<double> progressValue = const Value.absent(),
              }) => UserGoalProgressCompanion(
                userGoalID: userGoalID,
                userID: userID,
                goalID: goalID,
                dateCreated: dateCreated,
                isMain: isMain,
                isComplete: isComplete,
                progressValue: progressValue,
              ),
          createCompanionCallback:
              ({
                Value<int> userGoalID = const Value.absent(),
                required int userID,
                required int goalID,
                Value<DateTime> dateCreated = const Value.absent(),
                Value<bool> isMain = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
                Value<double> progressValue = const Value.absent(),
              }) => UserGoalProgressCompanion.insert(
                userGoalID: userGoalID,
                userID: userID,
                goalID: goalID,
                dateCreated: dateCreated,
                isMain: isMain,
                isComplete: isComplete,
                progressValue: progressValue,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserGoalProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userID = false, goalID = false, reinforcementsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reinforcementsRefs) db.reinforcements,
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
                                    referencedTable:
                                        $$UserGoalProgressTableReferences
                                            ._userIDTable(db),
                                    referencedColumn:
                                        $$UserGoalProgressTableReferences
                                            ._userIDTable(db)
                                            .userID,
                                  )
                                  as T;
                        }
                        if (goalID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.goalID,
                                    referencedTable:
                                        $$UserGoalProgressTableReferences
                                            ._goalIDTable(db),
                                    referencedColumn:
                                        $$UserGoalProgressTableReferences
                                            ._goalIDTable(db)
                                            .goalID,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reinforcementsRefs)
                        await $_getPrefetchedData<
                          UserGoalProgressData,
                          $UserGoalProgressTable,
                          Reinforcement
                        >(
                          currentTable: table,
                          referencedTable: $$UserGoalProgressTableReferences
                              ._reinforcementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserGoalProgressTableReferences(
                                db,
                                table,
                                p0,
                              ).reinforcementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userGoalID == item.userGoalID,
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

typedef $$UserGoalProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserGoalProgressTable,
      UserGoalProgressData,
      $$UserGoalProgressTableFilterComposer,
      $$UserGoalProgressTableOrderingComposer,
      $$UserGoalProgressTableAnnotationComposer,
      $$UserGoalProgressTableCreateCompanionBuilder,
      $$UserGoalProgressTableUpdateCompanionBuilder,
      (UserGoalProgressData, $$UserGoalProgressTableReferences),
      UserGoalProgressData,
      PrefetchHooks Function({
        bool userID,
        bool goalID,
        bool reinforcementsRefs,
      })
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      Value<int> achID,
      required String name,
      required String description,
      required AchievementType type,
      required UnlockType unlockType,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<int> achID,
      Value<String> name,
      Value<String> description,
      Value<AchievementType> type,
      Value<UnlockType> unlockType,
    });

final class $$AchievementsTableReferences
    extends BaseReferences<_$AppDatabase, $AchievementsTable, Achievement> {
  $$AchievementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReinforcementsTable, List<Reinforcement>>
  _reinforcementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reinforcements,
    aliasName: 'achievements__ach_i_d__reinforcements__ach_i_d',
  );

  $$ReinforcementsTableProcessedTableManager get reinforcementsRefs {
    final manager = $$ReinforcementsTableTableManager(
      $_db,
      $_db.reinforcements,
    ).filter((f) => f.achID.achID.sqlEquals($_itemColumn<int>('ach_i_d')!));

    final cache = $_typedResult.readTableOrNull(_reinforcementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get achID => $composableBuilder(
    column: $table.achID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AchievementType, AchievementType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<UnlockType, UnlockType, String>
  get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> reinforcementsRefs(
    Expression<bool> Function($$ReinforcementsTableFilterComposer f) f,
  ) {
    final $$ReinforcementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achID,
      referencedTable: $db.reinforcements,
      getReferencedColumn: (t) => t.achID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReinforcementsTableFilterComposer(
            $db: $db,
            $table: $db.reinforcements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get achID => $composableBuilder(
    column: $table.achID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get achID =>
      $composableBuilder(column: $table.achID, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<AchievementType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UnlockType, String> get unlockType =>
      $composableBuilder(
        column: $table.unlockType,
        builder: (column) => column,
      );

  Expression<T> reinforcementsRefs<T extends Object>(
    Expression<T> Function($$ReinforcementsTableAnnotationComposer a) f,
  ) {
    final $$ReinforcementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achID,
      referencedTable: $db.reinforcements,
      getReferencedColumn: (t) => t.achID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReinforcementsTableAnnotationComposer(
            $db: $db,
            $table: $db.reinforcements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          Achievement,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (Achievement, $$AchievementsTableReferences),
          Achievement,
          PrefetchHooks Function({bool reinforcementsRefs})
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> achID = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<AchievementType> type = const Value.absent(),
                Value<UnlockType> unlockType = const Value.absent(),
              }) => AchievementsCompanion(
                achID: achID,
                name: name,
                description: description,
                type: type,
                unlockType: unlockType,
              ),
          createCompanionCallback:
              ({
                Value<int> achID = const Value.absent(),
                required String name,
                required String description,
                required AchievementType type,
                required UnlockType unlockType,
              }) => AchievementsCompanion.insert(
                achID: achID,
                name: name,
                description: description,
                type: type,
                unlockType: unlockType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AchievementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reinforcementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reinforcementsRefs) db.reinforcements,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reinforcementsRefs)
                    await $_getPrefetchedData<
                      Achievement,
                      $AchievementsTable,
                      Reinforcement
                    >(
                      currentTable: table,
                      referencedTable: $$AchievementsTableReferences
                          ._reinforcementsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AchievementsTableReferences(
                            db,
                            table,
                            p0,
                          ).reinforcementsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.achID == item.achID),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      Achievement,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (Achievement, $$AchievementsTableReferences),
      Achievement,
      PrefetchHooks Function({bool reinforcementsRefs})
    >;
typedef $$ReinforcementsTableCreateCompanionBuilder =
    ReinforcementsCompanion Function({
      Value<int> reinID,
      required int userGoalID,
      Value<int?> achID,
      required ReinforcementType reinType,
      Value<String> displayContext,
      Value<int> priority,
    });
typedef $$ReinforcementsTableUpdateCompanionBuilder =
    ReinforcementsCompanion Function({
      Value<int> reinID,
      Value<int> userGoalID,
      Value<int?> achID,
      Value<ReinforcementType> reinType,
      Value<String> displayContext,
      Value<int> priority,
    });

final class $$ReinforcementsTableReferences
    extends BaseReferences<_$AppDatabase, $ReinforcementsTable, Reinforcement> {
  $$ReinforcementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserGoalProgressTable _userGoalIDTable(_$AppDatabase db) =>
      db.userGoalProgress.createAlias(
        'reinforcements__user_goal_i_d__user_goal_progress__user_goal_i_d',
      );

  $$UserGoalProgressTableProcessedTableManager get userGoalID {
    final $_column = $_itemColumn<int>('user_goal_i_d')!;

    final manager = $$UserGoalProgressTableTableManager(
      $_db,
      $_db.userGoalProgress,
    ).filter((f) => f.userGoalID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userGoalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AchievementsTable _achIDTable(_$AppDatabase db) => db.achievements
      .createAlias('reinforcements__ach_i_d__achievements__ach_i_d');

  $$AchievementsTableProcessedTableManager? get achID {
    final $_column = $_itemColumn<int>('ach_i_d');
    if ($_column == null) return null;
    final manager = $$AchievementsTableTableManager(
      $_db,
      $_db.achievements,
    ).filter((f) => f.achID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_achIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReinforcementsTableFilterComposer
    extends Composer<_$AppDatabase, $ReinforcementsTable> {
  $$ReinforcementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get reinID => $composableBuilder(
    column: $table.reinID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ReinforcementType, ReinforcementType, String>
  get reinType => $composableBuilder(
    column: $table.reinType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get displayContext => $composableBuilder(
    column: $table.displayContext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  $$UserGoalProgressTableFilterComposer get userGoalID {
    final $$UserGoalProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGoalID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.userGoalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableFilterComposer(
            $db: $db,
            $table: $db.userGoalProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AchievementsTableFilterComposer get achID {
    final $$AchievementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achID,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.achID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableFilterComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReinforcementsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReinforcementsTable> {
  $$ReinforcementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get reinID => $composableBuilder(
    column: $table.reinID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reinType => $composableBuilder(
    column: $table.reinType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayContext => $composableBuilder(
    column: $table.displayContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserGoalProgressTableOrderingComposer get userGoalID {
    final $$UserGoalProgressTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGoalID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.userGoalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableOrderingComposer(
            $db: $db,
            $table: $db.userGoalProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AchievementsTableOrderingComposer get achID {
    final $$AchievementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achID,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.achID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableOrderingComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReinforcementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReinforcementsTable> {
  $$ReinforcementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get reinID =>
      $composableBuilder(column: $table.reinID, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReinforcementType, String> get reinType =>
      $composableBuilder(column: $table.reinType, builder: (column) => column);

  GeneratedColumn<String> get displayContext => $composableBuilder(
    column: $table.displayContext,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  $$UserGoalProgressTableAnnotationComposer get userGoalID {
    final $$UserGoalProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userGoalID,
      referencedTable: $db.userGoalProgress,
      getReferencedColumn: (t) => t.userGoalID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserGoalProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.userGoalProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AchievementsTableAnnotationComposer get achID {
    final $$AchievementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achID,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.achID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableAnnotationComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReinforcementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReinforcementsTable,
          Reinforcement,
          $$ReinforcementsTableFilterComposer,
          $$ReinforcementsTableOrderingComposer,
          $$ReinforcementsTableAnnotationComposer,
          $$ReinforcementsTableCreateCompanionBuilder,
          $$ReinforcementsTableUpdateCompanionBuilder,
          (Reinforcement, $$ReinforcementsTableReferences),
          Reinforcement,
          PrefetchHooks Function({bool userGoalID, bool achID})
        > {
  $$ReinforcementsTableTableManager(
    _$AppDatabase db,
    $ReinforcementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReinforcementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReinforcementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReinforcementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> reinID = const Value.absent(),
                Value<int> userGoalID = const Value.absent(),
                Value<int?> achID = const Value.absent(),
                Value<ReinforcementType> reinType = const Value.absent(),
                Value<String> displayContext = const Value.absent(),
                Value<int> priority = const Value.absent(),
              }) => ReinforcementsCompanion(
                reinID: reinID,
                userGoalID: userGoalID,
                achID: achID,
                reinType: reinType,
                displayContext: displayContext,
                priority: priority,
              ),
          createCompanionCallback:
              ({
                Value<int> reinID = const Value.absent(),
                required int userGoalID,
                Value<int?> achID = const Value.absent(),
                required ReinforcementType reinType,
                Value<String> displayContext = const Value.absent(),
                Value<int> priority = const Value.absent(),
              }) => ReinforcementsCompanion.insert(
                reinID: reinID,
                userGoalID: userGoalID,
                achID: achID,
                reinType: reinType,
                displayContext: displayContext,
                priority: priority,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReinforcementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userGoalID = false, achID = false}) {
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
                    if (userGoalID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userGoalID,
                                referencedTable: $$ReinforcementsTableReferences
                                    ._userGoalIDTable(db),
                                referencedColumn:
                                    $$ReinforcementsTableReferences
                                        ._userGoalIDTable(db)
                                        .userGoalID,
                              )
                              as T;
                    }
                    if (achID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.achID,
                                referencedTable: $$ReinforcementsTableReferences
                                    ._achIDTable(db),
                                referencedColumn:
                                    $$ReinforcementsTableReferences
                                        ._achIDTable(db)
                                        .achID,
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

typedef $$ReinforcementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReinforcementsTable,
      Reinforcement,
      $$ReinforcementsTableFilterComposer,
      $$ReinforcementsTableOrderingComposer,
      $$ReinforcementsTableAnnotationComposer,
      $$ReinforcementsTableCreateCompanionBuilder,
      $$ReinforcementsTableUpdateCompanionBuilder,
      (Reinforcement, $$ReinforcementsTableReferences),
      Reinforcement,
      PrefetchHooks Function({bool userGoalID, bool achID})
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
  $$StreaksTableTableManager get streaks =>
      $$StreaksTableTableManager(_db, _db.streaks);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$FastingGoalsTableTableManager get fastingGoals =>
      $$FastingGoalsTableTableManager(_db, _db.fastingGoals);
  $$WeightGoalsTableTableManager get weightGoals =>
      $$WeightGoalsTableTableManager(_db, _db.weightGoals);
  $$HydrationGoalsTableTableManager get hydrationGoals =>
      $$HydrationGoalsTableTableManager(_db, _db.hydrationGoals);
  $$NutritionGoalsTableTableManager get nutritionGoals =>
      $$NutritionGoalsTableTableManager(_db, _db.nutritionGoals);
  $$UserGoalProgressTableTableManager get userGoalProgress =>
      $$UserGoalProgressTableTableManager(_db, _db.userGoalProgress);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$ReinforcementsTableTableManager get reinforcements =>
      $$ReinforcementsTableTableManager(_db, _db.reinforcements);
}
