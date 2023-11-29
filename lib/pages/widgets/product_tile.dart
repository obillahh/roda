import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setor_app/data/models/product_response_model.dart';
import 'package:setor_app/pages/product_detail_page.dart';
import '../../logic/product_detail/product_detail_bloc.dart';

class ProductTile extends StatelessWidget {
  final ProductData product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProductDetailBloc>().add(
              GetProductDetail(id: product.id),
            );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              id: product.id,
            ),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: ClipRRect(
          child: Card(
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                    width: 120.w,
                    height: 120.h,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'No IMG',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(product.brand.name),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                          ),
                          Text(product.rating.toString()),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Rp${product.price}',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
