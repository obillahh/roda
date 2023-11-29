part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoading extends ProductDetailState {}

final class ProductDetailSuccess extends ProductDetailState {
  final ProductDetailData product;

  ProductDetailSuccess({required this.product});
}

final class ProductDetailFail extends ProductDetailState {
  final String message;

  ProductDetailFail({required this.message});
}