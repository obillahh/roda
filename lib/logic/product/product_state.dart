part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductData> products;

  ProductSuccess({required this.products});
}

final class ProductFail extends ProductState {
  final String message;

  ProductFail({required this.message});
}


