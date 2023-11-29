import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_detail_response_model.dart';
import '../../data/models/product_response_model.dart';
import '../../data/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<ProductEvent>(
      (event, emit) async {
        // TODO: implement event handler
        if (event is GetProduct) {
          emit(ProductLoading());
          final dataProduct = await productRepository.getProduct();
          emit(
            ProductSuccess(products: dataProduct),
          );
        }
      },
    );
  }
}
