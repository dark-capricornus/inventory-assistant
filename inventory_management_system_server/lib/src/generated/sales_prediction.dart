/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class SalesPrediction
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SalesPrediction._({
    required this.date,
    required this.predictedSales,
    required this.confidence,
    required this.historicalData,
  });

  factory SalesPrediction({
    required DateTime date,
    required double predictedSales,
    required double confidence,
    required List<double> historicalData,
  }) = _SalesPredictionImpl;

  factory SalesPrediction.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesPrediction(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      predictedSales: (jsonSerialization['predictedSales'] as num).toDouble(),
      confidence: (jsonSerialization['confidence'] as num).toDouble(),
      historicalData: (jsonSerialization['historicalData'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }

  DateTime date;

  double predictedSales;

  double confidence;

  List<double> historicalData;

  /// Returns a shallow copy of this [SalesPrediction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesPrediction copyWith({
    DateTime? date,
    double? predictedSales,
    double? confidence,
    List<double>? historicalData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      'predictedSales': predictedSales,
      'confidence': confidence,
      'historicalData': historicalData.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'date': date.toJson(),
      'predictedSales': predictedSales,
      'confidence': confidence,
      'historicalData': historicalData.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SalesPredictionImpl extends SalesPrediction {
  _SalesPredictionImpl({
    required DateTime date,
    required double predictedSales,
    required double confidence,
    required List<double> historicalData,
  }) : super._(
          date: date,
          predictedSales: predictedSales,
          confidence: confidence,
          historicalData: historicalData,
        );

  /// Returns a shallow copy of this [SalesPrediction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesPrediction copyWith({
    DateTime? date,
    double? predictedSales,
    double? confidence,
    List<double>? historicalData,
  }) {
    return SalesPrediction(
      date: date ?? this.date,
      predictedSales: predictedSales ?? this.predictedSales,
      confidence: confidence ?? this.confidence,
      historicalData:
          historicalData ?? this.historicalData.map((e0) => e0).toList(),
    );
  }
}
