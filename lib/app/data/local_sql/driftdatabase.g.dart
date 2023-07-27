// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driftdatabase.dart';

// ignore_for_file: type=lint
class $TodoTable extends Todo with TableInfo<$TodoTable, TodoObj> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _id_todoMeta =
      const VerificationMeta('id_todo');
  @override
  late final GeneratedColumn<String> id_todo = GeneratedColumn<String>(
      'id_todo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _id_user_createrMeta =
      const VerificationMeta('id_user_creater');
  @override
  late final GeneratedColumn<String> id_user_creater = GeneratedColumn<String>(
      'id_user_creater', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _id_user_executorMeta =
      const VerificationMeta('id_user_executor');
  @override
  late final GeneratedColumn<String> id_user_executor = GeneratedColumn<String>(
      'id_user_executor', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateTime_createMeta =
      const VerificationMeta('dateTime_create');
  @override
  late final GeneratedColumn<String> dateTime_create = GeneratedColumn<String>(
      'date_time_create', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priority_taskMeta =
      const VerificationMeta('priority_task');
  @override
  late final GeneratedColumn<String> priority_task = GeneratedColumn<String>(
      'priority_task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _generatedTextMeta =
      const VerificationMeta('generatedText');
  @override
  late final GeneratedColumn<String> generatedText = GeneratedColumn<String>(
      'generated_text', aliasedName, true,
      generatedAs: GeneratedAs(
          id_todo +
              const Constant(' (') +
              name +
              description +
              const Constant(')'),
          false),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        id_todo,
        id_user_creater,
        id_user_executor,
        name,
        description,
        dateTime_create,
        priority_task,
        generatedText
      ];
  @override
  String get aliasedName => _alias ?? 'todo';
  @override
  String get actualTableName => 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<TodoObj> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_todo')) {
      context.handle(_id_todoMeta,
          id_todo.isAcceptableOrUnknown(data['id_todo']!, _id_todoMeta));
    } else if (isInserting) {
      context.missing(_id_todoMeta);
    }
    if (data.containsKey('id_user_creater')) {
      context.handle(
          _id_user_createrMeta,
          id_user_creater.isAcceptableOrUnknown(
              data['id_user_creater']!, _id_user_createrMeta));
    } else if (isInserting) {
      context.missing(_id_user_createrMeta);
    }
    if (data.containsKey('id_user_executor')) {
      context.handle(
          _id_user_executorMeta,
          id_user_executor.isAcceptableOrUnknown(
              data['id_user_executor']!, _id_user_executorMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('date_time_create')) {
      context.handle(
          _dateTime_createMeta,
          dateTime_create.isAcceptableOrUnknown(
              data['date_time_create']!, _dateTime_createMeta));
    } else if (isInserting) {
      context.missing(_dateTime_createMeta);
    }
    if (data.containsKey('priority_task')) {
      context.handle(
          _priority_taskMeta,
          priority_task.isAcceptableOrUnknown(
              data['priority_task']!, _priority_taskMeta));
    } else if (isInserting) {
      context.missing(_priority_taskMeta);
    }
    if (data.containsKey('generated_text')) {
      context.handle(
          _generatedTextMeta,
          generatedText.isAcceptableOrUnknown(
              data['generated_text']!, _generatedTextMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoObj map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoObj(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      id_todo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_todo'])!,
      id_user_creater: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_user_creater'])!,
      id_user_executor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_user_executor']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      dateTime_create: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}date_time_create'])!,
      priority_task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority_task'])!,
      generatedText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}generated_text']),
    );
  }

  @override
  $TodoTable createAlias(String alias) {
    return $TodoTable(attachedDatabase, alias);
  }
}

class TodoObj extends DataClass implements Insertable<TodoObj> {
  final int id;
  final String id_todo;
  final String id_user_creater;
  final String? id_user_executor;
  final String name;
  final String description;
  final String dateTime_create;
  final String priority_task;
  final String? generatedText;
  const TodoObj(
      {required this.id,
      required this.id_todo,
      required this.id_user_creater,
      this.id_user_executor,
      required this.name,
      required this.description,
      required this.dateTime_create,
      required this.priority_task,
      this.generatedText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_todo'] = Variable<String>(id_todo);
    map['id_user_creater'] = Variable<String>(id_user_creater);
    if (!nullToAbsent || id_user_executor != null) {
      map['id_user_executor'] = Variable<String>(id_user_executor);
    }
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['date_time_create'] = Variable<String>(dateTime_create);
    map['priority_task'] = Variable<String>(priority_task);
    return map;
  }

  TodoCompanion toCompanion(bool nullToAbsent) {
    return TodoCompanion(
      id: Value(id),
      id_todo: Value(id_todo),
      id_user_creater: Value(id_user_creater),
      id_user_executor: id_user_executor == null && nullToAbsent
          ? const Value.absent()
          : Value(id_user_executor),
      name: Value(name),
      description: Value(description),
      dateTime_create: Value(dateTime_create),
      priority_task: Value(priority_task),
    );
  }

  factory TodoObj.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoObj(
      id: serializer.fromJson<int>(json['id']),
      id_todo: serializer.fromJson<String>(json['id_todo']),
      id_user_creater: serializer.fromJson<String>(json['id_user_creater']),
      id_user_executor: serializer.fromJson<String?>(json['id_user_executor']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      dateTime_create: serializer.fromJson<String>(json['dateTime_create']),
      priority_task: serializer.fromJson<String>(json['priority_task']),
      generatedText: serializer.fromJson<String?>(json['generatedText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_todo': serializer.toJson<String>(id_todo),
      'id_user_creater': serializer.toJson<String>(id_user_creater),
      'id_user_executor': serializer.toJson<String?>(id_user_executor),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'dateTime_create': serializer.toJson<String>(dateTime_create),
      'priority_task': serializer.toJson<String>(priority_task),
      'generatedText': serializer.toJson<String?>(generatedText),
    };
  }

  TodoObj copyWith(
          {int? id,
          String? id_todo,
          String? id_user_creater,
          Value<String?> id_user_executor = const Value.absent(),
          String? name,
          String? description,
          String? dateTime_create,
          String? priority_task,
          Value<String?> generatedText = const Value.absent()}) =>
      TodoObj(
        id: id ?? this.id,
        id_todo: id_todo ?? this.id_todo,
        id_user_creater: id_user_creater ?? this.id_user_creater,
        id_user_executor: id_user_executor.present
            ? id_user_executor.value
            : this.id_user_executor,
        name: name ?? this.name,
        description: description ?? this.description,
        dateTime_create: dateTime_create ?? this.dateTime_create,
        priority_task: priority_task ?? this.priority_task,
        generatedText:
            generatedText.present ? generatedText.value : this.generatedText,
      );
  @override
  String toString() {
    return (StringBuffer('TodoObj(')
          ..write('id: $id, ')
          ..write('id_todo: $id_todo, ')
          ..write('id_user_creater: $id_user_creater, ')
          ..write('id_user_executor: $id_user_executor, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('dateTime_create: $dateTime_create, ')
          ..write('priority_task: $priority_task, ')
          ..write('generatedText: $generatedText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      id_todo,
      id_user_creater,
      id_user_executor,
      name,
      description,
      dateTime_create,
      priority_task,
      generatedText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoObj &&
          other.id == this.id &&
          other.id_todo == this.id_todo &&
          other.id_user_creater == this.id_user_creater &&
          other.id_user_executor == this.id_user_executor &&
          other.name == this.name &&
          other.description == this.description &&
          other.dateTime_create == this.dateTime_create &&
          other.priority_task == this.priority_task &&
          other.generatedText == this.generatedText);
}

class TodoCompanion extends UpdateCompanion<TodoObj> {
  final Value<int> id;
  final Value<String> id_todo;
  final Value<String> id_user_creater;
  final Value<String?> id_user_executor;
  final Value<String> name;
  final Value<String> description;
  final Value<String> dateTime_create;
  final Value<String> priority_task;
  const TodoCompanion({
    this.id = const Value.absent(),
    this.id_todo = const Value.absent(),
    this.id_user_creater = const Value.absent(),
    this.id_user_executor = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.dateTime_create = const Value.absent(),
    this.priority_task = const Value.absent(),
  });
  TodoCompanion.insert({
    this.id = const Value.absent(),
    required String id_todo,
    required String id_user_creater,
    this.id_user_executor = const Value.absent(),
    required String name,
    required String description,
    required String dateTime_create,
    required String priority_task,
  })  : id_todo = Value(id_todo),
        id_user_creater = Value(id_user_creater),
        name = Value(name),
        description = Value(description),
        dateTime_create = Value(dateTime_create),
        priority_task = Value(priority_task);
  static Insertable<TodoObj> custom({
    Expression<int>? id,
    Expression<String>? id_todo,
    Expression<String>? id_user_creater,
    Expression<String>? id_user_executor,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? dateTime_create,
    Expression<String>? priority_task,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_todo != null) 'id_todo': id_todo,
      if (id_user_creater != null) 'id_user_creater': id_user_creater,
      if (id_user_executor != null) 'id_user_executor': id_user_executor,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (dateTime_create != null) 'date_time_create': dateTime_create,
      if (priority_task != null) 'priority_task': priority_task,
    });
  }

  TodoCompanion copyWith(
      {Value<int>? id,
      Value<String>? id_todo,
      Value<String>? id_user_creater,
      Value<String?>? id_user_executor,
      Value<String>? name,
      Value<String>? description,
      Value<String>? dateTime_create,
      Value<String>? priority_task}) {
    return TodoCompanion(
      id: id ?? this.id,
      id_todo: id_todo ?? this.id_todo,
      id_user_creater: id_user_creater ?? this.id_user_creater,
      id_user_executor: id_user_executor ?? this.id_user_executor,
      name: name ?? this.name,
      description: description ?? this.description,
      dateTime_create: dateTime_create ?? this.dateTime_create,
      priority_task: priority_task ?? this.priority_task,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_todo.present) {
      map['id_todo'] = Variable<String>(id_todo.value);
    }
    if (id_user_creater.present) {
      map['id_user_creater'] = Variable<String>(id_user_creater.value);
    }
    if (id_user_executor.present) {
      map['id_user_executor'] = Variable<String>(id_user_executor.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dateTime_create.present) {
      map['date_time_create'] = Variable<String>(dateTime_create.value);
    }
    if (priority_task.present) {
      map['priority_task'] = Variable<String>(priority_task.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCompanion(')
          ..write('id: $id, ')
          ..write('id_todo: $id_todo, ')
          ..write('id_user_creater: $id_user_creater, ')
          ..write('id_user_executor: $id_user_executor, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('dateTime_create: $dateTime_create, ')
          ..write('priority_task: $priority_task')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserObj> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _id_userMeta =
      const VerificationMeta('id_user');
  @override
  late final GeneratedColumn<String> id_user = GeneratedColumn<String>(
      'id_user', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _list_companyMeta =
      const VerificationMeta('list_company');
  @override
  late final GeneratedColumn<String> list_company = GeneratedColumn<String>(
      'list_company', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, id_user, list_company, login, password, name, email];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserObj> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_user')) {
      context.handle(_id_userMeta,
          id_user.isAcceptableOrUnknown(data['id_user']!, _id_userMeta));
    } else if (isInserting) {
      context.missing(_id_userMeta);
    }
    if (data.containsKey('list_company')) {
      context.handle(
          _list_companyMeta,
          list_company.isAcceptableOrUnknown(
              data['list_company']!, _list_companyMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserObj map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserObj(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      id_user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_user'])!,
      list_company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}list_company']),
      login: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserObj extends DataClass implements Insertable<UserObj> {
  final int id;
  final String id_user;
  final String? list_company;
  final String login;
  final String password;
  final String name;
  final String email;
  const UserObj(
      {required this.id,
      required this.id_user,
      this.list_company,
      required this.login,
      required this.password,
      required this.name,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_user'] = Variable<String>(id_user);
    if (!nullToAbsent || list_company != null) {
      map['list_company'] = Variable<String>(list_company);
    }
    map['login'] = Variable<String>(login);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      id_user: Value(id_user),
      list_company: list_company == null && nullToAbsent
          ? const Value.absent()
          : Value(list_company),
      login: Value(login),
      password: Value(password),
      name: Value(name),
      email: Value(email),
    );
  }

  factory UserObj.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserObj(
      id: serializer.fromJson<int>(json['id']),
      id_user: serializer.fromJson<String>(json['id_user']),
      list_company: serializer.fromJson<String?>(json['list_company']),
      login: serializer.fromJson<String>(json['login']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_user': serializer.toJson<String>(id_user),
      'list_company': serializer.toJson<String?>(list_company),
      'login': serializer.toJson<String>(login),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
    };
  }

  UserObj copyWith(
          {int? id,
          String? id_user,
          Value<String?> list_company = const Value.absent(),
          String? login,
          String? password,
          String? name,
          String? email}) =>
      UserObj(
        id: id ?? this.id,
        id_user: id_user ?? this.id_user,
        list_company:
            list_company.present ? list_company.value : this.list_company,
        login: login ?? this.login,
        password: password ?? this.password,
        name: name ?? this.name,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('UserObj(')
          ..write('id: $id, ')
          ..write('id_user: $id_user, ')
          ..write('list_company: $list_company, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, id_user, list_company, login, password, name, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserObj &&
          other.id == this.id &&
          other.id_user == this.id_user &&
          other.list_company == this.list_company &&
          other.login == this.login &&
          other.password == this.password &&
          other.name == this.name &&
          other.email == this.email);
}

class UserCompanion extends UpdateCompanion<UserObj> {
  final Value<int> id;
  final Value<String> id_user;
  final Value<String?> list_company;
  final Value<String> login;
  final Value<String> password;
  final Value<String> name;
  final Value<String> email;
  const UserCompanion({
    this.id = const Value.absent(),
    this.id_user = const Value.absent(),
    this.list_company = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String id_user,
    this.list_company = const Value.absent(),
    required String login,
    required String password,
    required String name,
    required String email,
  })  : id_user = Value(id_user),
        login = Value(login),
        password = Value(password),
        name = Value(name),
        email = Value(email);
  static Insertable<UserObj> custom({
    Expression<int>? id,
    Expression<String>? id_user,
    Expression<String>? list_company,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? name,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_user != null) 'id_user': id_user,
      if (list_company != null) 'list_company': list_company,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? id_user,
      Value<String?>? list_company,
      Value<String>? login,
      Value<String>? password,
      Value<String>? name,
      Value<String>? email}) {
    return UserCompanion(
      id: id ?? this.id,
      id_user: id_user ?? this.id_user,
      list_company: list_company ?? this.list_company,
      login: login ?? this.login,
      password: password ?? this.password,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_user.present) {
      map['id_user'] = Variable<String>(id_user.value);
    }
    if (list_company.present) {
      map['list_company'] = Variable<String>(list_company.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('id_user: $id_user, ')
          ..write('list_company: $list_company, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $CompanyTable extends Company with TableInfo<$CompanyTable, Companyobj> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _id_companyMeta =
      const VerificationMeta('id_company');
  @override
  late final GeneratedColumn<String> id_company = GeneratedColumn<String>(
      'id_company', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _list_userMeta =
      const VerificationMeta('list_user');
  @override
  late final GeneratedColumn<String> list_user = GeneratedColumn<String>(
      'list_user', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _generatedTextMeta =
      const VerificationMeta('generatedText');
  @override
  late final GeneratedColumn<String> generatedText = GeneratedColumn<String>(
      'generated_text', aliasedName, true,
      generatedAs: GeneratedAs(
          name + const Constant(' (') + id_company + const Constant(')'),
          false),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, id_company, name, list_user, generatedText];
  @override
  String get aliasedName => _alias ?? 'company';
  @override
  String get actualTableName => 'company';
  @override
  VerificationContext validateIntegrity(Insertable<Companyobj> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_company')) {
      context.handle(
          _id_companyMeta,
          id_company.isAcceptableOrUnknown(
              data['id_company']!, _id_companyMeta));
    } else if (isInserting) {
      context.missing(_id_companyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('list_user')) {
      context.handle(_list_userMeta,
          list_user.isAcceptableOrUnknown(data['list_user']!, _list_userMeta));
    }
    if (data.containsKey('generated_text')) {
      context.handle(
          _generatedTextMeta,
          generatedText.isAcceptableOrUnknown(
              data['generated_text']!, _generatedTextMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Companyobj map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Companyobj(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      id_company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_company'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      list_user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}list_user']),
      generatedText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}generated_text']),
    );
  }

  @override
  $CompanyTable createAlias(String alias) {
    return $CompanyTable(attachedDatabase, alias);
  }
}

class Companyobj extends DataClass implements Insertable<Companyobj> {
  final int id;
  final String id_company;
  final String name;
  final String? list_user;
  final String? generatedText;
  const Companyobj(
      {required this.id,
      required this.id_company,
      required this.name,
      this.list_user,
      this.generatedText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_company'] = Variable<String>(id_company);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || list_user != null) {
      map['list_user'] = Variable<String>(list_user);
    }
    return map;
  }

  CompanyCompanion toCompanion(bool nullToAbsent) {
    return CompanyCompanion(
      id: Value(id),
      id_company: Value(id_company),
      name: Value(name),
      list_user: list_user == null && nullToAbsent
          ? const Value.absent()
          : Value(list_user),
    );
  }

  factory Companyobj.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Companyobj(
      id: serializer.fromJson<int>(json['id']),
      id_company: serializer.fromJson<String>(json['id_company']),
      name: serializer.fromJson<String>(json['name']),
      list_user: serializer.fromJson<String?>(json['list_user']),
      generatedText: serializer.fromJson<String?>(json['generatedText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_company': serializer.toJson<String>(id_company),
      'name': serializer.toJson<String>(name),
      'list_user': serializer.toJson<String?>(list_user),
      'generatedText': serializer.toJson<String?>(generatedText),
    };
  }

  Companyobj copyWith(
          {int? id,
          String? id_company,
          String? name,
          Value<String?> list_user = const Value.absent(),
          Value<String?> generatedText = const Value.absent()}) =>
      Companyobj(
        id: id ?? this.id,
        id_company: id_company ?? this.id_company,
        name: name ?? this.name,
        list_user: list_user.present ? list_user.value : this.list_user,
        generatedText:
            generatedText.present ? generatedText.value : this.generatedText,
      );
  @override
  String toString() {
    return (StringBuffer('Companyobj(')
          ..write('id: $id, ')
          ..write('id_company: $id_company, ')
          ..write('name: $name, ')
          ..write('list_user: $list_user, ')
          ..write('generatedText: $generatedText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, id_company, name, list_user, generatedText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Companyobj &&
          other.id == this.id &&
          other.id_company == this.id_company &&
          other.name == this.name &&
          other.list_user == this.list_user &&
          other.generatedText == this.generatedText);
}

class CompanyCompanion extends UpdateCompanion<Companyobj> {
  final Value<int> id;
  final Value<String> id_company;
  final Value<String> name;
  final Value<String?> list_user;
  const CompanyCompanion({
    this.id = const Value.absent(),
    this.id_company = const Value.absent(),
    this.name = const Value.absent(),
    this.list_user = const Value.absent(),
  });
  CompanyCompanion.insert({
    this.id = const Value.absent(),
    required String id_company,
    required String name,
    this.list_user = const Value.absent(),
  })  : id_company = Value(id_company),
        name = Value(name);
  static Insertable<Companyobj> custom({
    Expression<int>? id,
    Expression<String>? id_company,
    Expression<String>? name,
    Expression<String>? list_user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_company != null) 'id_company': id_company,
      if (name != null) 'name': name,
      if (list_user != null) 'list_user': list_user,
    });
  }

  CompanyCompanion copyWith(
      {Value<int>? id,
      Value<String>? id_company,
      Value<String>? name,
      Value<String?>? list_user}) {
    return CompanyCompanion(
      id: id ?? this.id,
      id_company: id_company ?? this.id_company,
      name: name ?? this.name,
      list_user: list_user ?? this.list_user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_company.present) {
      map['id_company'] = Variable<String>(id_company.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (list_user.present) {
      map['list_user'] = Variable<String>(list_user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyCompanion(')
          ..write('id: $id, ')
          ..write('id_company: $id_company, ')
          ..write('name: $name, ')
          ..write('list_user: $list_user')
          ..write(')'))
        .toString();
  }
}

abstract class _$FirstDatabase extends GeneratedDatabase {
  _$FirstDatabase(QueryExecutor e) : super(e);
  late final $TodoTable todo = $TodoTable(this);
  late final $UserTable user = $UserTable(this);
  late final $CompanyTable company = $CompanyTable(this);
  late final UserDao userDao = UserDao(this as FirstDatabase);
  late final CompanyDao companyDao = CompanyDao(this as FirstDatabase);
  late final TodosDao todosDao = TodosDao(this as FirstDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todo, user, company];
}
