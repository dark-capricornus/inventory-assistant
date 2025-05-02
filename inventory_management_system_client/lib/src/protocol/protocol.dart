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
import 'analytics/category_breakdown.dart' as _i2;
import 'analytics/daily_sales.dart' as _i3;
import 'analytics/expense_analytics.dart' as _i4;
import 'analytics/expense_category.dart' as _i5;
import 'analytics/expense_data_point.dart' as _i6;
import 'analytics/sales_analytics.dart' as _i7;
import 'analytics/sales_data.dart' as _i8;
import 'analytics/sales_trend.dart' as _i9;
import 'analytics/top_product.dart' as _i10;
import 'category.dart' as _i11;
import 'customer.dart' as _i12;
import 'expense.dart' as _i13;
import 'greeting.dart' as _i14;
import 'inventory_optimization.dart' as _i15;
import 'party.dart' as _i16;
import 'pricing_suggestion.dart' as _i17;
import 'product.dart' as _i18;
import 'purchase_order.dart' as _i19;
import 'sale.dart' as _i20;
import 'sale_item.dart' as _i21;
import 'sales_prediction.dart' as _i22;
import 'supplier.dart' as _i23;
import 'user.dart' as _i24;
import 'package:inventory_management_system_client/src/protocol/sale.dart'
    as _i25;
import 'package:inventory_management_system_client/src/protocol/product.dart'
    as _i26;
import 'package:inventory_management_system_client/src/protocol/purchase_order.dart'
    as _i27;
import 'package:inventory_management_system_client/src/protocol/supplier.dart'
    as _i28;
import 'package:inventory_management_system_client/src/protocol/customer.dart'
    as _i29;
import 'package:inventory_management_system_client/src/protocol/category.dart'
    as _i30;
import 'package:inventory_management_system_client/src/protocol/expense.dart'
    as _i31;
export 'analytics/category_breakdown.dart';
export 'analytics/daily_sales.dart';
export 'analytics/expense_analytics.dart';
export 'analytics/expense_category.dart';
export 'analytics/expense_data_point.dart';
export 'analytics/sales_analytics.dart';
export 'analytics/sales_data.dart';
export 'analytics/sales_trend.dart';
export 'analytics/top_product.dart';
export 'category.dart';
export 'customer.dart';
export 'expense.dart';
export 'greeting.dart';
export 'inventory_optimization.dart';
export 'party.dart';
export 'pricing_suggestion.dart';
export 'product.dart';
export 'purchase_order.dart';
export 'sale.dart';
export 'sale_item.dart';
export 'sales_prediction.dart';
export 'supplier.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.CategoryBreakdown) {
      return _i2.CategoryBreakdown.fromJson(data) as T;
    }
    if (t == _i3.DailySales) {
      return _i3.DailySales.fromJson(data) as T;
    }
    if (t == _i4.ExpenseAnalytics) {
      return _i4.ExpenseAnalytics.fromJson(data) as T;
    }
    if (t == _i5.ExpenseCategory) {
      return _i5.ExpenseCategory.fromJson(data) as T;
    }
    if (t == _i6.ExpenseDataPoint) {
      return _i6.ExpenseDataPoint.fromJson(data) as T;
    }
    if (t == _i7.SalesAnalytics) {
      return _i7.SalesAnalytics.fromJson(data) as T;
    }
    if (t == _i8.SalesData) {
      return _i8.SalesData.fromJson(data) as T;
    }
    if (t == _i9.SalesTrend) {
      return _i9.SalesTrend.fromJson(data) as T;
    }
    if (t == _i10.TopProduct) {
      return _i10.TopProduct.fromJson(data) as T;
    }
    if (t == _i11.Category) {
      return _i11.Category.fromJson(data) as T;
    }
    if (t == _i12.Customer) {
      return _i12.Customer.fromJson(data) as T;
    }
    if (t == _i13.Expense) {
      return _i13.Expense.fromJson(data) as T;
    }
    if (t == _i14.Greeting) {
      return _i14.Greeting.fromJson(data) as T;
    }
    if (t == _i15.InventoryOptimization) {
      return _i15.InventoryOptimization.fromJson(data) as T;
    }
    if (t == _i16.Party) {
      return _i16.Party.fromJson(data) as T;
    }
    if (t == _i17.PricingSuggestion) {
      return _i17.PricingSuggestion.fromJson(data) as T;
    }
    if (t == _i18.Product) {
      return _i18.Product.fromJson(data) as T;
    }
    if (t == _i19.PurchaseOrder) {
      return _i19.PurchaseOrder.fromJson(data) as T;
    }
    if (t == _i20.Sale) {
      return _i20.Sale.fromJson(data) as T;
    }
    if (t == _i21.SaleItem) {
      return _i21.SaleItem.fromJson(data) as T;
    }
    if (t == _i22.SalesPrediction) {
      return _i22.SalesPrediction.fromJson(data) as T;
    }
    if (t == _i23.Supplier) {
      return _i23.Supplier.fromJson(data) as T;
    }
    if (t == _i24.User) {
      return _i24.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CategoryBreakdown?>()) {
      return (data != null ? _i2.CategoryBreakdown.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DailySales?>()) {
      return (data != null ? _i3.DailySales.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ExpenseAnalytics?>()) {
      return (data != null ? _i4.ExpenseAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ExpenseCategory?>()) {
      return (data != null ? _i5.ExpenseCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ExpenseDataPoint?>()) {
      return (data != null ? _i6.ExpenseDataPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.SalesAnalytics?>()) {
      return (data != null ? _i7.SalesAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.SalesData?>()) {
      return (data != null ? _i8.SalesData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.SalesTrend?>()) {
      return (data != null ? _i9.SalesTrend.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TopProduct?>()) {
      return (data != null ? _i10.TopProduct.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Category?>()) {
      return (data != null ? _i11.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Customer?>()) {
      return (data != null ? _i12.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Expense?>()) {
      return (data != null ? _i13.Expense.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Greeting?>()) {
      return (data != null ? _i14.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.InventoryOptimization?>()) {
      return (data != null ? _i15.InventoryOptimization.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.Party?>()) {
      return (data != null ? _i16.Party.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PricingSuggestion?>()) {
      return (data != null ? _i17.PricingSuggestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Product?>()) {
      return (data != null ? _i18.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PurchaseOrder?>()) {
      return (data != null ? _i19.PurchaseOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Sale?>()) {
      return (data != null ? _i20.Sale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SaleItem?>()) {
      return (data != null ? _i21.SaleItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.SalesPrediction?>()) {
      return (data != null ? _i22.SalesPrediction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Supplier?>()) {
      return (data != null ? _i23.Supplier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.User?>()) {
      return (data != null ? _i24.User.fromJson(data) : null) as T;
    }
    if (t == List<_i6.ExpenseDataPoint>) {
      return (data as List)
          .map((e) => deserialize<_i6.ExpenseDataPoint>(e))
          .toList() as T;
    }
    if (t == List<_i5.ExpenseCategory>) {
      return (data as List)
          .map((e) => deserialize<_i5.ExpenseCategory>(e))
          .toList() as T;
    }
    if (t == List<_i8.SalesData>) {
      return (data as List).map((e) => deserialize<_i8.SalesData>(e)).toList()
          as T;
    }
    if (t == List<_i10.TopProduct>) {
      return (data as List).map((e) => deserialize<_i10.TopProduct>(e)).toList()
          as T;
    }
    if (t == List<_i3.DailySales>) {
      return (data as List).map((e) => deserialize<_i3.DailySales>(e)).toList()
          as T;
    }
    if (t == Map<String, double>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<double>(v))) as T;
    }
    if (t == List<_i2.CategoryBreakdown>) {
      return (data as List)
          .map((e) => deserialize<_i2.CategoryBreakdown>(e))
          .toList() as T;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList() as T;
    }
    if (t == List<_i25.Sale>) {
      return (data as List).map((e) => deserialize<_i25.Sale>(e)).toList() as T;
    }
    if (t == List<_i26.Product>) {
      return (data as List).map((e) => deserialize<_i26.Product>(e)).toList()
          as T;
    }
    if (t == List<_i27.PurchaseOrder>) {
      return (data as List)
          .map((e) => deserialize<_i27.PurchaseOrder>(e))
          .toList() as T;
    }
    if (t == List<_i28.Supplier>) {
      return (data as List).map((e) => deserialize<_i28.Supplier>(e)).toList()
          as T;
    }
    if (t == List<_i29.Customer>) {
      return (data as List).map((e) => deserialize<_i29.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i30.Category>) {
      return (data as List).map((e) => deserialize<_i30.Category>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i31.Expense>) {
      return (data as List).map((e) => deserialize<_i31.Expense>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CategoryBreakdown) {
      return 'CategoryBreakdown';
    }
    if (data is _i3.DailySales) {
      return 'DailySales';
    }
    if (data is _i4.ExpenseAnalytics) {
      return 'ExpenseAnalytics';
    }
    if (data is _i5.ExpenseCategory) {
      return 'ExpenseCategory';
    }
    if (data is _i6.ExpenseDataPoint) {
      return 'ExpenseDataPoint';
    }
    if (data is _i7.SalesAnalytics) {
      return 'SalesAnalytics';
    }
    if (data is _i8.SalesData) {
      return 'SalesData';
    }
    if (data is _i9.SalesTrend) {
      return 'SalesTrend';
    }
    if (data is _i10.TopProduct) {
      return 'TopProduct';
    }
    if (data is _i11.Category) {
      return 'Category';
    }
    if (data is _i12.Customer) {
      return 'Customer';
    }
    if (data is _i13.Expense) {
      return 'Expense';
    }
    if (data is _i14.Greeting) {
      return 'Greeting';
    }
    if (data is _i15.InventoryOptimization) {
      return 'InventoryOptimization';
    }
    if (data is _i16.Party) {
      return 'Party';
    }
    if (data is _i17.PricingSuggestion) {
      return 'PricingSuggestion';
    }
    if (data is _i18.Product) {
      return 'Product';
    }
    if (data is _i19.PurchaseOrder) {
      return 'PurchaseOrder';
    }
    if (data is _i20.Sale) {
      return 'Sale';
    }
    if (data is _i21.SaleItem) {
      return 'SaleItem';
    }
    if (data is _i22.SalesPrediction) {
      return 'SalesPrediction';
    }
    if (data is _i23.Supplier) {
      return 'Supplier';
    }
    if (data is _i24.User) {
      return 'User';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CategoryBreakdown') {
      return deserialize<_i2.CategoryBreakdown>(data['data']);
    }
    if (dataClassName == 'DailySales') {
      return deserialize<_i3.DailySales>(data['data']);
    }
    if (dataClassName == 'ExpenseAnalytics') {
      return deserialize<_i4.ExpenseAnalytics>(data['data']);
    }
    if (dataClassName == 'ExpenseCategory') {
      return deserialize<_i5.ExpenseCategory>(data['data']);
    }
    if (dataClassName == 'ExpenseDataPoint') {
      return deserialize<_i6.ExpenseDataPoint>(data['data']);
    }
    if (dataClassName == 'SalesAnalytics') {
      return deserialize<_i7.SalesAnalytics>(data['data']);
    }
    if (dataClassName == 'SalesData') {
      return deserialize<_i8.SalesData>(data['data']);
    }
    if (dataClassName == 'SalesTrend') {
      return deserialize<_i9.SalesTrend>(data['data']);
    }
    if (dataClassName == 'TopProduct') {
      return deserialize<_i10.TopProduct>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i11.Category>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i12.Customer>(data['data']);
    }
    if (dataClassName == 'Expense') {
      return deserialize<_i13.Expense>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i14.Greeting>(data['data']);
    }
    if (dataClassName == 'InventoryOptimization') {
      return deserialize<_i15.InventoryOptimization>(data['data']);
    }
    if (dataClassName == 'Party') {
      return deserialize<_i16.Party>(data['data']);
    }
    if (dataClassName == 'PricingSuggestion') {
      return deserialize<_i17.PricingSuggestion>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i18.Product>(data['data']);
    }
    if (dataClassName == 'PurchaseOrder') {
      return deserialize<_i19.PurchaseOrder>(data['data']);
    }
    if (dataClassName == 'Sale') {
      return deserialize<_i20.Sale>(data['data']);
    }
    if (dataClassName == 'SaleItem') {
      return deserialize<_i21.SaleItem>(data['data']);
    }
    if (dataClassName == 'SalesPrediction') {
      return deserialize<_i22.SalesPrediction>(data['data']);
    }
    if (dataClassName == 'Supplier') {
      return deserialize<_i23.Supplier>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i24.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
