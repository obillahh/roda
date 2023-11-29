import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_detail_response_model.dart';
import '../../data/repository/product_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository productRepository;
  ProductDetailBloc(this.productRepository) : super(ProductDetailInitial()) {
    on<ProductDetailEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetProductDetail) {
          emit(ProductDetailInitial());
          final dataProductDetail =
              await productRepository.getProductDetail(event.id);
          emit(
            ProductDetailSuccess(product: dataProductDetail),
          );
        }
    });
  }
}
