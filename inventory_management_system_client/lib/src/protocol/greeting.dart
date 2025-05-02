/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Greeting implements _i1.SerializableModel {
  Greeting._({required this.message});

  factory Greeting({required String message}) = _GreetingImpl;

  factory Greeting.fromJson(Map<String, dynamic> jsonSerialization) {
    return Greeting(message: jsonSerialization['message'] as String);
  }

  String message;

  /// Returns a shallow copy of this [Greeting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Greeting copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GreetingImpl extends Greeting {
  _GreetingImpl({required String message}) : super._(message: message);

  /// Returns a shallow copy of this [Greeting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Greeting copyWith({String? message}) {
    return Greeting(message: message ?? this.message);
  }
}
