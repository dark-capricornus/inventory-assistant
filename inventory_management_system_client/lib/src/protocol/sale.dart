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

abstract class Sale implements _i1.SerializableModel {
  Sale._({
    this.id,
    required this.invoiceNumber,
    required this.saleDate,
    required this.partyId,
    required this.totalAmount,
    this.discountAmount,
    required this.taxAmount,
    required this.netAmount,
    required this.paidAmount,
    required this.balanceAmount,
    required this.saleType,
    required this.status,
    required this.userId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sale({
    int? id,
    required String invoiceNumber,
    required DateTime saleDate,
    required int partyId,
    required double totalAmount,
    double? discountAmount,
    required double taxAmount,
    required double netAmount,
    required double paidAmount,
    required double balanceAmount,
    required String saleType,
    required String status,
    required int userId,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SaleImpl;

  factory Sale.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sale(
      id: jsonSerialization['id'] as int?,
      invoiceNumber: jsonSerialization['invoiceNumber'] as String,
      saleDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['saleDate']),
      partyId: jsonSerialization['partyId'] as int,
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      discountAmount: (jsonSerialization['discountAmount'] as num?)?.toDouble(),
      taxAmount: (jsonSerialization['taxAmount'] as num).toDouble(),
      netAmount: (jsonSerialization['netAmount'] as num).toDouble(),
      paidAmount: (jsonSerialization['paidAmount'] as num).toDouble(),
      balanceAmount: (jsonSerialization['balanceAmount'] as num).toDouble(),
      saleType: jsonSerialization['saleType'] as String,
      status: jsonSerialization['status'] as String,
      userId: jsonSerialization['userId'] as int,
      notes: jsonSerialization['notes'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String invoiceNumber;

  DateTime saleDate;

  int partyId;

  double totalAmount;

  double? discountAmount;

  double taxAmount;

  double netAmount;

  double paidAmount;

  double balanceAmount;

  String saleType;

  String status;

  int userId;

  String? notes;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sale copyWith({
    int? id,
    String? invoiceNumber,
    DateTime? saleDate,
    int? partyId,
    double? totalAmount,
    double? discountAmount,
    double? taxAmount,
    double? netAmount,
    double? paidAmount,
    double? balanceAmount,
    String? saleType,
    String? status,
    int? userId,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'invoiceNumber': invoiceNumber,
      'saleDate': saleDate.toJson(),
      'partyId': partyId,
      'totalAmount': totalAmount,
      if (discountAmount != null) 'discountAmount': discountAmount,
      'taxAmount': taxAmount,
      'netAmount': netAmount,
      'paidAmount': paidAmount,
      'balanceAmount': balanceAmount,
      'saleType': saleType,
      'status': status,
      'userId': userId,
      if (notes != null) 'notes': notes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaleImpl extends Sale {
  _SaleImpl({
    int? id,
    required String invoiceNumber,
    required DateTime saleDate,
    required int partyId,
    required double totalAmount,
    double? discountAmount,
    required double taxAmount,
    required double netAmount,
    required double paidAmount,
    required double balanceAmount,
    required String saleType,
    required String status,
    required int userId,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          invoiceNumber: invoiceNumber,
          saleDate: saleDate,
          partyId: partyId,
          totalAmount: totalAmount,
          discountAmount: discountAmount,
          taxAmount: taxAmount,
          netAmount: netAmount,
          paidAmount: paidAmount,
          balanceAmount: balanceAmount,
          saleType: saleType,
          status: status,
          userId: userId,
          notes: notes,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sale copyWith({
    Object? id = _Undefined,
    String? invoiceNumber,
    DateTime? saleDate,
    int? partyId,
    double? totalAmount,
    Object? discountAmount = _Undefined,
    double? taxAmount,
    double? netAmount,
    double? paidAmount,
    double? balanceAmount,
    String? saleType,
    String? status,
    int? userId,
    Object? notes = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Sale(
      id: id is int? ? id : this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      saleDate: saleDate ?? this.saleDate,
      partyId: partyId ?? this.partyId,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount:
          discountAmount is double? ? discountAmount : this.discountAmount,
      taxAmount: taxAmount ?? this.taxAmount,
      netAmount: netAmount ?? this.netAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      balanceAmount: balanceAmount ?? this.balanceAmount,
      saleType: saleType ?? this.saleType,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      notes: notes is String? ? notes : this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
