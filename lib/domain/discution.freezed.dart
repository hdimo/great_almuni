// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Discution _$DiscutionFromJson(Map<String, dynamic> json) {
  return _Discution.fromJson(json);
}

/// @nodoc
mixin _$Discution {
  String? get uid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<Comment>? get comments => throw _privateConstructorUsedError;
  DateTime get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscutionCopyWith<Discution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscutionCopyWith<$Res> {
  factory $DiscutionCopyWith(Discution value, $Res Function(Discution) then) =
      _$DiscutionCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      String title,
      String category,
      String content,
      String userId,
      List<Comment>? comments,
      DateTime createdOn});
}

/// @nodoc
class _$DiscutionCopyWithImpl<$Res> implements $DiscutionCopyWith<$Res> {
  _$DiscutionCopyWithImpl(this._value, this._then);

  final Discution _value;
  // ignore: unused_field
  final $Res Function(Discution) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? content = freezed,
    Object? userId = freezed,
    Object? comments = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_DiscutionCopyWith<$Res> implements $DiscutionCopyWith<$Res> {
  factory _$$_DiscutionCopyWith(
          _$_Discution value, $Res Function(_$_Discution) then) =
      __$$_DiscutionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      String title,
      String category,
      String content,
      String userId,
      List<Comment>? comments,
      DateTime createdOn});
}

/// @nodoc
class __$$_DiscutionCopyWithImpl<$Res> extends _$DiscutionCopyWithImpl<$Res>
    implements _$$_DiscutionCopyWith<$Res> {
  __$$_DiscutionCopyWithImpl(
      _$_Discution _value, $Res Function(_$_Discution) _then)
      : super(_value, (v) => _then(v as _$_Discution));

  @override
  _$_Discution get _value => super._value as _$_Discution;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? content = freezed,
    Object? userId = freezed,
    Object? comments = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$_Discution(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Discution implements _Discution {
  const _$_Discution(
      {this.uid,
      required this.title,
      required this.category,
      required this.content,
      required this.userId,
      final List<Comment>? comments,
      required this.createdOn})
      : _comments = comments;

  factory _$_Discution.fromJson(Map<String, dynamic> json) =>
      _$$_DiscutionFromJson(json);

  @override
  final String? uid;
  @override
  final String title;
  @override
  final String category;
  @override
  final String content;
  @override
  final String userId;
  final List<Comment>? _comments;
  @override
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime createdOn;

  @override
  String toString() {
    return 'Discution(uid: $uid, title: $title, category: $category, content: $content, userId: $userId, comments: $comments, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Discution &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other.createdOn, createdOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(createdOn));

  @JsonKey(ignore: true)
  @override
  _$$_DiscutionCopyWith<_$_Discution> get copyWith =>
      __$$_DiscutionCopyWithImpl<_$_Discution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscutionToJson(this);
  }
}

abstract class _Discution implements Discution {
  const factory _Discution(
      {final String? uid,
      required final String title,
      required final String category,
      required final String content,
      required final String userId,
      final List<Comment>? comments,
      required final DateTime createdOn}) = _$_Discution;

  factory _Discution.fromJson(Map<String, dynamic> json) =
      _$_Discution.fromJson;

  @override
  String? get uid => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  DateTime get createdOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiscutionCopyWith<_$_Discution> get copyWith =>
      throw _privateConstructorUsedError;
}
