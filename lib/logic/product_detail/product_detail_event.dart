part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class GetProductDetail extends ProductDetailEvent {
  final String id;
  GetProductDetail({required this.id});
}
