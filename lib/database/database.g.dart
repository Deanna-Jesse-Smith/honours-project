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
  @override
  late final GeneratedColumnWithTypeConverter<FastingForm, String> formIF =
      GeneratedColumn<String>(
        'form_i_f',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FastingForm>($UsersTable.$converterformIF);
  @override
  late final GeneratedColumnWithTypeConverter<Experience, String> experience =
      GeneratedColumn<String>(
        'experience',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Experience>($UsersTable.$converterexperience);
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
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isGenderMeta = const VerificationMeta(
    'isGender',
  );
  @override
  late final GeneratedColumn<bool> isGender = GeneratedColumn<bool>(
    'is_gender',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_gender" IN (0, 1))',
    ),
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
    height,
    isGender,
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
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('is_gender')) {
      context.handle(
        _isGenderMeta,
        isGender.isAcceptableOrUnknown(data['is_gender']!, _isGenderMeta),
      );
    } else if (isInserting) {
      context.missing(_isGenderMeta);
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
      formIF: $UsersTable.$converterformIF.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}form_i_f'],
        )!,
      ),
      experience: $UsersTable.$converterexperience.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}experience'],
        )!,
      ),
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
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      )!,
      isGender: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_gender'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FastingForm, String, String> $converterformIF =
      const EnumNameConverter<FastingForm>(FastingForm.values);
  static JsonTypeConverter2<Experience, String, String> $converterexperience =
      const EnumNameConverter<Experience>(Experience.values);
}

class User extends DataClass implements Insertable<User> {
  final int userID;
  final String name;
  final bool isMetric;
  final FastingForm formIF;
  final Experience experience;
  final DateTime? typicalEatingStart;
  final DateTime? typicalEatingEnd;
  final DateTime createdDate;
  final String adfDaysSelected;
  final String fiveTwoDaysSelected;
  final double height;
  final bool isGender;
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
    required this.height,
    required this.isGender,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_i_d'] = Variable<int>(userID);
    map['name'] = Variable<String>(name);
    map['is_metric'] = Variable<bool>(isMetric);
    {
      map['form_i_f'] = Variable<String>(
        $UsersTable.$converterformIF.toSql(formIF),
      );
    }
    {
      map['experience'] = Variable<String>(
        $UsersTable.$converterexperience.toSql(experience),
      );
    }
    if (!nullToAbsent || typicalEatingStart != null) {
      map['typical_eating_start'] = Variable<DateTime>(typicalEatingStart);
    }
    if (!nullToAbsent || typicalEatingEnd != null) {
      map['typical_eating_end'] = Variable<DateTime>(typicalEatingEnd);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    map['adf_days_selected'] = Variable<String>(adfDaysSelected);
    map['five_two_days_selected'] = Variable<String>(fiveTwoDaysSelected);
    map['height'] = Variable<double>(height);
    map['is_gender'] = Variable<bool>(isGender);
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
      height: Value(height),
      isGender: Value(isGender),
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
      formIF: $UsersTable.$converterformIF.fromJson(
        serializer.fromJson<String>(json['formIF']),
      ),
      experience: $UsersTable.$converterexperience.fromJson(
        serializer.fromJson<String>(json['experience']),
      ),
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
      height: serializer.fromJson<double>(json['height']),
      isGender: serializer.fromJson<bool>(json['isGender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<int>(userID),
      'name': serializer.toJson<String>(name),
      'isMetric': serializer.toJson<bool>(isMetric),
      'formIF': serializer.toJson<String>(
        $UsersTable.$converterformIF.toJson(formIF),
      ),
      'experience': serializer.toJson<String>(
        $UsersTable.$converterexperience.toJson(experience),
      ),
      'typicalEatingStart': serializer.toJson<DateTime?>(typicalEatingStart),
      'typicalEatingEnd': serializer.toJson<DateTime?>(typicalEatingEnd),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'adfDaysSelected': serializer.toJson<String>(adfDaysSelected),
      'fiveTwoDaysSelected': serializer.toJson<String>(fiveTwoDaysSelected),
      'height': serializer.toJson<double>(height),
      'isGender': serializer.toJson<bool>(isGender),
    };
  }

  User copyWith({
    int? userID,
    String? name,
    bool? isMetric,
    FastingForm? formIF,
    Experience? experience,
    Value<DateTime?> typicalEatingStart = const Value.absent(),
    Value<DateTime?> typicalEatingEnd = const Value.absent(),
    DateTime? createdDate,
    String? adfDaysSelected,
    String? fiveTwoDaysSelected,
    double? height,
    bool? isGender,
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
    height: height ?? this.height,
    isGender: isGender ?? this.isGender,
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
      height: data.height.present ? data.height.value : this.height,
      isGender: data.isGender.present ? data.isGender.value : this.isGender,
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
          ..write('fiveTwoDaysSelected: $fiveTwoDaysSelected, ')
          ..write('height: $height, ')
          ..write('isGender: $isGender')
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
    height,
    isGender,
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
          other.fiveTwoDaysSelected == this.fiveTwoDaysSelected &&
          other.height == this.height &&
          other.isGender == this.isGender);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userID;
  final Value<String> name;
  final Value<bool> isMetric;
  final Value<FastingForm> formIF;
  final Value<Experience> experience;
  final Value<DateTime?> typicalEatingStart;
  final Value<DateTime?> typicalEatingEnd;
  final Value<DateTime> createdDate;
  final Value<String> adfDaysSelected;
  final Value<String> fiveTwoDaysSelected;
  final Value<double> height;
  final Value<bool> isGender;
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
    this.height = const Value.absent(),
    this.isGender = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userID = const Value.absent(),
    required String name,
    this.isMetric = const Value.absent(),
    required FastingForm formIF,
    required Experience experience,
    this.typicalEatingStart = const Value.absent(),
    this.typicalEatingEnd = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.adfDaysSelected = const Value.absent(),
    this.fiveTwoDaysSelected = const Value.absent(),
    required double height,
    required bool isGender,
  }) : name = Value(name),
       formIF = Value(formIF),
       experience = Value(experience),
       height = Value(height),
       isGender = Value(isGender);
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
    Expression<double>? height,
    Expression<bool>? isGender,
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
      if (height != null) 'height': height,
      if (isGender != null) 'is_gender': isGender,
    });
  }

  UsersCompanion copyWith({
    Value<int>? userID,
    Value<String>? name,
    Value<bool>? isMetric,
    Value<FastingForm>? formIF,
    Value<Experience>? experience,
    Value<DateTime?>? typicalEatingStart,
    Value<DateTime?>? typicalEatingEnd,
    Value<DateTime>? createdDate,
    Value<String>? adfDaysSelected,
    Value<String>? fiveTwoDaysSelected,
    Value<double>? height,
    Value<bool>? isGender,
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
      height: height ?? this.height,
      isGender: isGender ?? this.isGender,
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
      map['form_i_f'] = Variable<String>(
        $UsersTable.$converterformIF.toSql(formIF.value),
      );
    }
    if (experience.present) {
      map['experience'] = Variable<String>(
        $UsersTable.$converterexperience.toSql(experience.value),
      );
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
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (isGender.present) {
      map['is_gender'] = Variable<bool>(isGender.value);
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
          ..write('fiveTwoDaysSelected: $fiveTwoDaysSelected, ')
          ..write('height: $height, ')
          ..write('isGender: $isGender')
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
  @override
  late final GeneratedColumnWithTypeConverter<FastingForm, String> formIF =
      GeneratedColumn<String>(
        'form_i_f',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FastingForm>($FastLogTable.$converterformIF);
  @override
  late final GeneratedColumnWithTypeConverter<FastResult, String>
  earlyFastResult = GeneratedColumn<String>(
    'early_fast_result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<FastResult>($FastLogTable.$converterearlyFastResult);
  @override
  late final GeneratedColumnWithTypeConverter<FastResult?, String>
  lateFastResult = GeneratedColumn<String>(
    'late_fast_result',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<FastResult?>($FastLogTable.$converterlateFastResultn);
  static const VerificationMeta _earlyResultSeverityMeta =
      const VerificationMeta('earlyResultSeverity');
  @override
  late final GeneratedColumn<int> earlyResultSeverity = GeneratedColumn<int>(
    'early_result_severity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lateResultSeverityMeta =
      const VerificationMeta('lateResultSeverity');
  @override
  late final GeneratedColumn<int> lateResultSeverity = GeneratedColumn<int>(
    'late_result_severity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    earlyFastResult,
    lateFastResult,
    earlyResultSeverity,
    lateResultSeverity,
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
    if (data.containsKey('early_result_severity')) {
      context.handle(
        _earlyResultSeverityMeta,
        earlyResultSeverity.isAcceptableOrUnknown(
          data['early_result_severity']!,
          _earlyResultSeverityMeta,
        ),
      );
    }
    if (data.containsKey('late_result_severity')) {
      context.handle(
        _lateResultSeverityMeta,
        lateResultSeverity.isAcceptableOrUnknown(
          data['late_result_severity']!,
          _lateResultSeverityMeta,
        ),
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
      formIF: $FastLogTable.$converterformIF.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}form_i_f'],
        )!,
      ),
      earlyFastResult: $FastLogTable.$converterearlyFastResult.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}early_fast_result'],
        )!,
      ),
      lateFastResult: $FastLogTable.$converterlateFastResultn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}late_fast_result'],
        ),
      ),
      earlyResultSeverity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}early_result_severity'],
      )!,
      lateResultSeverity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}late_result_severity'],
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

  static JsonTypeConverter2<FastingForm, String, String> $converterformIF =
      const EnumNameConverter<FastingForm>(FastingForm.values);
  static JsonTypeConverter2<FastResult, String, String>
  $converterearlyFastResult = const EnumNameConverter<FastResult>(
    FastResult.values,
  );
  static JsonTypeConverter2<FastResult, String, String>
  $converterlateFastResult = const EnumNameConverter<FastResult>(
    FastResult.values,
  );
  static JsonTypeConverter2<FastResult?, String?, String?>
  $converterlateFastResultn = JsonTypeConverter2.asNullable(
    $converterlateFastResult,
  );
}

class FastLogData extends DataClass implements Insertable<FastLogData> {
  final int fastLogID;
  final int userID;
  final FastingForm formIF;
  final FastResult earlyFastResult;
  final FastResult? lateFastResult;
  final int earlyResultSeverity;
  final int lateResultSeverity;
  final DateTime startDateTime;
  final DateTime? endDateTime;
  const FastLogData({
    required this.fastLogID,
    required this.userID,
    required this.formIF,
    required this.earlyFastResult,
    this.lateFastResult,
    required this.earlyResultSeverity,
    required this.lateResultSeverity,
    required this.startDateTime,
    this.endDateTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['fast_log_i_d'] = Variable<int>(fastLogID);
    map['user_i_d'] = Variable<int>(userID);
    {
      map['form_i_f'] = Variable<String>(
        $FastLogTable.$converterformIF.toSql(formIF),
      );
    }
    {
      map['early_fast_result'] = Variable<String>(
        $FastLogTable.$converterearlyFastResult.toSql(earlyFastResult),
      );
    }
    if (!nullToAbsent || lateFastResult != null) {
      map['late_fast_result'] = Variable<String>(
        $FastLogTable.$converterlateFastResultn.toSql(lateFastResult),
      );
    }
    map['early_result_severity'] = Variable<int>(earlyResultSeverity);
    map['late_result_severity'] = Variable<int>(lateResultSeverity);
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
      earlyFastResult: Value(earlyFastResult),
      lateFastResult: lateFastResult == null && nullToAbsent
          ? const Value.absent()
          : Value(lateFastResult),
      earlyResultSeverity: Value(earlyResultSeverity),
      lateResultSeverity: Value(lateResultSeverity),
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
      formIF: $FastLogTable.$converterformIF.fromJson(
        serializer.fromJson<String>(json['formIF']),
      ),
      earlyFastResult: $FastLogTable.$converterearlyFastResult.fromJson(
        serializer.fromJson<String>(json['earlyFastResult']),
      ),
      lateFastResult: $FastLogTable.$converterlateFastResultn.fromJson(
        serializer.fromJson<String?>(json['lateFastResult']),
      ),
      earlyResultSeverity: serializer.fromJson<int>(
        json['earlyResultSeverity'],
      ),
      lateResultSeverity: serializer.fromJson<int>(json['lateResultSeverity']),
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
      'formIF': serializer.toJson<String>(
        $FastLogTable.$converterformIF.toJson(formIF),
      ),
      'earlyFastResult': serializer.toJson<String>(
        $FastLogTable.$converterearlyFastResult.toJson(earlyFastResult),
      ),
      'lateFastResult': serializer.toJson<String?>(
        $FastLogTable.$converterlateFastResultn.toJson(lateFastResult),
      ),
      'earlyResultSeverity': serializer.toJson<int>(earlyResultSeverity),
      'lateResultSeverity': serializer.toJson<int>(lateResultSeverity),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'endDateTime': serializer.toJson<DateTime?>(endDateTime),
    };
  }

  FastLogData copyWith({
    int? fastLogID,
    int? userID,
    FastingForm? formIF,
    FastResult? earlyFastResult,
    Value<FastResult?> lateFastResult = const Value.absent(),
    int? earlyResultSeverity,
    int? lateResultSeverity,
    DateTime? startDateTime,
    Value<DateTime?> endDateTime = const Value.absent(),
  }) => FastLogData(
    fastLogID: fastLogID ?? this.fastLogID,
    userID: userID ?? this.userID,
    formIF: formIF ?? this.formIF,
    earlyFastResult: earlyFastResult ?? this.earlyFastResult,
    lateFastResult: lateFastResult.present
        ? lateFastResult.value
        : this.lateFastResult,
    earlyResultSeverity: earlyResultSeverity ?? this.earlyResultSeverity,
    lateResultSeverity: lateResultSeverity ?? this.lateResultSeverity,
    startDateTime: startDateTime ?? this.startDateTime,
    endDateTime: endDateTime.present ? endDateTime.value : this.endDateTime,
  );
  FastLogData copyWithCompanion(FastLogCompanion data) {
    return FastLogData(
      fastLogID: data.fastLogID.present ? data.fastLogID.value : this.fastLogID,
      userID: data.userID.present ? data.userID.value : this.userID,
      formIF: data.formIF.present ? data.formIF.value : this.formIF,
      earlyFastResult: data.earlyFastResult.present
          ? data.earlyFastResult.value
          : this.earlyFastResult,
      lateFastResult: data.lateFastResult.present
          ? data.lateFastResult.value
          : this.lateFastResult,
      earlyResultSeverity: data.earlyResultSeverity.present
          ? data.earlyResultSeverity.value
          : this.earlyResultSeverity,
      lateResultSeverity: data.lateResultSeverity.present
          ? data.lateResultSeverity.value
          : this.lateResultSeverity,
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
          ..write('earlyFastResult: $earlyFastResult, ')
          ..write('lateFastResult: $lateFastResult, ')
          ..write('earlyResultSeverity: $earlyResultSeverity, ')
          ..write('lateResultSeverity: $lateResultSeverity, ')
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
    earlyFastResult,
    lateFastResult,
    earlyResultSeverity,
    lateResultSeverity,
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
          other.earlyFastResult == this.earlyFastResult &&
          other.lateFastResult == this.lateFastResult &&
          other.earlyResultSeverity == this.earlyResultSeverity &&
          other.lateResultSeverity == this.lateResultSeverity &&
          other.startDateTime == this.startDateTime &&
          other.endDateTime == this.endDateTime);
}

class FastLogCompanion extends UpdateCompanion<FastLogData> {
  final Value<int> fastLogID;
  final Value<int> userID;
  final Value<FastingForm> formIF;
  final Value<FastResult> earlyFastResult;
  final Value<FastResult?> lateFastResult;
  final Value<int> earlyResultSeverity;
  final Value<int> lateResultSeverity;
  final Value<DateTime> startDateTime;
  final Value<DateTime?> endDateTime;
  const FastLogCompanion({
    this.fastLogID = const Value.absent(),
    this.userID = const Value.absent(),
    this.formIF = const Value.absent(),
    this.earlyFastResult = const Value.absent(),
    this.lateFastResult = const Value.absent(),
    this.earlyResultSeverity = const Value.absent(),
    this.lateResultSeverity = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  });
  FastLogCompanion.insert({
    this.fastLogID = const Value.absent(),
    required int userID,
    required FastingForm formIF,
    required FastResult earlyFastResult,
    this.lateFastResult = const Value.absent(),
    this.earlyResultSeverity = const Value.absent(),
    this.lateResultSeverity = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
  }) : userID = Value(userID),
       formIF = Value(formIF),
       earlyFastResult = Value(earlyFastResult);
  static Insertable<FastLogData> custom({
    Expression<int>? fastLogID,
    Expression<int>? userID,
    Expression<String>? formIF,
    Expression<String>? earlyFastResult,
    Expression<String>? lateFastResult,
    Expression<int>? earlyResultSeverity,
    Expression<int>? lateResultSeverity,
    Expression<DateTime>? startDateTime,
    Expression<DateTime>? endDateTime,
  }) {
    return RawValuesInsertable({
      if (fastLogID != null) 'fast_log_i_d': fastLogID,
      if (userID != null) 'user_i_d': userID,
      if (formIF != null) 'form_i_f': formIF,
      if (earlyFastResult != null) 'early_fast_result': earlyFastResult,
      if (lateFastResult != null) 'late_fast_result': lateFastResult,
      if (earlyResultSeverity != null)
        'early_result_severity': earlyResultSeverity,
      if (lateResultSeverity != null)
        'late_result_severity': lateResultSeverity,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (endDateTime != null) 'end_date_time': endDateTime,
    });
  }

  FastLogCompanion copyWith({
    Value<int>? fastLogID,
    Value<int>? userID,
    Value<FastingForm>? formIF,
    Value<FastResult>? earlyFastResult,
    Value<FastResult?>? lateFastResult,
    Value<int>? earlyResultSeverity,
    Value<int>? lateResultSeverity,
    Value<DateTime>? startDateTime,
    Value<DateTime?>? endDateTime,
  }) {
    return FastLogCompanion(
      fastLogID: fastLogID ?? this.fastLogID,
      userID: userID ?? this.userID,
      formIF: formIF ?? this.formIF,
      earlyFastResult: earlyFastResult ?? this.earlyFastResult,
      lateFastResult: lateFastResult ?? this.lateFastResult,
      earlyResultSeverity: earlyResultSeverity ?? this.earlyResultSeverity,
      lateResultSeverity: lateResultSeverity ?? this.lateResultSeverity,
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
      map['form_i_f'] = Variable<String>(
        $FastLogTable.$converterformIF.toSql(formIF.value),
      );
    }
    if (earlyFastResult.present) {
      map['early_fast_result'] = Variable<String>(
        $FastLogTable.$converterearlyFastResult.toSql(earlyFastResult.value),
      );
    }
    if (lateFastResult.present) {
      map['late_fast_result'] = Variable<String>(
        $FastLogTable.$converterlateFastResultn.toSql(lateFastResult.value),
      );
    }
    if (earlyResultSeverity.present) {
      map['early_result_severity'] = Variable<int>(earlyResultSeverity.value);
    }
    if (lateResultSeverity.present) {
      map['late_result_severity'] = Variable<int>(lateResultSeverity.value);
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
          ..write('earlyFastResult: $earlyFastResult, ')
          ..write('lateFastResult: $lateFastResult, ')
          ..write('earlyResultSeverity: $earlyResultSeverity, ')
          ..write('lateResultSeverity: $lateResultSeverity, ')
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
  final double carbs;
  final double fat;
  final double protein;
  final double fibre;
  final double calories;
  const FoodData({
    required this.foodID,
    required this.name,
    required this.servingDescription,
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
    double? carbs,
    double? fat,
    double? protein,
    double? fibre,
    double? calories,
  }) => FoodData(
    foodID: foodID ?? this.foodID,
    name: name ?? this.name,
    servingDescription: servingDescription ?? this.servingDescription,
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
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double> protein;
  final Value<double> fibre;
  final Value<double> calories;
  const FoodCompanion({
    this.foodID = const Value.absent(),
    this.name = const Value.absent(),
    this.servingDescription = const Value.absent(),
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
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  }) : name = Value(name),
       servingDescription = Value(servingDescription);
  static Insertable<FoodData> custom({
    Expression<int>? foodID,
    Expression<String>? name,
    Expression<String>? servingDescription,
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
  static const VerificationMeta _servingSizeGramsMeta = const VerificationMeta(
    'servingSizeGrams',
  );
  @override
  late final GeneratedColumn<double> servingSizeGrams = GeneratedColumn<double>(
    'serving_size_grams',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    recipeID,
    recipeName,
    isFavourite,
    servingSizeGrams,
  ];
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
    if (data.containsKey('serving_size_grams')) {
      context.handle(
        _servingSizeGramsMeta,
        servingSizeGrams.isAcceptableOrUnknown(
          data['serving_size_grams']!,
          _servingSizeGramsMeta,
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
      servingSizeGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}serving_size_grams'],
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
  final double servingSizeGrams;
  const RecipeData({
    required this.recipeID,
    required this.recipeName,
    required this.isFavourite,
    required this.servingSizeGrams,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_i_d'] = Variable<int>(recipeID);
    map['recipe_name'] = Variable<String>(recipeName);
    map['is_favourite'] = Variable<bool>(isFavourite);
    map['serving_size_grams'] = Variable<double>(servingSizeGrams);
    return map;
  }

  RecipeCompanion toCompanion(bool nullToAbsent) {
    return RecipeCompanion(
      recipeID: Value(recipeID),
      recipeName: Value(recipeName),
      isFavourite: Value(isFavourite),
      servingSizeGrams: Value(servingSizeGrams),
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
      servingSizeGrams: serializer.fromJson<double>(json['servingSizeGrams']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeID': serializer.toJson<int>(recipeID),
      'recipeName': serializer.toJson<String>(recipeName),
      'isFavourite': serializer.toJson<bool>(isFavourite),
      'servingSizeGrams': serializer.toJson<double>(servingSizeGrams),
    };
  }

  RecipeData copyWith({
    int? recipeID,
    String? recipeName,
    bool? isFavourite,
    double? servingSizeGrams,
  }) => RecipeData(
    recipeID: recipeID ?? this.recipeID,
    recipeName: recipeName ?? this.recipeName,
    isFavourite: isFavourite ?? this.isFavourite,
    servingSizeGrams: servingSizeGrams ?? this.servingSizeGrams,
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
      servingSizeGrams: data.servingSizeGrams.present
          ? data.servingSizeGrams.value
          : this.servingSizeGrams,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('recipeID: $recipeID, ')
          ..write('recipeName: $recipeName, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('servingSizeGrams: $servingSizeGrams')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(recipeID, recipeName, isFavourite, servingSizeGrams);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData &&
          other.recipeID == this.recipeID &&
          other.recipeName == this.recipeName &&
          other.isFavourite == this.isFavourite &&
          other.servingSizeGrams == this.servingSizeGrams);
}

class RecipeCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> recipeID;
  final Value<String> recipeName;
  final Value<bool> isFavourite;
  final Value<double> servingSizeGrams;
  const RecipeCompanion({
    this.recipeID = const Value.absent(),
    this.recipeName = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.servingSizeGrams = const Value.absent(),
  });
  RecipeCompanion.insert({
    this.recipeID = const Value.absent(),
    required String recipeName,
    this.isFavourite = const Value.absent(),
    this.servingSizeGrams = const Value.absent(),
  }) : recipeName = Value(recipeName);
  static Insertable<RecipeData> custom({
    Expression<int>? recipeID,
    Expression<String>? recipeName,
    Expression<bool>? isFavourite,
    Expression<double>? servingSizeGrams,
  }) {
    return RawValuesInsertable({
      if (recipeID != null) 'recipe_i_d': recipeID,
      if (recipeName != null) 'recipe_name': recipeName,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (servingSizeGrams != null) 'serving_size_grams': servingSizeGrams,
    });
  }

  RecipeCompanion copyWith({
    Value<int>? recipeID,
    Value<String>? recipeName,
    Value<bool>? isFavourite,
    Value<double>? servingSizeGrams,
  }) {
    return RecipeCompanion(
      recipeID: recipeID ?? this.recipeID,
      recipeName: recipeName ?? this.recipeName,
      isFavourite: isFavourite ?? this.isFavourite,
      servingSizeGrams: servingSizeGrams ?? this.servingSizeGrams,
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
    if (servingSizeGrams.present) {
      map['serving_size_grams'] = Variable<double>(servingSizeGrams.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCompanion(')
          ..write('recipeID: $recipeID, ')
          ..write('recipeName: $recipeName, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('servingSizeGrams: $servingSizeGrams')
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
  @override
  late final GeneratedColumnWithTypeConverter<LogMethod, String> logMethod =
      GeneratedColumn<String>(
        'log_method',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LogMethod>($MealsTable.$converterlogMethod);
  @override
  late final GeneratedColumnWithTypeConverter<MealCategory, String> mealType =
      GeneratedColumn<String>(
        'meal_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MealCategory>($MealsTable.$convertermealType);
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
    date,
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
  Set<GeneratedColumn> get $primaryKey => {mealID};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meal(
      mealID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_i_d'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      logMethod: $MealsTable.$converterlogMethod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}log_method'],
        )!,
      ),
      mealType: $MealsTable.$convertermealType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}meal_type'],
        )!,
      ),
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

  static JsonTypeConverter2<LogMethod, String, String> $converterlogMethod =
      const EnumNameConverter<LogMethod>(LogMethod.values);
  static JsonTypeConverter2<MealCategory, String, String> $convertermealType =
      const EnumNameConverter<MealCategory>(MealCategory.values);
}

class Meal extends DataClass implements Insertable<Meal> {
  final int mealID;
  final DateTime date;
  final LogMethod logMethod;
  final MealCategory mealType;
  final double amount;
  const Meal({
    required this.mealID,
    required this.date,
    required this.logMethod,
    required this.mealType,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meal_i_d'] = Variable<int>(mealID);
    map['date'] = Variable<DateTime>(date);
    {
      map['log_method'] = Variable<String>(
        $MealsTable.$converterlogMethod.toSql(logMethod),
      );
    }
    {
      map['meal_type'] = Variable<String>(
        $MealsTable.$convertermealType.toSql(mealType),
      );
    }
    map['amount'] = Variable<double>(amount);
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      mealID: Value(mealID),
      date: Value(date),
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
      date: serializer.fromJson<DateTime>(json['date']),
      logMethod: $MealsTable.$converterlogMethod.fromJson(
        serializer.fromJson<String>(json['logMethod']),
      ),
      mealType: $MealsTable.$convertermealType.fromJson(
        serializer.fromJson<String>(json['mealType']),
      ),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealID': serializer.toJson<int>(mealID),
      'date': serializer.toJson<DateTime>(date),
      'logMethod': serializer.toJson<String>(
        $MealsTable.$converterlogMethod.toJson(logMethod),
      ),
      'mealType': serializer.toJson<String>(
        $MealsTable.$convertermealType.toJson(mealType),
      ),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Meal copyWith({
    int? mealID,
    DateTime? date,
    LogMethod? logMethod,
    MealCategory? mealType,
    double? amount,
  }) => Meal(
    mealID: mealID ?? this.mealID,
    date: date ?? this.date,
    logMethod: logMethod ?? this.logMethod,
    mealType: mealType ?? this.mealType,
    amount: amount ?? this.amount,
  );
  Meal copyWithCompanion(MealsCompanion data) {
    return Meal(
      mealID: data.mealID.present ? data.mealID.value : this.mealID,
      date: data.date.present ? data.date.value : this.date,
      logMethod: data.logMethod.present ? data.logMethod.value : this.logMethod,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('mealID: $mealID, ')
          ..write('date: $date, ')
          ..write('logMethod: $logMethod, ')
          ..write('mealType: $mealType, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mealID, date, logMethod, mealType, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.mealID == this.mealID &&
          other.date == this.date &&
          other.logMethod == this.logMethod &&
          other.mealType == this.mealType &&
          other.amount == this.amount);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> mealID;
  final Value<DateTime> date;
  final Value<LogMethod> logMethod;
  final Value<MealCategory> mealType;
  final Value<double> amount;
  const MealsCompanion({
    this.mealID = const Value.absent(),
    this.date = const Value.absent(),
    this.logMethod = const Value.absent(),
    this.mealType = const Value.absent(),
    this.amount = const Value.absent(),
  });
  MealsCompanion.insert({
    this.mealID = const Value.absent(),
    this.date = const Value.absent(),
    required LogMethod logMethod,
    required MealCategory mealType,
    this.amount = const Value.absent(),
  }) : logMethod = Value(logMethod),
       mealType = Value(mealType);
  static Insertable<Meal> custom({
    Expression<int>? mealID,
    Expression<DateTime>? date,
    Expression<String>? logMethod,
    Expression<String>? mealType,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (mealID != null) 'meal_i_d': mealID,
      if (date != null) 'date': date,
      if (logMethod != null) 'log_method': logMethod,
      if (mealType != null) 'meal_type': mealType,
      if (amount != null) 'amount': amount,
    });
  }

  MealsCompanion copyWith({
    Value<int>? mealID,
    Value<DateTime>? date,
    Value<LogMethod>? logMethod,
    Value<MealCategory>? mealType,
    Value<double>? amount,
  }) {
    return MealsCompanion(
      mealID: mealID ?? this.mealID,
      date: date ?? this.date,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (logMethod.present) {
      map['log_method'] = Variable<String>(
        $MealsTable.$converterlogMethod.toSql(logMethod.value),
      );
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(
        $MealsTable.$convertermealType.toSql(mealType.value),
      );
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
          ..write('date: $date, ')
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
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
        DriftSqlType.int,
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
  final int quantity;
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
    map['quantity'] = Variable<int>(quantity);
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
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealID': serializer.toJson<int>(mealID),
      'foodID': serializer.toJson<int>(foodID),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  MealFoodContentData copyWith({int? mealID, int? foodID, int? quantity}) =>
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
  final Value<int> quantity;
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
    Expression<int>? quantity,
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
    Value<int>? quantity,
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
      map['quantity'] = Variable<int>(quantity.value);
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
  @override
  late final GeneratedColumnWithTypeConverter<MetricType, String> metricType =
      GeneratedColumn<String>(
        'metric_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MetricType>($GoalsTable.$convertermetricType);
  @override
  late final GeneratedColumnWithTypeConverter<GoalOperator, String> op =
      GeneratedColumn<String>(
        'op',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<GoalOperator>($GoalsTable.$converterop);
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
  static const VerificationMeta _lastEvaluatedMeta = const VerificationMeta(
    'lastEvaluated',
  );
  @override
  late final GeneratedColumn<DateTime> lastEvaluated =
      GeneratedColumn<DateTime>(
        'last_evaluated',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDate,
      );
  @override
  List<GeneratedColumn> get $columns => [
    goalID,
    type,
    thresholdValue,
    metricType,
    op,
    isComplete,
    progressValue,
    lastEvaluated,
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
    if (data.containsKey('last_evaluated')) {
      context.handle(
        _lastEvaluatedMeta,
        lastEvaluated.isAcceptableOrUnknown(
          data['last_evaluated']!,
          _lastEvaluatedMeta,
        ),
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
      metricType: $GoalsTable.$convertermetricType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}metric_type'],
        )!,
      ),
      op: $GoalsTable.$converterop.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}op'],
        )!,
      ),
      isComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_complete'],
      )!,
      progressValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress_value'],
      )!,
      lastEvaluated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_evaluated'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GoalType, String, String> $convertertype =
      const EnumNameConverter<GoalType>(GoalType.values);
  static JsonTypeConverter2<MetricType, String, String> $convertermetricType =
      const EnumNameConverter<MetricType>(MetricType.values);
  static JsonTypeConverter2<GoalOperator, String, String> $converterop =
      const EnumNameConverter<GoalOperator>(GoalOperator.values);
}

class Goal extends DataClass implements Insertable<Goal> {
  final int goalID;
  final GoalType type;
  final double? thresholdValue;
  final MetricType metricType;
  final GoalOperator op;
  final bool isComplete;
  final double progressValue;
  final DateTime lastEvaluated;
  const Goal({
    required this.goalID,
    required this.type,
    this.thresholdValue,
    required this.metricType,
    required this.op,
    required this.isComplete,
    required this.progressValue,
    required this.lastEvaluated,
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
    {
      map['metric_type'] = Variable<String>(
        $GoalsTable.$convertermetricType.toSql(metricType),
      );
    }
    {
      map['op'] = Variable<String>($GoalsTable.$converterop.toSql(op));
    }
    map['is_complete'] = Variable<bool>(isComplete);
    map['progress_value'] = Variable<double>(progressValue);
    map['last_evaluated'] = Variable<DateTime>(lastEvaluated);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      goalID: Value(goalID),
      type: Value(type),
      thresholdValue: thresholdValue == null && nullToAbsent
          ? const Value.absent()
          : Value(thresholdValue),
      metricType: Value(metricType),
      op: Value(op),
      isComplete: Value(isComplete),
      progressValue: Value(progressValue),
      lastEvaluated: Value(lastEvaluated),
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
      metricType: $GoalsTable.$convertermetricType.fromJson(
        serializer.fromJson<String>(json['metricType']),
      ),
      op: $GoalsTable.$converterop.fromJson(
        serializer.fromJson<String>(json['op']),
      ),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      progressValue: serializer.fromJson<double>(json['progressValue']),
      lastEvaluated: serializer.fromJson<DateTime>(json['lastEvaluated']),
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
      'metricType': serializer.toJson<String>(
        $GoalsTable.$convertermetricType.toJson(metricType),
      ),
      'op': serializer.toJson<String>($GoalsTable.$converterop.toJson(op)),
      'isComplete': serializer.toJson<bool>(isComplete),
      'progressValue': serializer.toJson<double>(progressValue),
      'lastEvaluated': serializer.toJson<DateTime>(lastEvaluated),
    };
  }

  Goal copyWith({
    int? goalID,
    GoalType? type,
    Value<double?> thresholdValue = const Value.absent(),
    MetricType? metricType,
    GoalOperator? op,
    bool? isComplete,
    double? progressValue,
    DateTime? lastEvaluated,
  }) => Goal(
    goalID: goalID ?? this.goalID,
    type: type ?? this.type,
    thresholdValue: thresholdValue.present
        ? thresholdValue.value
        : this.thresholdValue,
    metricType: metricType ?? this.metricType,
    op: op ?? this.op,
    isComplete: isComplete ?? this.isComplete,
    progressValue: progressValue ?? this.progressValue,
    lastEvaluated: lastEvaluated ?? this.lastEvaluated,
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
      op: data.op.present ? data.op.value : this.op,
      isComplete: data.isComplete.present
          ? data.isComplete.value
          : this.isComplete,
      progressValue: data.progressValue.present
          ? data.progressValue.value
          : this.progressValue,
      lastEvaluated: data.lastEvaluated.present
          ? data.lastEvaluated.value
          : this.lastEvaluated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('goalID: $goalID, ')
          ..write('type: $type, ')
          ..write('thresholdValue: $thresholdValue, ')
          ..write('metricType: $metricType, ')
          ..write('op: $op, ')
          ..write('isComplete: $isComplete, ')
          ..write('progressValue: $progressValue, ')
          ..write('lastEvaluated: $lastEvaluated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    goalID,
    type,
    thresholdValue,
    metricType,
    op,
    isComplete,
    progressValue,
    lastEvaluated,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.goalID == this.goalID &&
          other.type == this.type &&
          other.thresholdValue == this.thresholdValue &&
          other.metricType == this.metricType &&
          other.op == this.op &&
          other.isComplete == this.isComplete &&
          other.progressValue == this.progressValue &&
          other.lastEvaluated == this.lastEvaluated);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> goalID;
  final Value<GoalType> type;
  final Value<double?> thresholdValue;
  final Value<MetricType> metricType;
  final Value<GoalOperator> op;
  final Value<bool> isComplete;
  final Value<double> progressValue;
  final Value<DateTime> lastEvaluated;
  const GoalsCompanion({
    this.goalID = const Value.absent(),
    this.type = const Value.absent(),
    this.thresholdValue = const Value.absent(),
    this.metricType = const Value.absent(),
    this.op = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.progressValue = const Value.absent(),
    this.lastEvaluated = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.goalID = const Value.absent(),
    required GoalType type,
    this.thresholdValue = const Value.absent(),
    required MetricType metricType,
    required GoalOperator op,
    this.isComplete = const Value.absent(),
    this.progressValue = const Value.absent(),
    this.lastEvaluated = const Value.absent(),
  }) : type = Value(type),
       metricType = Value(metricType),
       op = Value(op);
  static Insertable<Goal> custom({
    Expression<int>? goalID,
    Expression<String>? type,
    Expression<double>? thresholdValue,
    Expression<String>? metricType,
    Expression<String>? op,
    Expression<bool>? isComplete,
    Expression<double>? progressValue,
    Expression<DateTime>? lastEvaluated,
  }) {
    return RawValuesInsertable({
      if (goalID != null) 'goal_i_d': goalID,
      if (type != null) 'type': type,
      if (thresholdValue != null) 'threshold_value': thresholdValue,
      if (metricType != null) 'metric_type': metricType,
      if (op != null) 'op': op,
      if (isComplete != null) 'is_complete': isComplete,
      if (progressValue != null) 'progress_value': progressValue,
      if (lastEvaluated != null) 'last_evaluated': lastEvaluated,
    });
  }

  GoalsCompanion copyWith({
    Value<int>? goalID,
    Value<GoalType>? type,
    Value<double?>? thresholdValue,
    Value<MetricType>? metricType,
    Value<GoalOperator>? op,
    Value<bool>? isComplete,
    Value<double>? progressValue,
    Value<DateTime>? lastEvaluated,
  }) {
    return GoalsCompanion(
      goalID: goalID ?? this.goalID,
      type: type ?? this.type,
      thresholdValue: thresholdValue ?? this.thresholdValue,
      metricType: metricType ?? this.metricType,
      op: op ?? this.op,
      isComplete: isComplete ?? this.isComplete,
      progressValue: progressValue ?? this.progressValue,
      lastEvaluated: lastEvaluated ?? this.lastEvaluated,
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
      map['metric_type'] = Variable<String>(
        $GoalsTable.$convertermetricType.toSql(metricType.value),
      );
    }
    if (op.present) {
      map['op'] = Variable<String>($GoalsTable.$converterop.toSql(op.value));
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (progressValue.present) {
      map['progress_value'] = Variable<double>(progressValue.value);
    }
    if (lastEvaluated.present) {
      map['last_evaluated'] = Variable<DateTime>(lastEvaluated.value);
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
          ..write('op: $op, ')
          ..write('isComplete: $isComplete, ')
          ..write('progressValue: $progressValue, ')
          ..write('lastEvaluated: $lastEvaluated')
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
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startWeightMeta = const VerificationMeta(
    'startWeight',
  );
  @override
  late final GeneratedColumn<double> startWeight = GeneratedColumn<double>(
    'start_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
    } else if (isInserting) {
      context.missing(_targetWeightMeta);
    }
    if (data.containsKey('start_weight')) {
      context.handle(
        _startWeightMeta,
        startWeight.isAcceptableOrUnknown(
          data['start_weight']!,
          _startWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startWeightMeta);
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
      )!,
      startWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_weight'],
      )!,
    );
  }

  @override
  $WeightGoalsTable createAlias(String alias) {
    return $WeightGoalsTable(attachedDatabase, alias);
  }
}

class WeightGoal extends DataClass implements Insertable<WeightGoal> {
  final int goalID;
  final double targetWeight;
  final double startWeight;
  const WeightGoal({
    required this.goalID,
    required this.targetWeight,
    required this.startWeight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    map['target_weight'] = Variable<double>(targetWeight);
    map['start_weight'] = Variable<double>(startWeight);
    return map;
  }

  WeightGoalsCompanion toCompanion(bool nullToAbsent) {
    return WeightGoalsCompanion(
      goalID: Value(goalID),
      targetWeight: Value(targetWeight),
      startWeight: Value(startWeight),
    );
  }

  factory WeightGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      targetWeight: serializer.fromJson<double>(json['targetWeight']),
      startWeight: serializer.fromJson<double>(json['startWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'targetWeight': serializer.toJson<double>(targetWeight),
      'startWeight': serializer.toJson<double>(startWeight),
    };
  }

  WeightGoal copyWith({
    int? goalID,
    double? targetWeight,
    double? startWeight,
  }) => WeightGoal(
    goalID: goalID ?? this.goalID,
    targetWeight: targetWeight ?? this.targetWeight,
    startWeight: startWeight ?? this.startWeight,
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
  final Value<double> targetWeight;
  final Value<double> startWeight;
  const WeightGoalsCompanion({
    this.goalID = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.startWeight = const Value.absent(),
  });
  WeightGoalsCompanion.insert({
    this.goalID = const Value.absent(),
    required double targetWeight,
    required double startWeight,
  }) : targetWeight = Value(targetWeight),
       startWeight = Value(startWeight);
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
    Value<double>? targetWeight,
    Value<double>? startWeight,
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
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _hdrDateMeta = const VerificationMeta(
    'hdrDate',
  );
  @override
  late final GeneratedColumn<DateTime> hdrDate = GeneratedColumn<DateTime>(
    'hdr_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
      )!,
      hdrDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hdr_date'],
      )!,
    );
  }

  @override
  $HydrationGoalsTable createAlias(String alias) {
    return $HydrationGoalsTable(attachedDatabase, alias);
  }
}

class HydrationGoal extends DataClass implements Insertable<HydrationGoal> {
  final int goalID;
  final int hdrAmount;
  final DateTime hdrDate;
  const HydrationGoal({
    required this.goalID,
    required this.hdrAmount,
    required this.hdrDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    map['hdr_amount'] = Variable<int>(hdrAmount);
    map['hdr_date'] = Variable<DateTime>(hdrDate);
    return map;
  }

  HydrationGoalsCompanion toCompanion(bool nullToAbsent) {
    return HydrationGoalsCompanion(
      goalID: Value(goalID),
      hdrAmount: Value(hdrAmount),
      hdrDate: Value(hdrDate),
    );
  }

  factory HydrationGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HydrationGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      hdrAmount: serializer.fromJson<int>(json['hdrAmount']),
      hdrDate: serializer.fromJson<DateTime>(json['hdrDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'hdrAmount': serializer.toJson<int>(hdrAmount),
      'hdrDate': serializer.toJson<DateTime>(hdrDate),
    };
  }

  HydrationGoal copyWith({int? goalID, int? hdrAmount, DateTime? hdrDate}) =>
      HydrationGoal(
        goalID: goalID ?? this.goalID,
        hdrAmount: hdrAmount ?? this.hdrAmount,
        hdrDate: hdrDate ?? this.hdrDate,
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
  final Value<int> hdrAmount;
  final Value<DateTime> hdrDate;
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
    Value<int>? hdrAmount,
    Value<DateTime>? hdrDate,
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
  @override
  late final GeneratedColumnWithTypeConverter<NutrientType, String>
  nutrientType = GeneratedColumn<String>(
    'nutrient_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<NutrientType>($NutritionGoalsTable.$converternutrientType);
  static const VerificationMeta _nutritionDailyTargetMeta =
      const VerificationMeta('nutritionDailyTarget');
  @override
  late final GeneratedColumn<int> nutritionDailyTarget = GeneratedColumn<int>(
    'nutrition_daily_target',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
    if (data.containsKey('nutrition_daily_target')) {
      context.handle(
        _nutritionDailyTargetMeta,
        nutritionDailyTarget.isAcceptableOrUnknown(
          data['nutrition_daily_target']!,
          _nutritionDailyTargetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nutritionDailyTargetMeta);
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
      nutrientType: $NutritionGoalsTable.$converternutrientType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}nutrient_type'],
        )!,
      ),
      nutritionDailyTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nutrition_daily_target'],
      )!,
    );
  }

  @override
  $NutritionGoalsTable createAlias(String alias) {
    return $NutritionGoalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<NutrientType, String, String>
  $converternutrientType = const EnumNameConverter<NutrientType>(
    NutrientType.values,
  );
}

class NutritionGoal extends DataClass implements Insertable<NutritionGoal> {
  final int goalID;
  final NutrientType nutrientType;
  final int nutritionDailyTarget;
  const NutritionGoal({
    required this.goalID,
    required this.nutrientType,
    required this.nutritionDailyTarget,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_i_d'] = Variable<int>(goalID);
    {
      map['nutrient_type'] = Variable<String>(
        $NutritionGoalsTable.$converternutrientType.toSql(nutrientType),
      );
    }
    map['nutrition_daily_target'] = Variable<int>(nutritionDailyTarget);
    return map;
  }

  NutritionGoalsCompanion toCompanion(bool nullToAbsent) {
    return NutritionGoalsCompanion(
      goalID: Value(goalID),
      nutrientType: Value(nutrientType),
      nutritionDailyTarget: Value(nutritionDailyTarget),
    );
  }

  factory NutritionGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutritionGoal(
      goalID: serializer.fromJson<int>(json['goalID']),
      nutrientType: $NutritionGoalsTable.$converternutrientType.fromJson(
        serializer.fromJson<String>(json['nutrientType']),
      ),
      nutritionDailyTarget: serializer.fromJson<int>(
        json['nutritionDailyTarget'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalID': serializer.toJson<int>(goalID),
      'nutrientType': serializer.toJson<String>(
        $NutritionGoalsTable.$converternutrientType.toJson(nutrientType),
      ),
      'nutritionDailyTarget': serializer.toJson<int>(nutritionDailyTarget),
    };
  }

  NutritionGoal copyWith({
    int? goalID,
    NutrientType? nutrientType,
    int? nutritionDailyTarget,
  }) => NutritionGoal(
    goalID: goalID ?? this.goalID,
    nutrientType: nutrientType ?? this.nutrientType,
    nutritionDailyTarget: nutritionDailyTarget ?? this.nutritionDailyTarget,
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
  final Value<NutrientType> nutrientType;
  final Value<int> nutritionDailyTarget;
  const NutritionGoalsCompanion({
    this.goalID = const Value.absent(),
    this.nutrientType = const Value.absent(),
    this.nutritionDailyTarget = const Value.absent(),
  });
  NutritionGoalsCompanion.insert({
    this.goalID = const Value.absent(),
    required NutrientType nutrientType,
    required int nutritionDailyTarget,
  }) : nutrientType = Value(nutrientType),
       nutritionDailyTarget = Value(nutritionDailyTarget);
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
    Value<NutrientType>? nutrientType,
    Value<int>? nutritionDailyTarget,
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
      map['nutrient_type'] = Variable<String>(
        $NutritionGoalsTable.$converternutrientType.toSql(nutrientType.value),
      );
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
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
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
  late final GeneratedColumnWithTypeConverter<UnlockType?, String> unlockType =
      GeneratedColumn<String>(
        'unlock_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<UnlockType?>($StreaksTable.$converterunlockTypen);
  static const VerificationMeta _curEvalPeriodMeta = const VerificationMeta(
    'curEvalPeriod',
  );
  @override
  late final GeneratedColumn<DateTime> curEvalPeriod =
      GeneratedColumn<DateTime>(
        'cur_eval_period',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDate,
      );
  static const VerificationMeta _lastEvalEndMeta = const VerificationMeta(
    'lastEvalEnd',
  );
  @override
  late final GeneratedColumn<DateTime> lastEvalEnd = GeneratedColumn<DateTime>(
    'last_eval_end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: DateTimeExpressions(
      currentDate,
    ).modify(DateTimeModifier.days(-1)),
  );
  @override
  List<GeneratedColumn> get $columns => [
    streakID,
    goalID,
    streakProgress,
    startDate,
    endDate,
    unlockType,
    curEvalPeriod,
    lastEvalEnd,
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
    if (data.containsKey('goal_i_d')) {
      context.handle(
        _goalIDMeta,
        goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIDMeta);
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
    if (data.containsKey('cur_eval_period')) {
      context.handle(
        _curEvalPeriodMeta,
        curEvalPeriod.isAcceptableOrUnknown(
          data['cur_eval_period']!,
          _curEvalPeriodMeta,
        ),
      );
    }
    if (data.containsKey('last_eval_end')) {
      context.handle(
        _lastEvalEndMeta,
        lastEvalEnd.isAcceptableOrUnknown(
          data['last_eval_end']!,
          _lastEvalEndMeta,
        ),
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
      goalID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_i_d'],
      )!,
      streakProgress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_progress'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      unlockType: $StreaksTable.$converterunlockTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unlock_type'],
        ),
      ),
      curEvalPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cur_eval_period'],
      )!,
      lastEvalEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_eval_end'],
      )!,
    );
  }

  @override
  $StreaksTable createAlias(String alias) {
    return $StreaksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UnlockType, String, String> $converterunlockType =
      const EnumNameConverter<UnlockType>(UnlockType.values);
  static JsonTypeConverter2<UnlockType?, String?, String?>
  $converterunlockTypen = JsonTypeConverter2.asNullable($converterunlockType);
}

class Streak extends DataClass implements Insertable<Streak> {
  final int streakID;
  final int goalID;
  final int streakProgress;
  final DateTime startDate;
  final DateTime? endDate;
  final UnlockType? unlockType;
  final DateTime curEvalPeriod;
  final DateTime lastEvalEnd;
  const Streak({
    required this.streakID,
    required this.goalID,
    required this.streakProgress,
    required this.startDate,
    this.endDate,
    this.unlockType,
    required this.curEvalPeriod,
    required this.lastEvalEnd,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['streak_i_d'] = Variable<int>(streakID);
    map['goal_i_d'] = Variable<int>(goalID);
    map['streak_progress'] = Variable<int>(streakProgress);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || unlockType != null) {
      map['unlock_type'] = Variable<String>(
        $StreaksTable.$converterunlockTypen.toSql(unlockType),
      );
    }
    map['cur_eval_period'] = Variable<DateTime>(curEvalPeriod);
    map['last_eval_end'] = Variable<DateTime>(lastEvalEnd);
    return map;
  }

  StreaksCompanion toCompanion(bool nullToAbsent) {
    return StreaksCompanion(
      streakID: Value(streakID),
      goalID: Value(goalID),
      streakProgress: Value(streakProgress),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      unlockType: unlockType == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockType),
      curEvalPeriod: Value(curEvalPeriod),
      lastEvalEnd: Value(lastEvalEnd),
    );
  }

  factory Streak.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Streak(
      streakID: serializer.fromJson<int>(json['streakID']),
      goalID: serializer.fromJson<int>(json['goalID']),
      streakProgress: serializer.fromJson<int>(json['streakProgress']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      unlockType: $StreaksTable.$converterunlockTypen.fromJson(
        serializer.fromJson<String?>(json['unlockType']),
      ),
      curEvalPeriod: serializer.fromJson<DateTime>(json['curEvalPeriod']),
      lastEvalEnd: serializer.fromJson<DateTime>(json['lastEvalEnd']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'streakID': serializer.toJson<int>(streakID),
      'goalID': serializer.toJson<int>(goalID),
      'streakProgress': serializer.toJson<int>(streakProgress),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'unlockType': serializer.toJson<String?>(
        $StreaksTable.$converterunlockTypen.toJson(unlockType),
      ),
      'curEvalPeriod': serializer.toJson<DateTime>(curEvalPeriod),
      'lastEvalEnd': serializer.toJson<DateTime>(lastEvalEnd),
    };
  }

  Streak copyWith({
    int? streakID,
    int? goalID,
    int? streakProgress,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<UnlockType?> unlockType = const Value.absent(),
    DateTime? curEvalPeriod,
    DateTime? lastEvalEnd,
  }) => Streak(
    streakID: streakID ?? this.streakID,
    goalID: goalID ?? this.goalID,
    streakProgress: streakProgress ?? this.streakProgress,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    unlockType: unlockType.present ? unlockType.value : this.unlockType,
    curEvalPeriod: curEvalPeriod ?? this.curEvalPeriod,
    lastEvalEnd: lastEvalEnd ?? this.lastEvalEnd,
  );
  Streak copyWithCompanion(StreaksCompanion data) {
    return Streak(
      streakID: data.streakID.present ? data.streakID.value : this.streakID,
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
      streakProgress: data.streakProgress.present
          ? data.streakProgress.value
          : this.streakProgress,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      unlockType: data.unlockType.present
          ? data.unlockType.value
          : this.unlockType,
      curEvalPeriod: data.curEvalPeriod.present
          ? data.curEvalPeriod.value
          : this.curEvalPeriod,
      lastEvalEnd: data.lastEvalEnd.present
          ? data.lastEvalEnd.value
          : this.lastEvalEnd,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Streak(')
          ..write('streakID: $streakID, ')
          ..write('goalID: $goalID, ')
          ..write('streakProgress: $streakProgress, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('unlockType: $unlockType, ')
          ..write('curEvalPeriod: $curEvalPeriod, ')
          ..write('lastEvalEnd: $lastEvalEnd')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    streakID,
    goalID,
    streakProgress,
    startDate,
    endDate,
    unlockType,
    curEvalPeriod,
    lastEvalEnd,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Streak &&
          other.streakID == this.streakID &&
          other.goalID == this.goalID &&
          other.streakProgress == this.streakProgress &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.unlockType == this.unlockType &&
          other.curEvalPeriod == this.curEvalPeriod &&
          other.lastEvalEnd == this.lastEvalEnd);
}

class StreaksCompanion extends UpdateCompanion<Streak> {
  final Value<int> streakID;
  final Value<int> goalID;
  final Value<int> streakProgress;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<UnlockType?> unlockType;
  final Value<DateTime> curEvalPeriod;
  final Value<DateTime> lastEvalEnd;
  const StreaksCompanion({
    this.streakID = const Value.absent(),
    this.goalID = const Value.absent(),
    this.streakProgress = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.unlockType = const Value.absent(),
    this.curEvalPeriod = const Value.absent(),
    this.lastEvalEnd = const Value.absent(),
  });
  StreaksCompanion.insert({
    this.streakID = const Value.absent(),
    required int goalID,
    this.streakProgress = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.unlockType = const Value.absent(),
    this.curEvalPeriod = const Value.absent(),
    this.lastEvalEnd = const Value.absent(),
  }) : goalID = Value(goalID);
  static Insertable<Streak> custom({
    Expression<int>? streakID,
    Expression<int>? goalID,
    Expression<int>? streakProgress,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? unlockType,
    Expression<DateTime>? curEvalPeriod,
    Expression<DateTime>? lastEvalEnd,
  }) {
    return RawValuesInsertable({
      if (streakID != null) 'streak_i_d': streakID,
      if (goalID != null) 'goal_i_d': goalID,
      if (streakProgress != null) 'streak_progress': streakProgress,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (unlockType != null) 'unlock_type': unlockType,
      if (curEvalPeriod != null) 'cur_eval_period': curEvalPeriod,
      if (lastEvalEnd != null) 'last_eval_end': lastEvalEnd,
    });
  }

  StreaksCompanion copyWith({
    Value<int>? streakID,
    Value<int>? goalID,
    Value<int>? streakProgress,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<UnlockType?>? unlockType,
    Value<DateTime>? curEvalPeriod,
    Value<DateTime>? lastEvalEnd,
  }) {
    return StreaksCompanion(
      streakID: streakID ?? this.streakID,
      goalID: goalID ?? this.goalID,
      streakProgress: streakProgress ?? this.streakProgress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      unlockType: unlockType ?? this.unlockType,
      curEvalPeriod: curEvalPeriod ?? this.curEvalPeriod,
      lastEvalEnd: lastEvalEnd ?? this.lastEvalEnd,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (streakID.present) {
      map['streak_i_d'] = Variable<int>(streakID.value);
    }
    if (goalID.present) {
      map['goal_i_d'] = Variable<int>(goalID.value);
    }
    if (streakProgress.present) {
      map['streak_progress'] = Variable<int>(streakProgress.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (unlockType.present) {
      map['unlock_type'] = Variable<String>(
        $StreaksTable.$converterunlockTypen.toSql(unlockType.value),
      );
    }
    if (curEvalPeriod.present) {
      map['cur_eval_period'] = Variable<DateTime>(curEvalPeriod.value);
    }
    if (lastEvalEnd.present) {
      map['last_eval_end'] = Variable<DateTime>(lastEvalEnd.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreaksCompanion(')
          ..write('streakID: $streakID, ')
          ..write('goalID: $goalID, ')
          ..write('streakProgress: $streakProgress, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('unlockType: $unlockType, ')
          ..write('curEvalPeriod: $curEvalPeriod, ')
          ..write('lastEvalEnd: $lastEvalEnd')
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
    defaultValue: currentDate,
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
  @override
  List<GeneratedColumn> get $columns => [
    userGoalID,
    userID,
    goalID,
    dateCreated,
    isMain,
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
  const UserGoalProgressData({
    required this.userGoalID,
    required this.userID,
    required this.goalID,
    required this.dateCreated,
    required this.isMain,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_goal_i_d'] = Variable<int>(userGoalID);
    map['user_i_d'] = Variable<int>(userID);
    map['goal_i_d'] = Variable<int>(goalID);
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['is_main'] = Variable<bool>(isMain);
    return map;
  }

  UserGoalProgressCompanion toCompanion(bool nullToAbsent) {
    return UserGoalProgressCompanion(
      userGoalID: Value(userGoalID),
      userID: Value(userID),
      goalID: Value(goalID),
      dateCreated: Value(dateCreated),
      isMain: Value(isMain),
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
    };
  }

  UserGoalProgressData copyWith({
    int? userGoalID,
    int? userID,
    int? goalID,
    DateTime? dateCreated,
    bool? isMain,
  }) => UserGoalProgressData(
    userGoalID: userGoalID ?? this.userGoalID,
    userID: userID ?? this.userID,
    goalID: goalID ?? this.goalID,
    dateCreated: dateCreated ?? this.dateCreated,
    isMain: isMain ?? this.isMain,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserGoalProgressData(')
          ..write('userGoalID: $userGoalID, ')
          ..write('userID: $userID, ')
          ..write('goalID: $goalID, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('isMain: $isMain')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userGoalID, userID, goalID, dateCreated, isMain);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserGoalProgressData &&
          other.userGoalID == this.userGoalID &&
          other.userID == this.userID &&
          other.goalID == this.goalID &&
          other.dateCreated == this.dateCreated &&
          other.isMain == this.isMain);
}

class UserGoalProgressCompanion extends UpdateCompanion<UserGoalProgressData> {
  final Value<int> userGoalID;
  final Value<int> userID;
  final Value<int> goalID;
  final Value<DateTime> dateCreated;
  final Value<bool> isMain;
  const UserGoalProgressCompanion({
    this.userGoalID = const Value.absent(),
    this.userID = const Value.absent(),
    this.goalID = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.isMain = const Value.absent(),
  });
  UserGoalProgressCompanion.insert({
    this.userGoalID = const Value.absent(),
    required int userID,
    required int goalID,
    this.dateCreated = const Value.absent(),
    this.isMain = const Value.absent(),
  }) : userID = Value(userID),
       goalID = Value(goalID);
  static Insertable<UserGoalProgressData> custom({
    Expression<int>? userGoalID,
    Expression<int>? userID,
    Expression<int>? goalID,
    Expression<DateTime>? dateCreated,
    Expression<bool>? isMain,
  }) {
    return RawValuesInsertable({
      if (userGoalID != null) 'user_goal_i_d': userGoalID,
      if (userID != null) 'user_i_d': userID,
      if (goalID != null) 'goal_i_d': goalID,
      if (dateCreated != null) 'date_created': dateCreated,
      if (isMain != null) 'is_main': isMain,
    });
  }

  UserGoalProgressCompanion copyWith({
    Value<int>? userGoalID,
    Value<int>? userID,
    Value<int>? goalID,
    Value<DateTime>? dateCreated,
    Value<bool>? isMain,
  }) {
    return UserGoalProgressCompanion(
      userGoalID: userGoalID ?? this.userGoalID,
      userID: userID ?? this.userID,
      goalID: goalID ?? this.goalID,
      dateCreated: dateCreated ?? this.dateCreated,
      isMain: isMain ?? this.isMain,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserGoalProgressCompanion(')
          ..write('userGoalID: $userGoalID, ')
          ..write('userID: $userID, ')
          ..write('goalID: $goalID, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('isMain: $isMain')
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
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
  late final GeneratedColumnWithTypeConverter<ConcernType, String> cType =
      GeneratedColumn<String>(
        'c_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ConcernType>($ReinforcementsTable.$convertercType);
  @override
  late final GeneratedColumnWithTypeConverter<GoalType?, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<GoalType?>($ReinforcementsTable.$convertertypen);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayContextMeta = const VerificationMeta(
    'displayContext',
  );
  @override
  late final GeneratedColumn<String> displayContext = GeneratedColumn<String>(
    'display_context',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _citationMeta = const VerificationMeta(
    'citation',
  );
  @override
  late final GeneratedColumn<String> citation = GeneratedColumn<String>(
    'citation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thresholdMeta = const VerificationMeta(
    'threshold',
  );
  @override
  late final GeneratedColumn<int> threshold = GeneratedColumn<int>(
    'threshold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windowMeta = const VerificationMeta('window');
  @override
  late final GeneratedColumn<int> window = GeneratedColumn<int>(
    'window',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextEvalMeta = const VerificationMeta(
    'nextEval',
  );
  @override
  late final GeneratedColumn<DateTime> nextEval = GeneratedColumn<DateTime>(
    'next_eval',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cType,
    type,
    title,
    displayContext,
    citation,
    threshold,
    window,
    nextEval,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('display_context')) {
      context.handle(
        _displayContextMeta,
        displayContext.isAcceptableOrUnknown(
          data['display_context']!,
          _displayContextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayContextMeta);
    }
    if (data.containsKey('citation')) {
      context.handle(
        _citationMeta,
        citation.isAcceptableOrUnknown(data['citation']!, _citationMeta),
      );
    } else if (isInserting) {
      context.missing(_citationMeta);
    }
    if (data.containsKey('threshold')) {
      context.handle(
        _thresholdMeta,
        threshold.isAcceptableOrUnknown(data['threshold']!, _thresholdMeta),
      );
    } else if (isInserting) {
      context.missing(_thresholdMeta);
    }
    if (data.containsKey('window')) {
      context.handle(
        _windowMeta,
        window.isAcceptableOrUnknown(data['window']!, _windowMeta),
      );
    } else if (isInserting) {
      context.missing(_windowMeta);
    }
    if (data.containsKey('next_eval')) {
      context.handle(
        _nextEvalMeta,
        nextEval.isAcceptableOrUnknown(data['next_eval']!, _nextEvalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reinforcement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reinforcement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cType: $ReinforcementsTable.$convertercType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}c_type'],
        )!,
      ),
      type: $ReinforcementsTable.$convertertypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        ),
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      displayContext: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_context'],
      )!,
      citation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}citation'],
      )!,
      threshold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}threshold'],
      )!,
      window: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}window'],
      )!,
      nextEval: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_eval'],
      ),
    );
  }

  @override
  $ReinforcementsTable createAlias(String alias) {
    return $ReinforcementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ConcernType, String, String> $convertercType =
      const EnumNameConverter<ConcernType>(ConcernType.values);
  static JsonTypeConverter2<GoalType, String, String> $convertertype =
      const EnumNameConverter<GoalType>(GoalType.values);
  static JsonTypeConverter2<GoalType?, String?, String?> $convertertypen =
      JsonTypeConverter2.asNullable($convertertype);
}

class Reinforcement extends DataClass implements Insertable<Reinforcement> {
  final int id;
  final ConcernType cType;
  final GoalType? type;
  final String title;
  final String displayContext;
  final String citation;
  final int threshold;
  final int window;
  final DateTime? nextEval;
  const Reinforcement({
    required this.id,
    required this.cType,
    this.type,
    required this.title,
    required this.displayContext,
    required this.citation,
    required this.threshold,
    required this.window,
    this.nextEval,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['c_type'] = Variable<String>(
        $ReinforcementsTable.$convertercType.toSql(cType),
      );
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(
        $ReinforcementsTable.$convertertypen.toSql(type),
      );
    }
    map['title'] = Variable<String>(title);
    map['display_context'] = Variable<String>(displayContext);
    map['citation'] = Variable<String>(citation);
    map['threshold'] = Variable<int>(threshold);
    map['window'] = Variable<int>(window);
    if (!nullToAbsent || nextEval != null) {
      map['next_eval'] = Variable<DateTime>(nextEval);
    }
    return map;
  }

  ReinforcementsCompanion toCompanion(bool nullToAbsent) {
    return ReinforcementsCompanion(
      id: Value(id),
      cType: Value(cType),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      title: Value(title),
      displayContext: Value(displayContext),
      citation: Value(citation),
      threshold: Value(threshold),
      window: Value(window),
      nextEval: nextEval == null && nullToAbsent
          ? const Value.absent()
          : Value(nextEval),
    );
  }

  factory Reinforcement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reinforcement(
      id: serializer.fromJson<int>(json['id']),
      cType: $ReinforcementsTable.$convertercType.fromJson(
        serializer.fromJson<String>(json['cType']),
      ),
      type: $ReinforcementsTable.$convertertypen.fromJson(
        serializer.fromJson<String?>(json['type']),
      ),
      title: serializer.fromJson<String>(json['title']),
      displayContext: serializer.fromJson<String>(json['displayContext']),
      citation: serializer.fromJson<String>(json['citation']),
      threshold: serializer.fromJson<int>(json['threshold']),
      window: serializer.fromJson<int>(json['window']),
      nextEval: serializer.fromJson<DateTime?>(json['nextEval']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cType': serializer.toJson<String>(
        $ReinforcementsTable.$convertercType.toJson(cType),
      ),
      'type': serializer.toJson<String?>(
        $ReinforcementsTable.$convertertypen.toJson(type),
      ),
      'title': serializer.toJson<String>(title),
      'displayContext': serializer.toJson<String>(displayContext),
      'citation': serializer.toJson<String>(citation),
      'threshold': serializer.toJson<int>(threshold),
      'window': serializer.toJson<int>(window),
      'nextEval': serializer.toJson<DateTime?>(nextEval),
    };
  }

  Reinforcement copyWith({
    int? id,
    ConcernType? cType,
    Value<GoalType?> type = const Value.absent(),
    String? title,
    String? displayContext,
    String? citation,
    int? threshold,
    int? window,
    Value<DateTime?> nextEval = const Value.absent(),
  }) => Reinforcement(
    id: id ?? this.id,
    cType: cType ?? this.cType,
    type: type.present ? type.value : this.type,
    title: title ?? this.title,
    displayContext: displayContext ?? this.displayContext,
    citation: citation ?? this.citation,
    threshold: threshold ?? this.threshold,
    window: window ?? this.window,
    nextEval: nextEval.present ? nextEval.value : this.nextEval,
  );
  Reinforcement copyWithCompanion(ReinforcementsCompanion data) {
    return Reinforcement(
      id: data.id.present ? data.id.value : this.id,
      cType: data.cType.present ? data.cType.value : this.cType,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      displayContext: data.displayContext.present
          ? data.displayContext.value
          : this.displayContext,
      citation: data.citation.present ? data.citation.value : this.citation,
      threshold: data.threshold.present ? data.threshold.value : this.threshold,
      window: data.window.present ? data.window.value : this.window,
      nextEval: data.nextEval.present ? data.nextEval.value : this.nextEval,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reinforcement(')
          ..write('id: $id, ')
          ..write('cType: $cType, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('displayContext: $displayContext, ')
          ..write('citation: $citation, ')
          ..write('threshold: $threshold, ')
          ..write('window: $window, ')
          ..write('nextEval: $nextEval')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cType,
    type,
    title,
    displayContext,
    citation,
    threshold,
    window,
    nextEval,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reinforcement &&
          other.id == this.id &&
          other.cType == this.cType &&
          other.type == this.type &&
          other.title == this.title &&
          other.displayContext == this.displayContext &&
          other.citation == this.citation &&
          other.threshold == this.threshold &&
          other.window == this.window &&
          other.nextEval == this.nextEval);
}

class ReinforcementsCompanion extends UpdateCompanion<Reinforcement> {
  final Value<int> id;
  final Value<ConcernType> cType;
  final Value<GoalType?> type;
  final Value<String> title;
  final Value<String> displayContext;
  final Value<String> citation;
  final Value<int> threshold;
  final Value<int> window;
  final Value<DateTime?> nextEval;
  const ReinforcementsCompanion({
    this.id = const Value.absent(),
    this.cType = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.displayContext = const Value.absent(),
    this.citation = const Value.absent(),
    this.threshold = const Value.absent(),
    this.window = const Value.absent(),
    this.nextEval = const Value.absent(),
  });
  ReinforcementsCompanion.insert({
    this.id = const Value.absent(),
    required ConcernType cType,
    this.type = const Value.absent(),
    required String title,
    required String displayContext,
    required String citation,
    required int threshold,
    required int window,
    this.nextEval = const Value.absent(),
  }) : cType = Value(cType),
       title = Value(title),
       displayContext = Value(displayContext),
       citation = Value(citation),
       threshold = Value(threshold),
       window = Value(window);
  static Insertable<Reinforcement> custom({
    Expression<int>? id,
    Expression<String>? cType,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? displayContext,
    Expression<String>? citation,
    Expression<int>? threshold,
    Expression<int>? window,
    Expression<DateTime>? nextEval,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cType != null) 'c_type': cType,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (displayContext != null) 'display_context': displayContext,
      if (citation != null) 'citation': citation,
      if (threshold != null) 'threshold': threshold,
      if (window != null) 'window': window,
      if (nextEval != null) 'next_eval': nextEval,
    });
  }

  ReinforcementsCompanion copyWith({
    Value<int>? id,
    Value<ConcernType>? cType,
    Value<GoalType?>? type,
    Value<String>? title,
    Value<String>? displayContext,
    Value<String>? citation,
    Value<int>? threshold,
    Value<int>? window,
    Value<DateTime?>? nextEval,
  }) {
    return ReinforcementsCompanion(
      id: id ?? this.id,
      cType: cType ?? this.cType,
      type: type ?? this.type,
      title: title ?? this.title,
      displayContext: displayContext ?? this.displayContext,
      citation: citation ?? this.citation,
      threshold: threshold ?? this.threshold,
      window: window ?? this.window,
      nextEval: nextEval ?? this.nextEval,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cType.present) {
      map['c_type'] = Variable<String>(
        $ReinforcementsTable.$convertercType.toSql(cType.value),
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ReinforcementsTable.$convertertypen.toSql(type.value),
      );
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (displayContext.present) {
      map['display_context'] = Variable<String>(displayContext.value);
    }
    if (citation.present) {
      map['citation'] = Variable<String>(citation.value);
    }
    if (threshold.present) {
      map['threshold'] = Variable<int>(threshold.value);
    }
    if (window.present) {
      map['window'] = Variable<int>(window.value);
    }
    if (nextEval.present) {
      map['next_eval'] = Variable<DateTime>(nextEval.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReinforcementsCompanion(')
          ..write('id: $id, ')
          ..write('cType: $cType, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('displayContext: $displayContext, ')
          ..write('citation: $citation, ')
          ..write('threshold: $threshold, ')
          ..write('window: $window, ')
          ..write('nextEval: $nextEval')
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

class $ReminderTable extends Reminder
    with TableInfo<$ReminderTable, ReminderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reminderIDMeta = const VerificationMeta(
    'reminderID',
  );
  @override
  late final GeneratedColumn<int> reminderID = GeneratedColumn<int>(
    'reminder_i_d',
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
  @override
  late final GeneratedColumnWithTypeConverter<ReminderType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ReminderType>($ReminderTable.$convertertype);
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
    'time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minutesOffsetMeta = const VerificationMeta(
    'minutesOffset',
  );
  @override
  late final GeneratedColumn<int> minutesOffset = GeneratedColumn<int>(
    'minutes_offset',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(15),
  );
  static const VerificationMeta _daysMeta = const VerificationMeta('days');
  @override
  late final GeneratedColumn<String> days = GeneratedColumn<String>(
    'days',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    reminderID,
    userID,
    type,
    isEnabled,
    time,
    minutesOffset,
    days,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reminder_i_d')) {
      context.handle(
        _reminderIDMeta,
        reminderID.isAcceptableOrUnknown(
          data['reminder_i_d']!,
          _reminderIDMeta,
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
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    if (data.containsKey('minutes_offset')) {
      context.handle(
        _minutesOffsetMeta,
        minutesOffset.isAcceptableOrUnknown(
          data['minutes_offset']!,
          _minutesOffsetMeta,
        ),
      );
    }
    if (data.containsKey('days')) {
      context.handle(
        _daysMeta,
        days.isAcceptableOrUnknown(data['days']!, _daysMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reminderID};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userID, type},
  ];
  @override
  ReminderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderData(
      reminderID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_i_d'],
      )!,
      userID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_i_d'],
      )!,
      type: $ReminderTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}time'],
      ),
      minutesOffset: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_offset'],
      )!,
      days: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}days'],
      ),
    );
  }

  @override
  $ReminderTable createAlias(String alias) {
    return $ReminderTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ReminderType, String, String> $convertertype =
      const EnumNameConverter<ReminderType>(ReminderType.values);
}

class ReminderData extends DataClass implements Insertable<ReminderData> {
  final int reminderID;
  final int userID;
  final ReminderType type;
  final bool isEnabled;
  final DateTime? time;
  final int minutesOffset;
  final String? days;
  const ReminderData({
    required this.reminderID,
    required this.userID,
    required this.type,
    required this.isEnabled,
    this.time,
    required this.minutesOffset,
    this.days,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reminder_i_d'] = Variable<int>(reminderID);
    map['user_i_d'] = Variable<int>(userID);
    {
      map['type'] = Variable<String>($ReminderTable.$convertertype.toSql(type));
    }
    map['is_enabled'] = Variable<bool>(isEnabled);
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    map['minutes_offset'] = Variable<int>(minutesOffset);
    if (!nullToAbsent || days != null) {
      map['days'] = Variable<String>(days);
    }
    return map;
  }

  ReminderCompanion toCompanion(bool nullToAbsent) {
    return ReminderCompanion(
      reminderID: Value(reminderID),
      userID: Value(userID),
      type: Value(type),
      isEnabled: Value(isEnabled),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      minutesOffset: Value(minutesOffset),
      days: days == null && nullToAbsent ? const Value.absent() : Value(days),
    );
  }

  factory ReminderData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderData(
      reminderID: serializer.fromJson<int>(json['reminderID']),
      userID: serializer.fromJson<int>(json['userID']),
      type: $ReminderTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      time: serializer.fromJson<DateTime?>(json['time']),
      minutesOffset: serializer.fromJson<int>(json['minutesOffset']),
      days: serializer.fromJson<String?>(json['days']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reminderID': serializer.toJson<int>(reminderID),
      'userID': serializer.toJson<int>(userID),
      'type': serializer.toJson<String>(
        $ReminderTable.$convertertype.toJson(type),
      ),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'time': serializer.toJson<DateTime?>(time),
      'minutesOffset': serializer.toJson<int>(minutesOffset),
      'days': serializer.toJson<String?>(days),
    };
  }

  ReminderData copyWith({
    int? reminderID,
    int? userID,
    ReminderType? type,
    bool? isEnabled,
    Value<DateTime?> time = const Value.absent(),
    int? minutesOffset,
    Value<String?> days = const Value.absent(),
  }) => ReminderData(
    reminderID: reminderID ?? this.reminderID,
    userID: userID ?? this.userID,
    type: type ?? this.type,
    isEnabled: isEnabled ?? this.isEnabled,
    time: time.present ? time.value : this.time,
    minutesOffset: minutesOffset ?? this.minutesOffset,
    days: days.present ? days.value : this.days,
  );
  ReminderData copyWithCompanion(ReminderCompanion data) {
    return ReminderData(
      reminderID: data.reminderID.present
          ? data.reminderID.value
          : this.reminderID,
      userID: data.userID.present ? data.userID.value : this.userID,
      type: data.type.present ? data.type.value : this.type,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      time: data.time.present ? data.time.value : this.time,
      minutesOffset: data.minutesOffset.present
          ? data.minutesOffset.value
          : this.minutesOffset,
      days: data.days.present ? data.days.value : this.days,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderData(')
          ..write('reminderID: $reminderID, ')
          ..write('userID: $userID, ')
          ..write('type: $type, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('time: $time, ')
          ..write('minutesOffset: $minutesOffset, ')
          ..write('days: $days')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    reminderID,
    userID,
    type,
    isEnabled,
    time,
    minutesOffset,
    days,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderData &&
          other.reminderID == this.reminderID &&
          other.userID == this.userID &&
          other.type == this.type &&
          other.isEnabled == this.isEnabled &&
          other.time == this.time &&
          other.minutesOffset == this.minutesOffset &&
          other.days == this.days);
}

class ReminderCompanion extends UpdateCompanion<ReminderData> {
  final Value<int> reminderID;
  final Value<int> userID;
  final Value<ReminderType> type;
  final Value<bool> isEnabled;
  final Value<DateTime?> time;
  final Value<int> minutesOffset;
  final Value<String?> days;
  const ReminderCompanion({
    this.reminderID = const Value.absent(),
    this.userID = const Value.absent(),
    this.type = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.time = const Value.absent(),
    this.minutesOffset = const Value.absent(),
    this.days = const Value.absent(),
  });
  ReminderCompanion.insert({
    this.reminderID = const Value.absent(),
    required int userID,
    required ReminderType type,
    this.isEnabled = const Value.absent(),
    this.time = const Value.absent(),
    this.minutesOffset = const Value.absent(),
    this.days = const Value.absent(),
  }) : userID = Value(userID),
       type = Value(type);
  static Insertable<ReminderData> custom({
    Expression<int>? reminderID,
    Expression<int>? userID,
    Expression<String>? type,
    Expression<bool>? isEnabled,
    Expression<DateTime>? time,
    Expression<int>? minutesOffset,
    Expression<String>? days,
  }) {
    return RawValuesInsertable({
      if (reminderID != null) 'reminder_i_d': reminderID,
      if (userID != null) 'user_i_d': userID,
      if (type != null) 'type': type,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (time != null) 'time': time,
      if (minutesOffset != null) 'minutes_offset': minutesOffset,
      if (days != null) 'days': days,
    });
  }

  ReminderCompanion copyWith({
    Value<int>? reminderID,
    Value<int>? userID,
    Value<ReminderType>? type,
    Value<bool>? isEnabled,
    Value<DateTime?>? time,
    Value<int>? minutesOffset,
    Value<String?>? days,
  }) {
    return ReminderCompanion(
      reminderID: reminderID ?? this.reminderID,
      userID: userID ?? this.userID,
      type: type ?? this.type,
      isEnabled: isEnabled ?? this.isEnabled,
      time: time ?? this.time,
      minutesOffset: minutesOffset ?? this.minutesOffset,
      days: days ?? this.days,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reminderID.present) {
      map['reminder_i_d'] = Variable<int>(reminderID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ReminderTable.$convertertype.toSql(type.value),
      );
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (minutesOffset.present) {
      map['minutes_offset'] = Variable<int>(minutesOffset.value);
    }
    if (days.present) {
      map['days'] = Variable<String>(days.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderCompanion(')
          ..write('reminderID: $reminderID, ')
          ..write('userID: $userID, ')
          ..write('type: $type, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('time: $time, ')
          ..write('minutesOffset: $minutesOffset, ')
          ..write('days: $days')
          ..write(')'))
        .toString();
  }
}

class $FoodLogTable extends FoodLog with TableInfo<$FoodLogTable, FoodLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _foodLogIDMeta = const VerificationMeta(
    'foodLogID',
  );
  @override
  late final GeneratedColumn<int> foodLogID = GeneratedColumn<int>(
    'food_log_i_d',
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
  late final GeneratedColumnWithTypeConverter<MealCategory, String> category =
      GeneratedColumn<String>(
        'category',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MealCategory>($FoodLogTable.$convertercategory);
  static const VerificationMeta _logDateMeta = const VerificationMeta(
    'logDate',
  );
  @override
  late final GeneratedColumn<DateTime> logDate = GeneratedColumn<DateTime>(
    'log_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  late final GeneratedColumnWithTypeConverter<LogMethod, String> logMethod =
      GeneratedColumn<String>(
        'log_method',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LogMethod>($FoodLogTable.$converterlogMethod);
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
    foodLogID,
    category,
    logDate,
    comment,
    path,
    logMethod,
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
  static const String $name = 'food_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('food_log_i_d')) {
      context.handle(
        _foodLogIDMeta,
        foodLogID.isAcceptableOrUnknown(data['food_log_i_d']!, _foodLogIDMeta),
      );
    }
    if (data.containsKey('log_date')) {
      context.handle(
        _logDateMeta,
        logDate.isAcceptableOrUnknown(data['log_date']!, _logDateMeta),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
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
  Set<GeneratedColumn> get $primaryKey => {foodLogID};
  @override
  FoodLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodLogData(
      foodLogID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}food_log_i_d'],
      )!,
      category: $FoodLogTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      logDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}log_date'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      logMethod: $FoodLogTable.$converterlogMethod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}log_method'],
        )!,
      ),
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
  $FoodLogTable createAlias(String alias) {
    return $FoodLogTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MealCategory, String, String> $convertercategory =
      const EnumNameConverter<MealCategory>(MealCategory.values);
  static JsonTypeConverter2<LogMethod, String, String> $converterlogMethod =
      const EnumNameConverter<LogMethod>(LogMethod.values);
}

class FoodLogData extends DataClass implements Insertable<FoodLogData> {
  final int foodLogID;
  final MealCategory category;
  final DateTime logDate;
  final String? comment;
  final String path;
  final LogMethod logMethod;
  final double carbs;
  final double fat;
  final double protein;
  final double fibre;
  final double calories;
  const FoodLogData({
    required this.foodLogID,
    required this.category,
    required this.logDate,
    this.comment,
    required this.path,
    required this.logMethod,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.fibre,
    required this.calories,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['food_log_i_d'] = Variable<int>(foodLogID);
    {
      map['category'] = Variable<String>(
        $FoodLogTable.$convertercategory.toSql(category),
      );
    }
    map['log_date'] = Variable<DateTime>(logDate);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['path'] = Variable<String>(path);
    {
      map['log_method'] = Variable<String>(
        $FoodLogTable.$converterlogMethod.toSql(logMethod),
      );
    }
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    map['protein'] = Variable<double>(protein);
    map['fibre'] = Variable<double>(fibre);
    map['calories'] = Variable<double>(calories);
    return map;
  }

  FoodLogCompanion toCompanion(bool nullToAbsent) {
    return FoodLogCompanion(
      foodLogID: Value(foodLogID),
      category: Value(category),
      logDate: Value(logDate),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      path: Value(path),
      logMethod: Value(logMethod),
      carbs: Value(carbs),
      fat: Value(fat),
      protein: Value(protein),
      fibre: Value(fibre),
      calories: Value(calories),
    );
  }

  factory FoodLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodLogData(
      foodLogID: serializer.fromJson<int>(json['foodLogID']),
      category: $FoodLogTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      logDate: serializer.fromJson<DateTime>(json['logDate']),
      comment: serializer.fromJson<String?>(json['comment']),
      path: serializer.fromJson<String>(json['path']),
      logMethod: $FoodLogTable.$converterlogMethod.fromJson(
        serializer.fromJson<String>(json['logMethod']),
      ),
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
      'foodLogID': serializer.toJson<int>(foodLogID),
      'category': serializer.toJson<String>(
        $FoodLogTable.$convertercategory.toJson(category),
      ),
      'logDate': serializer.toJson<DateTime>(logDate),
      'comment': serializer.toJson<String?>(comment),
      'path': serializer.toJson<String>(path),
      'logMethod': serializer.toJson<String>(
        $FoodLogTable.$converterlogMethod.toJson(logMethod),
      ),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'protein': serializer.toJson<double>(protein),
      'fibre': serializer.toJson<double>(fibre),
      'calories': serializer.toJson<double>(calories),
    };
  }

  FoodLogData copyWith({
    int? foodLogID,
    MealCategory? category,
    DateTime? logDate,
    Value<String?> comment = const Value.absent(),
    String? path,
    LogMethod? logMethod,
    double? carbs,
    double? fat,
    double? protein,
    double? fibre,
    double? calories,
  }) => FoodLogData(
    foodLogID: foodLogID ?? this.foodLogID,
    category: category ?? this.category,
    logDate: logDate ?? this.logDate,
    comment: comment.present ? comment.value : this.comment,
    path: path ?? this.path,
    logMethod: logMethod ?? this.logMethod,
    carbs: carbs ?? this.carbs,
    fat: fat ?? this.fat,
    protein: protein ?? this.protein,
    fibre: fibre ?? this.fibre,
    calories: calories ?? this.calories,
  );
  FoodLogData copyWithCompanion(FoodLogCompanion data) {
    return FoodLogData(
      foodLogID: data.foodLogID.present ? data.foodLogID.value : this.foodLogID,
      category: data.category.present ? data.category.value : this.category,
      logDate: data.logDate.present ? data.logDate.value : this.logDate,
      comment: data.comment.present ? data.comment.value : this.comment,
      path: data.path.present ? data.path.value : this.path,
      logMethod: data.logMethod.present ? data.logMethod.value : this.logMethod,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
      protein: data.protein.present ? data.protein.value : this.protein,
      fibre: data.fibre.present ? data.fibre.value : this.fibre,
      calories: data.calories.present ? data.calories.value : this.calories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodLogData(')
          ..write('foodLogID: $foodLogID, ')
          ..write('category: $category, ')
          ..write('logDate: $logDate, ')
          ..write('comment: $comment, ')
          ..write('path: $path, ')
          ..write('logMethod: $logMethod, ')
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
    foodLogID,
    category,
    logDate,
    comment,
    path,
    logMethod,
    carbs,
    fat,
    protein,
    fibre,
    calories,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodLogData &&
          other.foodLogID == this.foodLogID &&
          other.category == this.category &&
          other.logDate == this.logDate &&
          other.comment == this.comment &&
          other.path == this.path &&
          other.logMethod == this.logMethod &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.protein == this.protein &&
          other.fibre == this.fibre &&
          other.calories == this.calories);
}

class FoodLogCompanion extends UpdateCompanion<FoodLogData> {
  final Value<int> foodLogID;
  final Value<MealCategory> category;
  final Value<DateTime> logDate;
  final Value<String?> comment;
  final Value<String> path;
  final Value<LogMethod> logMethod;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double> protein;
  final Value<double> fibre;
  final Value<double> calories;
  const FoodLogCompanion({
    this.foodLogID = const Value.absent(),
    this.category = const Value.absent(),
    this.logDate = const Value.absent(),
    this.comment = const Value.absent(),
    this.path = const Value.absent(),
    this.logMethod = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  });
  FoodLogCompanion.insert({
    this.foodLogID = const Value.absent(),
    required MealCategory category,
    this.logDate = const Value.absent(),
    this.comment = const Value.absent(),
    this.path = const Value.absent(),
    required LogMethod logMethod,
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.protein = const Value.absent(),
    this.fibre = const Value.absent(),
    this.calories = const Value.absent(),
  }) : category = Value(category),
       logMethod = Value(logMethod);
  static Insertable<FoodLogData> custom({
    Expression<int>? foodLogID,
    Expression<String>? category,
    Expression<DateTime>? logDate,
    Expression<String>? comment,
    Expression<String>? path,
    Expression<String>? logMethod,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? protein,
    Expression<double>? fibre,
    Expression<double>? calories,
  }) {
    return RawValuesInsertable({
      if (foodLogID != null) 'food_log_i_d': foodLogID,
      if (category != null) 'category': category,
      if (logDate != null) 'log_date': logDate,
      if (comment != null) 'comment': comment,
      if (path != null) 'path': path,
      if (logMethod != null) 'log_method': logMethod,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (protein != null) 'protein': protein,
      if (fibre != null) 'fibre': fibre,
      if (calories != null) 'calories': calories,
    });
  }

  FoodLogCompanion copyWith({
    Value<int>? foodLogID,
    Value<MealCategory>? category,
    Value<DateTime>? logDate,
    Value<String?>? comment,
    Value<String>? path,
    Value<LogMethod>? logMethod,
    Value<double>? carbs,
    Value<double>? fat,
    Value<double>? protein,
    Value<double>? fibre,
    Value<double>? calories,
  }) {
    return FoodLogCompanion(
      foodLogID: foodLogID ?? this.foodLogID,
      category: category ?? this.category,
      logDate: logDate ?? this.logDate,
      comment: comment ?? this.comment,
      path: path ?? this.path,
      logMethod: logMethod ?? this.logMethod,
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
    if (foodLogID.present) {
      map['food_log_i_d'] = Variable<int>(foodLogID.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $FoodLogTable.$convertercategory.toSql(category.value),
      );
    }
    if (logDate.present) {
      map['log_date'] = Variable<DateTime>(logDate.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (logMethod.present) {
      map['log_method'] = Variable<String>(
        $FoodLogTable.$converterlogMethod.toSql(logMethod.value),
      );
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
    return (StringBuffer('FoodLogCompanion(')
          ..write('foodLogID: $foodLogID, ')
          ..write('category: $category, ')
          ..write('logDate: $logDate, ')
          ..write('comment: $comment, ')
          ..write('path: $path, ')
          ..write('logMethod: $logMethod, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('protein: $protein, ')
          ..write('fibre: $fibre, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }
}

class $StepsLogTable extends StepsLog
    with TableInfo<$StepsLogTable, StepsLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepsLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stepIDMeta = const VerificationMeta('stepID');
  @override
  late final GeneratedColumn<int> stepID = GeneratedColumn<int>(
    'step_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
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
    defaultValue: currentDate,
  );
  static const VerificationMeta _startingStepCountMeta = const VerificationMeta(
    'startingStepCount',
  );
  @override
  late final GeneratedColumn<int> startingStepCount = GeneratedColumn<int>(
    'starting_step_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    stepID,
    date,
    startingStepCount,
    steps,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'steps_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<StepsLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('step_i_d')) {
      context.handle(
        _stepIDMeta,
        stepID.isAcceptableOrUnknown(data['step_i_d']!, _stepIDMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('starting_step_count')) {
      context.handle(
        _startingStepCountMeta,
        startingStepCount.isAcceptableOrUnknown(
          data['starting_step_count']!,
          _startingStepCountMeta,
        ),
      );
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stepID};
  @override
  StepsLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StepsLogData(
      stepID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}step_i_d'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      startingStepCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}starting_step_count'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      )!,
    );
  }

  @override
  $StepsLogTable createAlias(String alias) {
    return $StepsLogTable(attachedDatabase, alias);
  }
}

class StepsLogData extends DataClass implements Insertable<StepsLogData> {
  final int stepID;
  final DateTime date;
  final int startingStepCount;
  final int steps;
  const StepsLogData({
    required this.stepID,
    required this.date,
    required this.startingStepCount,
    required this.steps,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['step_i_d'] = Variable<int>(stepID);
    map['date'] = Variable<DateTime>(date);
    map['starting_step_count'] = Variable<int>(startingStepCount);
    map['steps'] = Variable<int>(steps);
    return map;
  }

  StepsLogCompanion toCompanion(bool nullToAbsent) {
    return StepsLogCompanion(
      stepID: Value(stepID),
      date: Value(date),
      startingStepCount: Value(startingStepCount),
      steps: Value(steps),
    );
  }

  factory StepsLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StepsLogData(
      stepID: serializer.fromJson<int>(json['stepID']),
      date: serializer.fromJson<DateTime>(json['date']),
      startingStepCount: serializer.fromJson<int>(json['startingStepCount']),
      steps: serializer.fromJson<int>(json['steps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stepID': serializer.toJson<int>(stepID),
      'date': serializer.toJson<DateTime>(date),
      'startingStepCount': serializer.toJson<int>(startingStepCount),
      'steps': serializer.toJson<int>(steps),
    };
  }

  StepsLogData copyWith({
    int? stepID,
    DateTime? date,
    int? startingStepCount,
    int? steps,
  }) => StepsLogData(
    stepID: stepID ?? this.stepID,
    date: date ?? this.date,
    startingStepCount: startingStepCount ?? this.startingStepCount,
    steps: steps ?? this.steps,
  );
  StepsLogData copyWithCompanion(StepsLogCompanion data) {
    return StepsLogData(
      stepID: data.stepID.present ? data.stepID.value : this.stepID,
      date: data.date.present ? data.date.value : this.date,
      startingStepCount: data.startingStepCount.present
          ? data.startingStepCount.value
          : this.startingStepCount,
      steps: data.steps.present ? data.steps.value : this.steps,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StepsLogData(')
          ..write('stepID: $stepID, ')
          ..write('date: $date, ')
          ..write('startingStepCount: $startingStepCount, ')
          ..write('steps: $steps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(stepID, date, startingStepCount, steps);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StepsLogData &&
          other.stepID == this.stepID &&
          other.date == this.date &&
          other.startingStepCount == this.startingStepCount &&
          other.steps == this.steps);
}

class StepsLogCompanion extends UpdateCompanion<StepsLogData> {
  final Value<int> stepID;
  final Value<DateTime> date;
  final Value<int> startingStepCount;
  final Value<int> steps;
  const StepsLogCompanion({
    this.stepID = const Value.absent(),
    this.date = const Value.absent(),
    this.startingStepCount = const Value.absent(),
    this.steps = const Value.absent(),
  });
  StepsLogCompanion.insert({
    this.stepID = const Value.absent(),
    this.date = const Value.absent(),
    this.startingStepCount = const Value.absent(),
    this.steps = const Value.absent(),
  });
  static Insertable<StepsLogData> custom({
    Expression<int>? stepID,
    Expression<DateTime>? date,
    Expression<int>? startingStepCount,
    Expression<int>? steps,
  }) {
    return RawValuesInsertable({
      if (stepID != null) 'step_i_d': stepID,
      if (date != null) 'date': date,
      if (startingStepCount != null) 'starting_step_count': startingStepCount,
      if (steps != null) 'steps': steps,
    });
  }

  StepsLogCompanion copyWith({
    Value<int>? stepID,
    Value<DateTime>? date,
    Value<int>? startingStepCount,
    Value<int>? steps,
  }) {
    return StepsLogCompanion(
      stepID: stepID ?? this.stepID,
      date: date ?? this.date,
      startingStepCount: startingStepCount ?? this.startingStepCount,
      steps: steps ?? this.steps,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stepID.present) {
      map['step_i_d'] = Variable<int>(stepID.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startingStepCount.present) {
      map['starting_step_count'] = Variable<int>(startingStepCount.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsLogCompanion(')
          ..write('stepID: $stepID, ')
          ..write('date: $date, ')
          ..write('startingStepCount: $startingStepCount, ')
          ..write('steps: $steps')
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
  late final $GoalsTable goals = $GoalsTable(this);
  late final $FastingGoalsTable fastingGoals = $FastingGoalsTable(this);
  late final $WeightGoalsTable weightGoals = $WeightGoalsTable(this);
  late final $HydrationGoalsTable hydrationGoals = $HydrationGoalsTable(this);
  late final $NutritionGoalsTable nutritionGoals = $NutritionGoalsTable(this);
  late final $StreaksTable streaks = $StreaksTable(this);
  late final $UserGoalProgressTable userGoalProgress = $UserGoalProgressTable(
    this,
  );
  late final $ReinforcementsTable reinforcements = $ReinforcementsTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $ReminderTable reminder = $ReminderTable(this);
  late final $FoodLogTable foodLog = $FoodLogTable(this);
  late final $StepsLogTable stepsLog = $StepsLogTable(this);
  late final Index foodName = Index(
    'foodName',
    'CREATE INDEX foodName ON food (name)',
  );
  late final Index mealRecipeKey = Index(
    'mealRecipeKey',
    'CREATE INDEX mealRecipeKey ON meal_recipe_content (meal_i_d, recipe_i_d)',
  );
  late final Index mealFoodKey = Index(
    'mealFoodKey',
    'CREATE INDEX mealFoodKey ON meal_food_content (meal_i_d, food_i_d)',
  );
  late final Index goalType = Index(
    'goal_type',
    'CREATE INDEX goal_type ON goals (type)',
  );
  late final Index concernType = Index(
    'concern_type',
    'CREATE INDEX concern_type ON reinforcements (c_type)',
  );
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final FastingDao fastingDao = FastingDao(this as AppDatabase);
  late final HydrationDao hydrationDao = HydrationDao(this as AppDatabase);
  late final NutritionDao nutritionDao = NutritionDao(this as AppDatabase);
  late final GoalsDao goalsDao = GoalsDao(this as AppDatabase);
  late final ReinforcementDao reinforcementDao = ReinforcementDao(
    this as AppDatabase,
  );
  late final ReminderDao reminderDao = ReminderDao(this as AppDatabase);
  late final StepsDao stepsDao = StepsDao(this as AppDatabase);
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
    goals,
    fastingGoals,
    weightGoals,
    hydrationGoals,
    nutritionGoals,
    streaks,
    userGoalProgress,
    reinforcements,
    achievements,
    reminder,
    foodLog,
    stepsLog,
    foodName,
    mealRecipeKey,
    mealFoodKey,
    goalType,
    concernType,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userID,
      required String name,
      Value<bool> isMetric,
      required FastingForm formIF,
      required Experience experience,
      Value<DateTime?> typicalEatingStart,
      Value<DateTime?> typicalEatingEnd,
      Value<DateTime> createdDate,
      Value<String> adfDaysSelected,
      Value<String> fiveTwoDaysSelected,
      required double height,
      required bool isGender,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userID,
      Value<String> name,
      Value<bool> isMetric,
      Value<FastingForm> formIF,
      Value<Experience> experience,
      Value<DateTime?> typicalEatingStart,
      Value<DateTime?> typicalEatingEnd,
      Value<DateTime> createdDate,
      Value<String> adfDaysSelected,
      Value<String> fiveTwoDaysSelected,
      Value<double> height,
      Value<bool> isGender,
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

  static MultiTypedResultKey<$ReminderTable, List<ReminderData>>
  _reminderRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminder,
    aliasName: 'users__user_i_d__reminder__user_i_d',
  );

  $$ReminderTableProcessedTableManager get reminderRefs {
    final manager = $$ReminderTableTableManager(
      $_db,
      $_db.reminder,
    ).filter((f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_reminderRefsTable($_db));
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

  ColumnWithTypeConverterFilters<FastingForm, FastingForm, String> get formIF =>
      $composableBuilder(
        column: $table.formIF,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Experience, Experience, String>
  get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isGender => $composableBuilder(
    column: $table.isGender,
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

  Expression<bool> reminderRefs(
    Expression<bool> Function($$ReminderTableFilterComposer f) f,
  ) {
    final $$ReminderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.reminder,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderTableFilterComposer(
            $db: $db,
            $table: $db.reminder,
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

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isGender => $composableBuilder(
    column: $table.isGender,
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

  GeneratedColumnWithTypeConverter<FastingForm, String> get formIF =>
      $composableBuilder(column: $table.formIF, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Experience, String> get experience =>
      $composableBuilder(
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

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<bool> get isGender =>
      $composableBuilder(column: $table.isGender, builder: (column) => column);

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

  Expression<T> reminderRefs<T extends Object>(
    Expression<T> Function($$ReminderTableAnnotationComposer a) f,
  ) {
    final $$ReminderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userID,
      referencedTable: $db.reminder,
      getReferencedColumn: (t) => t.userID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderTableAnnotationComposer(
            $db: $db,
            $table: $db.reminder,
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
            bool nutritionLogRefs,
            bool userGoalProgressRefs,
            bool reminderRefs,
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
                Value<FastingForm> formIF = const Value.absent(),
                Value<Experience> experience = const Value.absent(),
                Value<DateTime?> typicalEatingStart = const Value.absent(),
                Value<DateTime?> typicalEatingEnd = const Value.absent(),
                Value<DateTime> createdDate = const Value.absent(),
                Value<String> adfDaysSelected = const Value.absent(),
                Value<String> fiveTwoDaysSelected = const Value.absent(),
                Value<double> height = const Value.absent(),
                Value<bool> isGender = const Value.absent(),
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
                height: height,
                isGender: isGender,
              ),
          createCompanionCallback:
              ({
                Value<int> userID = const Value.absent(),
                required String name,
                Value<bool> isMetric = const Value.absent(),
                required FastingForm formIF,
                required Experience experience,
                Value<DateTime?> typicalEatingStart = const Value.absent(),
                Value<DateTime?> typicalEatingEnd = const Value.absent(),
                Value<DateTime> createdDate = const Value.absent(),
                Value<String> adfDaysSelected = const Value.absent(),
                Value<String> fiveTwoDaysSelected = const Value.absent(),
                required double height,
                required bool isGender,
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
                height: height,
                isGender: isGender,
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
                nutritionLogRefs = false,
                userGoalProgressRefs = false,
                reminderRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fastLogRefs) db.fastLog,
                    if (hydrationLogRefs) db.hydrationLog,
                    if (weightLogRefs) db.weightLog,
                    if (nutritionLogRefs) db.nutritionLog,
                    if (userGoalProgressRefs) db.userGoalProgress,
                    if (reminderRefs) db.reminder,
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
                      if (reminderRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ReminderData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._reminderRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).reminderRefs,
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
        bool nutritionLogRefs,
        bool userGoalProgressRefs,
        bool reminderRefs,
      })
    >;
typedef $$FastLogTableCreateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      required int userID,
      required FastingForm formIF,
      required FastResult earlyFastResult,
      Value<FastResult?> lateFastResult,
      Value<int> earlyResultSeverity,
      Value<int> lateResultSeverity,
      Value<DateTime> startDateTime,
      Value<DateTime?> endDateTime,
    });
typedef $$FastLogTableUpdateCompanionBuilder =
    FastLogCompanion Function({
      Value<int> fastLogID,
      Value<int> userID,
      Value<FastingForm> formIF,
      Value<FastResult> earlyFastResult,
      Value<FastResult?> lateFastResult,
      Value<int> earlyResultSeverity,
      Value<int> lateResultSeverity,
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

  ColumnWithTypeConverterFilters<FastingForm, FastingForm, String> get formIF =>
      $composableBuilder(
        column: $table.formIF,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<FastResult, FastResult, String>
  get earlyFastResult => $composableBuilder(
    column: $table.earlyFastResult,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FastResult?, FastResult, String>
  get lateFastResult => $composableBuilder(
    column: $table.lateFastResult,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get earlyResultSeverity => $composableBuilder(
    column: $table.earlyResultSeverity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lateResultSeverity => $composableBuilder(
    column: $table.lateResultSeverity,
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

  ColumnOrderings<String> get earlyFastResult => $composableBuilder(
    column: $table.earlyFastResult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lateFastResult => $composableBuilder(
    column: $table.lateFastResult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get earlyResultSeverity => $composableBuilder(
    column: $table.earlyResultSeverity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lateResultSeverity => $composableBuilder(
    column: $table.lateResultSeverity,
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

  GeneratedColumnWithTypeConverter<FastingForm, String> get formIF =>
      $composableBuilder(column: $table.formIF, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FastResult, String> get earlyFastResult =>
      $composableBuilder(
        column: $table.earlyFastResult,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<FastResult?, String> get lateFastResult =>
      $composableBuilder(
        column: $table.lateFastResult,
        builder: (column) => column,
      );

  GeneratedColumn<int> get earlyResultSeverity => $composableBuilder(
    column: $table.earlyResultSeverity,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lateResultSeverity => $composableBuilder(
    column: $table.lateResultSeverity,
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
                Value<FastingForm> formIF = const Value.absent(),
                Value<FastResult> earlyFastResult = const Value.absent(),
                Value<FastResult?> lateFastResult = const Value.absent(),
                Value<int> earlyResultSeverity = const Value.absent(),
                Value<int> lateResultSeverity = const Value.absent(),
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime?> endDateTime = const Value.absent(),
              }) => FastLogCompanion(
                fastLogID: fastLogID,
                userID: userID,
                formIF: formIF,
                earlyFastResult: earlyFastResult,
                lateFastResult: lateFastResult,
                earlyResultSeverity: earlyResultSeverity,
                lateResultSeverity: lateResultSeverity,
                startDateTime: startDateTime,
                endDateTime: endDateTime,
              ),
          createCompanionCallback:
              ({
                Value<int> fastLogID = const Value.absent(),
                required int userID,
                required FastingForm formIF,
                required FastResult earlyFastResult,
                Value<FastResult?> lateFastResult = const Value.absent(),
                Value<int> earlyResultSeverity = const Value.absent(),
                Value<int> lateResultSeverity = const Value.absent(),
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime?> endDateTime = const Value.absent(),
              }) => FastLogCompanion.insert(
                fastLogID: fastLogID,
                userID: userID,
                formIF: formIF,
                earlyFastResult: earlyFastResult,
                lateFastResult: lateFastResult,
                earlyResultSeverity: earlyResultSeverity,
                lateResultSeverity: lateResultSeverity,
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
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodCompanion(
                foodID: foodID,
                name: name,
                servingDescription: servingDescription,
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
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodCompanion.insert(
                foodID: foodID,
                name: name,
                servingDescription: servingDescription,
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
      Value<double> servingSizeGrams,
    });
typedef $$RecipeTableUpdateCompanionBuilder =
    RecipeCompanion Function({
      Value<int> recipeID,
      Value<String> recipeName,
      Value<bool> isFavourite,
      Value<double> servingSizeGrams,
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

  ColumnFilters<double> get servingSizeGrams => $composableBuilder(
    column: $table.servingSizeGrams,
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

  ColumnOrderings<double> get servingSizeGrams => $composableBuilder(
    column: $table.servingSizeGrams,
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

  GeneratedColumn<double> get servingSizeGrams => $composableBuilder(
    column: $table.servingSizeGrams,
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
                Value<double> servingSizeGrams = const Value.absent(),
              }) => RecipeCompanion(
                recipeID: recipeID,
                recipeName: recipeName,
                isFavourite: isFavourite,
                servingSizeGrams: servingSizeGrams,
              ),
          createCompanionCallback:
              ({
                Value<int> recipeID = const Value.absent(),
                required String recipeName,
                Value<bool> isFavourite = const Value.absent(),
                Value<double> servingSizeGrams = const Value.absent(),
              }) => RecipeCompanion.insert(
                recipeID: recipeID,
                recipeName: recipeName,
                isFavourite: isFavourite,
                servingSizeGrams: servingSizeGrams,
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
      Value<DateTime> date,
      required LogMethod logMethod,
      required MealCategory mealType,
      Value<double> amount,
    });
typedef $$MealsTableUpdateCompanionBuilder =
    MealsCompanion Function({
      Value<int> mealID,
      Value<DateTime> date,
      Value<LogMethod> logMethod,
      Value<MealCategory> mealType,
      Value<double> amount,
    });

final class $$MealsTableReferences
    extends BaseReferences<_$AppDatabase, $MealsTable, Meal> {
  $$MealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnWithTypeConverterFilters<LogMethod, LogMethod, String> get logMethod =>
      $composableBuilder(
        column: $table.logMethod,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<MealCategory, MealCategory, String>
  get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

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

  GeneratedColumnWithTypeConverter<LogMethod, String> get logMethod =>
      $composableBuilder(column: $table.logMethod, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MealCategory, String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

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
                Value<DateTime> date = const Value.absent(),
                Value<LogMethod> logMethod = const Value.absent(),
                Value<MealCategory> mealType = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => MealsCompanion(
                mealID: mealID,
                date: date,
                logMethod: logMethod,
                mealType: mealType,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> mealID = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                required LogMethod logMethod,
                required MealCategory mealType,
                Value<double> amount = const Value.absent(),
              }) => MealsCompanion.insert(
                mealID: mealID,
                date: date,
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
              ({mealRecipeContentRefs = false, mealFoodContentRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mealRecipeContentRefs) db.mealRecipeContent,
                    if (mealFoodContentRefs) db.mealFoodContent,
                  ],
                  addJoins: null,
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
      Value<int> quantity,
      Value<int> rowid,
    });
typedef $$MealFoodContentTableUpdateCompanionBuilder =
    MealFoodContentCompanion Function({
      Value<int> mealID,
      Value<int> foodID,
      Value<int> quantity,
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
  ColumnFilters<int> get quantity => $composableBuilder(
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
  ColumnOrderings<int> get quantity => $composableBuilder(
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
  GeneratedColumn<int> get quantity =>
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
                Value<int> quantity = const Value.absent(),
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
                Value<int> quantity = const Value.absent(),
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
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> goalID,
      required GoalType type,
      Value<double?> thresholdValue,
      required MetricType metricType,
      required GoalOperator op,
      Value<bool> isComplete,
      Value<double> progressValue,
      Value<DateTime> lastEvaluated,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> goalID,
      Value<GoalType> type,
      Value<double?> thresholdValue,
      Value<MetricType> metricType,
      Value<GoalOperator> op,
      Value<bool> isComplete,
      Value<double> progressValue,
      Value<DateTime> lastEvaluated,
    });

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  static MultiTypedResultKey<$StreaksTable, List<Streak>> _streaksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.streaks,
    aliasName: 'goals__goal_i_d__streaks__goal_i_d',
  );

  $$StreaksTableProcessedTableManager get streaksRefs {
    final manager = $$StreaksTableTableManager(
      $_db,
      $_db.streaks,
    ).filter((f) => f.goalID.goalID.sqlEquals($_itemColumn<int>('goal_i_d')!));

    final cache = $_typedResult.readTableOrNull(_streaksRefsTable($_db));
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

  ColumnWithTypeConverterFilters<MetricType, MetricType, String>
  get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<GoalOperator, GoalOperator, String> get op =>
      $composableBuilder(
        column: $table.op,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progressValue => $composableBuilder(
    column: $table.progressValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastEvaluated => $composableBuilder(
    column: $table.lastEvaluated,
    builder: (column) => ColumnFilters(column),
  );

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

  Expression<bool> streaksRefs(
    Expression<bool> Function($$StreaksTableFilterComposer f) f,
  ) {
    final $$StreaksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.goalID,
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

  ColumnOrderings<String> get op => $composableBuilder(
    column: $table.op,
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

  ColumnOrderings<DateTime> get lastEvaluated => $composableBuilder(
    column: $table.lastEvaluated,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumnWithTypeConverter<MetricType, String> get metricType =>
      $composableBuilder(
        column: $table.metricType,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<GoalOperator, String> get op =>
      $composableBuilder(column: $table.op, builder: (column) => column);

  GeneratedColumn<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => column,
  );

  GeneratedColumn<double> get progressValue => $composableBuilder(
    column: $table.progressValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastEvaluated => $composableBuilder(
    column: $table.lastEvaluated,
    builder: (column) => column,
  );

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

  Expression<T> streaksRefs<T extends Object>(
    Expression<T> Function($$StreaksTableAnnotationComposer a) f,
  ) {
    final $$StreaksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalID,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.goalID,
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
            bool fastingGoalsRefs,
            bool weightGoalsRefs,
            bool hydrationGoalsRefs,
            bool nutritionGoalsRefs,
            bool streaksRefs,
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
                Value<MetricType> metricType = const Value.absent(),
                Value<GoalOperator> op = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
                Value<double> progressValue = const Value.absent(),
                Value<DateTime> lastEvaluated = const Value.absent(),
              }) => GoalsCompanion(
                goalID: goalID,
                type: type,
                thresholdValue: thresholdValue,
                metricType: metricType,
                op: op,
                isComplete: isComplete,
                progressValue: progressValue,
                lastEvaluated: lastEvaluated,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                required GoalType type,
                Value<double?> thresholdValue = const Value.absent(),
                required MetricType metricType,
                required GoalOperator op,
                Value<bool> isComplete = const Value.absent(),
                Value<double> progressValue = const Value.absent(),
                Value<DateTime> lastEvaluated = const Value.absent(),
              }) => GoalsCompanion.insert(
                goalID: goalID,
                type: type,
                thresholdValue: thresholdValue,
                metricType: metricType,
                op: op,
                isComplete: isComplete,
                progressValue: progressValue,
                lastEvaluated: lastEvaluated,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GoalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                fastingGoalsRefs = false,
                weightGoalsRefs = false,
                hydrationGoalsRefs = false,
                nutritionGoalsRefs = false,
                streaksRefs = false,
                userGoalProgressRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fastingGoalsRefs) db.fastingGoals,
                    if (weightGoalsRefs) db.weightGoals,
                    if (hydrationGoalsRefs) db.hydrationGoals,
                    if (nutritionGoalsRefs) db.nutritionGoals,
                    if (streaksRefs) db.streaks,
                    if (userGoalProgressRefs) db.userGoalProgress,
                  ],
                  addJoins: null,
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
                      if (streaksRefs)
                        await $_getPrefetchedData<Goal, $GoalsTable, Streak>(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._streaksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(db, table, p0).streaksRefs,
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
        bool fastingGoalsRefs,
        bool weightGoalsRefs,
        bool hydrationGoalsRefs,
        bool nutritionGoalsRefs,
        bool streaksRefs,
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
      required double targetWeight,
      required double startWeight,
    });
typedef $$WeightGoalsTableUpdateCompanionBuilder =
    WeightGoalsCompanion Function({
      Value<int> goalID,
      Value<double> targetWeight,
      Value<double> startWeight,
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
                Value<double> targetWeight = const Value.absent(),
                Value<double> startWeight = const Value.absent(),
              }) => WeightGoalsCompanion(
                goalID: goalID,
                targetWeight: targetWeight,
                startWeight: startWeight,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                required double targetWeight,
                required double startWeight,
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
      Value<int> hdrAmount,
      Value<DateTime> hdrDate,
    });
typedef $$HydrationGoalsTableUpdateCompanionBuilder =
    HydrationGoalsCompanion Function({
      Value<int> goalID,
      Value<int> hdrAmount,
      Value<DateTime> hdrDate,
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
                Value<int> hdrAmount = const Value.absent(),
                Value<DateTime> hdrDate = const Value.absent(),
              }) => HydrationGoalsCompanion(
                goalID: goalID,
                hdrAmount: hdrAmount,
                hdrDate: hdrDate,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                Value<int> hdrAmount = const Value.absent(),
                Value<DateTime> hdrDate = const Value.absent(),
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
      required NutrientType nutrientType,
      required int nutritionDailyTarget,
    });
typedef $$NutritionGoalsTableUpdateCompanionBuilder =
    NutritionGoalsCompanion Function({
      Value<int> goalID,
      Value<NutrientType> nutrientType,
      Value<int> nutritionDailyTarget,
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
  ColumnWithTypeConverterFilters<NutrientType, NutrientType, String>
  get nutrientType => $composableBuilder(
    column: $table.nutrientType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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
  GeneratedColumnWithTypeConverter<NutrientType, String> get nutrientType =>
      $composableBuilder(
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
                Value<NutrientType> nutrientType = const Value.absent(),
                Value<int> nutritionDailyTarget = const Value.absent(),
              }) => NutritionGoalsCompanion(
                goalID: goalID,
                nutrientType: nutrientType,
                nutritionDailyTarget: nutritionDailyTarget,
              ),
          createCompanionCallback:
              ({
                Value<int> goalID = const Value.absent(),
                required NutrientType nutrientType,
                required int nutritionDailyTarget,
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
typedef $$StreaksTableCreateCompanionBuilder =
    StreaksCompanion Function({
      Value<int> streakID,
      required int goalID,
      Value<int> streakProgress,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<UnlockType?> unlockType,
      Value<DateTime> curEvalPeriod,
      Value<DateTime> lastEvalEnd,
    });
typedef $$StreaksTableUpdateCompanionBuilder =
    StreaksCompanion Function({
      Value<int> streakID,
      Value<int> goalID,
      Value<int> streakProgress,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<UnlockType?> unlockType,
      Value<DateTime> curEvalPeriod,
      Value<DateTime> lastEvalEnd,
    });

final class $$StreaksTableReferences
    extends BaseReferences<_$AppDatabase, $StreaksTable, Streak> {
  $$StreaksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIDTable(_$AppDatabase db) =>
      db.goals.createAlias('streaks__goal_i_d__goals__goal_i_d');

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

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UnlockType?, UnlockType, String>
  get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get curEvalPeriod => $composableBuilder(
    column: $table.curEvalPeriod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastEvalEnd => $composableBuilder(
    column: $table.lastEvalEnd,
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

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get curEvalPeriod => $composableBuilder(
    column: $table.curEvalPeriod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastEvalEnd => $composableBuilder(
    column: $table.lastEvalEnd,
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

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UnlockType?, String> get unlockType =>
      $composableBuilder(
        column: $table.unlockType,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get curEvalPeriod => $composableBuilder(
    column: $table.curEvalPeriod,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastEvalEnd => $composableBuilder(
    column: $table.lastEvalEnd,
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
          PrefetchHooks Function({bool goalID})
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
                Value<int> goalID = const Value.absent(),
                Value<int> streakProgress = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<UnlockType?> unlockType = const Value.absent(),
                Value<DateTime> curEvalPeriod = const Value.absent(),
                Value<DateTime> lastEvalEnd = const Value.absent(),
              }) => StreaksCompanion(
                streakID: streakID,
                goalID: goalID,
                streakProgress: streakProgress,
                startDate: startDate,
                endDate: endDate,
                unlockType: unlockType,
                curEvalPeriod: curEvalPeriod,
                lastEvalEnd: lastEvalEnd,
              ),
          createCompanionCallback:
              ({
                Value<int> streakID = const Value.absent(),
                required int goalID,
                Value<int> streakProgress = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<UnlockType?> unlockType = const Value.absent(),
                Value<DateTime> curEvalPeriod = const Value.absent(),
                Value<DateTime> lastEvalEnd = const Value.absent(),
              }) => StreaksCompanion.insert(
                streakID: streakID,
                goalID: goalID,
                streakProgress: streakProgress,
                startDate: startDate,
                endDate: endDate,
                unlockType: unlockType,
                curEvalPeriod: curEvalPeriod,
                lastEvalEnd: lastEvalEnd,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StreaksTableReferences(db, table, e),
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
                                referencedTable: $$StreaksTableReferences
                                    ._goalIDTable(db),
                                referencedColumn: $$StreaksTableReferences
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
      PrefetchHooks Function({bool goalID})
    >;
typedef $$UserGoalProgressTableCreateCompanionBuilder =
    UserGoalProgressCompanion Function({
      Value<int> userGoalID,
      required int userID,
      required int goalID,
      Value<DateTime> dateCreated,
      Value<bool> isMain,
    });
typedef $$UserGoalProgressTableUpdateCompanionBuilder =
    UserGoalProgressCompanion Function({
      Value<int> userGoalID,
      Value<int> userID,
      Value<int> goalID,
      Value<DateTime> dateCreated,
      Value<bool> isMain,
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
          PrefetchHooks Function({bool userID, bool goalID})
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
              }) => UserGoalProgressCompanion(
                userGoalID: userGoalID,
                userID: userID,
                goalID: goalID,
                dateCreated: dateCreated,
                isMain: isMain,
              ),
          createCompanionCallback:
              ({
                Value<int> userGoalID = const Value.absent(),
                required int userID,
                required int goalID,
                Value<DateTime> dateCreated = const Value.absent(),
                Value<bool> isMain = const Value.absent(),
              }) => UserGoalProgressCompanion.insert(
                userGoalID: userGoalID,
                userID: userID,
                goalID: goalID,
                dateCreated: dateCreated,
                isMain: isMain,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserGoalProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userID = false, goalID = false}) {
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
                return [];
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
      PrefetchHooks Function({bool userID, bool goalID})
    >;
typedef $$ReinforcementsTableCreateCompanionBuilder =
    ReinforcementsCompanion Function({
      Value<int> id,
      required ConcernType cType,
      Value<GoalType?> type,
      required String title,
      required String displayContext,
      required String citation,
      required int threshold,
      required int window,
      Value<DateTime?> nextEval,
    });
typedef $$ReinforcementsTableUpdateCompanionBuilder =
    ReinforcementsCompanion Function({
      Value<int> id,
      Value<ConcernType> cType,
      Value<GoalType?> type,
      Value<String> title,
      Value<String> displayContext,
      Value<String> citation,
      Value<int> threshold,
      Value<int> window,
      Value<DateTime?> nextEval,
    });

class $$ReinforcementsTableFilterComposer
    extends Composer<_$AppDatabase, $ReinforcementsTable> {
  $$ReinforcementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ConcernType, ConcernType, String> get cType =>
      $composableBuilder(
        column: $table.cType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<GoalType?, GoalType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayContext => $composableBuilder(
    column: $table.displayContext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get citation => $composableBuilder(
    column: $table.citation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get threshold => $composableBuilder(
    column: $table.threshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get window => $composableBuilder(
    column: $table.window,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextEval => $composableBuilder(
    column: $table.nextEval,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cType => $composableBuilder(
    column: $table.cType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayContext => $composableBuilder(
    column: $table.displayContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get citation => $composableBuilder(
    column: $table.citation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get threshold => $composableBuilder(
    column: $table.threshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get window => $composableBuilder(
    column: $table.window,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextEval => $composableBuilder(
    column: $table.nextEval,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ConcernType, String> get cType =>
      $composableBuilder(column: $table.cType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GoalType?, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get displayContext => $composableBuilder(
    column: $table.displayContext,
    builder: (column) => column,
  );

  GeneratedColumn<String> get citation =>
      $composableBuilder(column: $table.citation, builder: (column) => column);

  GeneratedColumn<int> get threshold =>
      $composableBuilder(column: $table.threshold, builder: (column) => column);

  GeneratedColumn<int> get window =>
      $composableBuilder(column: $table.window, builder: (column) => column);

  GeneratedColumn<DateTime> get nextEval =>
      $composableBuilder(column: $table.nextEval, builder: (column) => column);
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
          (
            Reinforcement,
            BaseReferences<_$AppDatabase, $ReinforcementsTable, Reinforcement>,
          ),
          Reinforcement,
          PrefetchHooks Function()
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
                Value<int> id = const Value.absent(),
                Value<ConcernType> cType = const Value.absent(),
                Value<GoalType?> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> displayContext = const Value.absent(),
                Value<String> citation = const Value.absent(),
                Value<int> threshold = const Value.absent(),
                Value<int> window = const Value.absent(),
                Value<DateTime?> nextEval = const Value.absent(),
              }) => ReinforcementsCompanion(
                id: id,
                cType: cType,
                type: type,
                title: title,
                displayContext: displayContext,
                citation: citation,
                threshold: threshold,
                window: window,
                nextEval: nextEval,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required ConcernType cType,
                Value<GoalType?> type = const Value.absent(),
                required String title,
                required String displayContext,
                required String citation,
                required int threshold,
                required int window,
                Value<DateTime?> nextEval = const Value.absent(),
              }) => ReinforcementsCompanion.insert(
                id: id,
                cType: cType,
                type: type,
                title: title,
                displayContext: displayContext,
                citation: citation,
                threshold: threshold,
                window: window,
                nextEval: nextEval,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        Reinforcement,
        BaseReferences<_$AppDatabase, $ReinforcementsTable, Reinforcement>,
      ),
      Reinforcement,
      PrefetchHooks Function()
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
          (
            Achievement,
            BaseReferences<_$AppDatabase, $AchievementsTable, Achievement>,
          ),
          Achievement,
          PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        Achievement,
        BaseReferences<_$AppDatabase, $AchievementsTable, Achievement>,
      ),
      Achievement,
      PrefetchHooks Function()
    >;
typedef $$ReminderTableCreateCompanionBuilder =
    ReminderCompanion Function({
      Value<int> reminderID,
      required int userID,
      required ReminderType type,
      Value<bool> isEnabled,
      Value<DateTime?> time,
      Value<int> minutesOffset,
      Value<String?> days,
    });
typedef $$ReminderTableUpdateCompanionBuilder =
    ReminderCompanion Function({
      Value<int> reminderID,
      Value<int> userID,
      Value<ReminderType> type,
      Value<bool> isEnabled,
      Value<DateTime?> time,
      Value<int> minutesOffset,
      Value<String?> days,
    });

final class $$ReminderTableReferences
    extends BaseReferences<_$AppDatabase, $ReminderTable, ReminderData> {
  $$ReminderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) =>
      db.users.createAlias('reminder__user_i_d__users__user_i_d');

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

class $$ReminderTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderTable> {
  $$ReminderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get reminderID => $composableBuilder(
    column: $table.reminderID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ReminderType, ReminderType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutesOffset => $composableBuilder(
    column: $table.minutesOffset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get days => $composableBuilder(
    column: $table.days,
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

class $$ReminderTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderTable> {
  $$ReminderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get reminderID => $composableBuilder(
    column: $table.reminderID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutesOffset => $composableBuilder(
    column: $table.minutesOffset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get days => $composableBuilder(
    column: $table.days,
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

class $$ReminderTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderTable> {
  $$ReminderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get reminderID => $composableBuilder(
    column: $table.reminderID,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ReminderType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<int> get minutesOffset => $composableBuilder(
    column: $table.minutesOffset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get days =>
      $composableBuilder(column: $table.days, builder: (column) => column);

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

class $$ReminderTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReminderTable,
          ReminderData,
          $$ReminderTableFilterComposer,
          $$ReminderTableOrderingComposer,
          $$ReminderTableAnnotationComposer,
          $$ReminderTableCreateCompanionBuilder,
          $$ReminderTableUpdateCompanionBuilder,
          (ReminderData, $$ReminderTableReferences),
          ReminderData,
          PrefetchHooks Function({bool userID})
        > {
  $$ReminderTableTableManager(_$AppDatabase db, $ReminderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> reminderID = const Value.absent(),
                Value<int> userID = const Value.absent(),
                Value<ReminderType> type = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime?> time = const Value.absent(),
                Value<int> minutesOffset = const Value.absent(),
                Value<String?> days = const Value.absent(),
              }) => ReminderCompanion(
                reminderID: reminderID,
                userID: userID,
                type: type,
                isEnabled: isEnabled,
                time: time,
                minutesOffset: minutesOffset,
                days: days,
              ),
          createCompanionCallback:
              ({
                Value<int> reminderID = const Value.absent(),
                required int userID,
                required ReminderType type,
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime?> time = const Value.absent(),
                Value<int> minutesOffset = const Value.absent(),
                Value<String?> days = const Value.absent(),
              }) => ReminderCompanion.insert(
                reminderID: reminderID,
                userID: userID,
                type: type,
                isEnabled: isEnabled,
                time: time,
                minutesOffset: minutesOffset,
                days: days,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReminderTableReferences(db, table, e),
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
                                referencedTable: $$ReminderTableReferences
                                    ._userIDTable(db),
                                referencedColumn: $$ReminderTableReferences
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

typedef $$ReminderTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReminderTable,
      ReminderData,
      $$ReminderTableFilterComposer,
      $$ReminderTableOrderingComposer,
      $$ReminderTableAnnotationComposer,
      $$ReminderTableCreateCompanionBuilder,
      $$ReminderTableUpdateCompanionBuilder,
      (ReminderData, $$ReminderTableReferences),
      ReminderData,
      PrefetchHooks Function({bool userID})
    >;
typedef $$FoodLogTableCreateCompanionBuilder =
    FoodLogCompanion Function({
      Value<int> foodLogID,
      required MealCategory category,
      Value<DateTime> logDate,
      Value<String?> comment,
      Value<String> path,
      required LogMethod logMethod,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protein,
      Value<double> fibre,
      Value<double> calories,
    });
typedef $$FoodLogTableUpdateCompanionBuilder =
    FoodLogCompanion Function({
      Value<int> foodLogID,
      Value<MealCategory> category,
      Value<DateTime> logDate,
      Value<String?> comment,
      Value<String> path,
      Value<LogMethod> logMethod,
      Value<double> carbs,
      Value<double> fat,
      Value<double> protein,
      Value<double> fibre,
      Value<double> calories,
    });

class $$FoodLogTableFilterComposer
    extends Composer<_$AppDatabase, $FoodLogTable> {
  $$FoodLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get foodLogID => $composableBuilder(
    column: $table.foodLogID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MealCategory, MealCategory, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get logDate => $composableBuilder(
    column: $table.logDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LogMethod, LogMethod, String> get logMethod =>
      $composableBuilder(
        column: $table.logMethod,
        builder: (column) => ColumnWithTypeConverterFilters(column),
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
}

class $$FoodLogTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodLogTable> {
  $$FoodLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get foodLogID => $composableBuilder(
    column: $table.foodLogID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get logDate => $composableBuilder(
    column: $table.logDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logMethod => $composableBuilder(
    column: $table.logMethod,
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

class $$FoodLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodLogTable> {
  $$FoodLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get foodLogID =>
      $composableBuilder(column: $table.foodLogID, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MealCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get logDate =>
      $composableBuilder(column: $table.logDate, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogMethod, String> get logMethod =>
      $composableBuilder(column: $table.logMethod, builder: (column) => column);

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
}

class $$FoodLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodLogTable,
          FoodLogData,
          $$FoodLogTableFilterComposer,
          $$FoodLogTableOrderingComposer,
          $$FoodLogTableAnnotationComposer,
          $$FoodLogTableCreateCompanionBuilder,
          $$FoodLogTableUpdateCompanionBuilder,
          (
            FoodLogData,
            BaseReferences<_$AppDatabase, $FoodLogTable, FoodLogData>,
          ),
          FoodLogData,
          PrefetchHooks Function()
        > {
  $$FoodLogTableTableManager(_$AppDatabase db, $FoodLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> foodLogID = const Value.absent(),
                Value<MealCategory> category = const Value.absent(),
                Value<DateTime> logDate = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<LogMethod> logMethod = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodLogCompanion(
                foodLogID: foodLogID,
                category: category,
                logDate: logDate,
                comment: comment,
                path: path,
                logMethod: logMethod,
                carbs: carbs,
                fat: fat,
                protein: protein,
                fibre: fibre,
                calories: calories,
              ),
          createCompanionCallback:
              ({
                Value<int> foodLogID = const Value.absent(),
                required MealCategory category,
                Value<DateTime> logDate = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<String> path = const Value.absent(),
                required LogMethod logMethod,
                Value<double> carbs = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fibre = const Value.absent(),
                Value<double> calories = const Value.absent(),
              }) => FoodLogCompanion.insert(
                foodLogID: foodLogID,
                category: category,
                logDate: logDate,
                comment: comment,
                path: path,
                logMethod: logMethod,
                carbs: carbs,
                fat: fat,
                protein: protein,
                fibre: fibre,
                calories: calories,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FoodLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodLogTable,
      FoodLogData,
      $$FoodLogTableFilterComposer,
      $$FoodLogTableOrderingComposer,
      $$FoodLogTableAnnotationComposer,
      $$FoodLogTableCreateCompanionBuilder,
      $$FoodLogTableUpdateCompanionBuilder,
      (FoodLogData, BaseReferences<_$AppDatabase, $FoodLogTable, FoodLogData>),
      FoodLogData,
      PrefetchHooks Function()
    >;
typedef $$StepsLogTableCreateCompanionBuilder =
    StepsLogCompanion Function({
      Value<int> stepID,
      Value<DateTime> date,
      Value<int> startingStepCount,
      Value<int> steps,
    });
typedef $$StepsLogTableUpdateCompanionBuilder =
    StepsLogCompanion Function({
      Value<int> stepID,
      Value<DateTime> date,
      Value<int> startingStepCount,
      Value<int> steps,
    });

class $$StepsLogTableFilterComposer
    extends Composer<_$AppDatabase, $StepsLogTable> {
  $$StepsLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get stepID => $composableBuilder(
    column: $table.stepID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startingStepCount => $composableBuilder(
    column: $table.startingStepCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StepsLogTableOrderingComposer
    extends Composer<_$AppDatabase, $StepsLogTable> {
  $$StepsLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get stepID => $composableBuilder(
    column: $table.stepID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startingStepCount => $composableBuilder(
    column: $table.startingStepCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StepsLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $StepsLogTable> {
  $$StepsLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get stepID =>
      $composableBuilder(column: $table.stepID, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get startingStepCount => $composableBuilder(
    column: $table.startingStepCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);
}

class $$StepsLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StepsLogTable,
          StepsLogData,
          $$StepsLogTableFilterComposer,
          $$StepsLogTableOrderingComposer,
          $$StepsLogTableAnnotationComposer,
          $$StepsLogTableCreateCompanionBuilder,
          $$StepsLogTableUpdateCompanionBuilder,
          (
            StepsLogData,
            BaseReferences<_$AppDatabase, $StepsLogTable, StepsLogData>,
          ),
          StepsLogData,
          PrefetchHooks Function()
        > {
  $$StepsLogTableTableManager(_$AppDatabase db, $StepsLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StepsLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StepsLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StepsLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> stepID = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> startingStepCount = const Value.absent(),
                Value<int> steps = const Value.absent(),
              }) => StepsLogCompanion(
                stepID: stepID,
                date: date,
                startingStepCount: startingStepCount,
                steps: steps,
              ),
          createCompanionCallback:
              ({
                Value<int> stepID = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> startingStepCount = const Value.absent(),
                Value<int> steps = const Value.absent(),
              }) => StepsLogCompanion.insert(
                stepID: stepID,
                date: date,
                startingStepCount: startingStepCount,
                steps: steps,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StepsLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StepsLogTable,
      StepsLogData,
      $$StepsLogTableFilterComposer,
      $$StepsLogTableOrderingComposer,
      $$StepsLogTableAnnotationComposer,
      $$StepsLogTableCreateCompanionBuilder,
      $$StepsLogTableUpdateCompanionBuilder,
      (
        StepsLogData,
        BaseReferences<_$AppDatabase, $StepsLogTable, StepsLogData>,
      ),
      StepsLogData,
      PrefetchHooks Function()
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
  $$StreaksTableTableManager get streaks =>
      $$StreaksTableTableManager(_db, _db.streaks);
  $$UserGoalProgressTableTableManager get userGoalProgress =>
      $$UserGoalProgressTableTableManager(_db, _db.userGoalProgress);
  $$ReinforcementsTableTableManager get reinforcements =>
      $$ReinforcementsTableTableManager(_db, _db.reinforcements);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$ReminderTableTableManager get reminder =>
      $$ReminderTableTableManager(_db, _db.reminder);
  $$FoodLogTableTableManager get foodLog =>
      $$FoodLogTableTableManager(_db, _db.foodLog);
  $$StepsLogTableTableManager get stepsLog =>
      $$StepsLogTableTableManager(_db, _db.stepsLog);
}
