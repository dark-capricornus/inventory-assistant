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

abstract class CategoryBreakdown implements _i1.SerializableModel {
  CategoryBreakdown._({
    required this.category,
    required this.sales,
    required this.percentageOfTotal,
    required this.quantitySold,
  });

  factory CategoryBreakdown({
    required String category,
    required double sales,
    required double percentageOfTotal,
    required int quantitySold,
  }) = _CategoryBreakdownImpl;

  factory CategoryBreakdown.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryBreakdown(
      category: jsonSerialization['category'] as String,
      sales: (jsonSerialization['sales'] as num).toDouble(),
      percentageOfTotal:
          (jsonSerialization['percentageOfTotal'] as num).toDouble(),
      quantitySold: jsonSerialization['quantitySold'] as int,
    );
  }

  String category;

  double sales;

  double percentageOfTotal;

  int quantitySold;

  /// Returns a shallow copy of this [CategoryBreakdown]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CategoryBreakdown copyWith({
    String? category,
    double? sales,
    double? percentageOfTotal,
    int? quantitySold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'sales': sales,
      'percentageOfTotal': percentageOfTotal,
      'quantitySold': quantitySold,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CategoryBreakdownImpl extends CategoryBreakdown {
  _CategoryBreakdownImpl({
    required String category,
    required double sales,
    required double percentageOfTotal,
    required int quantitySold,
  }) : super._(
          category: category,
          sales: sales,
          percentageOfTotal: percentageOfTotal,
          quantitySold: quantitySold,
        );

  /// Returns a shallow copy of this [CategoryBreakdown]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CategoryBreakdown copyWith({
    String? category,
    double? sales,
    double? percentageOfTotal,
    int? quantitySold,
  }) {
    return CategoryBreakdown(
      category: category ?? this.category,
      sales: sales ?? this.sales,
      percentageOfTotal: percentageOfTotal ?? this.percentageOfTotal,
      quantitySold: quantitySold ?? this.quantitySold,
    );
  }
}
