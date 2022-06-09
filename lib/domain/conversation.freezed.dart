// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Conversation {
  String? get uid => throw _privateConstructorUsedError;
  User get fromUserId => throw _privateConstructorUsedError;
  User get toUserId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdOn => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      User fromUserId,
      User toUserId,
      @TimestampConverter() DateTime createdOn,
      List<Message>? messages});

  $UserCopyWith<$Res> get fromUserId;
  $UserCopyWith<$Res> get toUserId;
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? createdOn = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      fromUserId: fromUserId == freezed
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as User,
      toUserId: toUserId == freezed
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as User,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }

  @override
  $UserCopyWith<$Res> get fromUserId {
    return $UserCopyWith<$Res>(_value.fromUserId, (value) {
      return _then(_value.copyWith(fromUserId: value));
    });
  }

  @override
  $UserCopyWith<$Res> get toUserId {
    return $UserCopyWith<$Res>(_value.toUserId, (value) {
      return _then(_value.copyWith(toUserId: value));
    });
  }
}

/// @nodoc
abstract class _$$_ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$$_ConversationCopyWith(
          _$_Conversation value, $Res Function(_$_Conversation) then) =
      __$$_ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      User fromUserId,
      User toUserId,
      @TimestampConverter() DateTime createdOn,
      List<Message>? messages});

  @override
  $UserCopyWith<$Res> get fromUserId;
  @override
  $UserCopyWith<$Res> get toUserId;
}

/// @nodoc
class __$$_ConversationCopyWithImpl<$Res>
    extends _$ConversationCopyWithImpl<$Res>
    implements _$$_ConversationCopyWith<$Res> {
  __$$_ConversationCopyWithImpl(
      _$_Conversation _value, $Res Function(_$_Conversation) _then)
      : super(_value, (v) => _then(v as _$_Conversation));

  @override
  _$_Conversation get _value => super._value as _$_Conversation;

  @override
  $Res call({
    Object? uid = freezed,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? createdOn = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$_Conversation(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      fromUserId: fromUserId == freezed
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as User,
      toUserId: toUserId == freezed
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as User,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messages: messages == freezed
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }
}

/// @nodoc

class _$_Conversation implements _Conversation {
  const _$_Conversation(
      {this.uid,
      required this.fromUserId,
      required this.toUserId,
      @TimestampConverter() required this.createdOn,
      final List<Message>? messages})
      : _messages = messages;

  @override
  final String? uid;
  @override
  final User fromUserId;
  @override
  final User toUserId;
  @override
  @TimestampConverter()
  final DateTime createdOn;
  final List<Message>? _messages;
  @override
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Conversation(uid: $uid, fromUserId: $fromUserId, toUserId: $toUserId, createdOn: $createdOn, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Conversation &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.fromUserId, fromUserId) &&
            const DeepCollectionEquality().equals(other.toUserId, toUserId) &&
            const DeepCollectionEquality().equals(other.createdOn, createdOn) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(fromUserId),
      const DeepCollectionEquality().hash(toUserId),
      const DeepCollectionEquality().hash(createdOn),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  _$$_ConversationCopyWith<_$_Conversation> get copyWith =>
      __$$_ConversationCopyWithImpl<_$_Conversation>(this, _$identity);
}

abstract class _Conversation implements Conversation {
  const factory _Conversation(
      {final String? uid,
      required final User fromUserId,
      required final User toUserId,
      @TimestampConverter() required final DateTime createdOn,
      final List<Message>? messages}) = _$_Conversation;

  @override
  String? get uid => throw _privateConstructorUsedError;
  @override
  User get fromUserId => throw _privateConstructorUsedError;
  @override
  User get toUserId => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get createdOn => throw _privateConstructorUsedError;
  @override
  List<Message>? get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConversationCopyWith<_$_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}
