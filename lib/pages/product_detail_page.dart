import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setor_app/pages/product_puchase.dart';
import '../logic/product_detail/product_detail_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;
  const ProductDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200.h,
                    child: Image.network(
                      state.product.images![0].image!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'No IMG',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              state.product.brand!.logo!,
                              width: 40.w,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              state.product.brand!.name!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          state.product.name!,
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.product.description!,
                        ),
                        const Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Specs :',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Text(
                                  'Diameter: ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                state.product.spec!.diameter != null
                                    ? Text(
                                        state.product.spec!.diameter!
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text('0'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Weight: ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                state.product.spec!.weight != null
                                    ? Text(
                                        state.product.spec!.weight!.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text('0'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Width: ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                state.product.spec!.width != null
                                    ? Text(
                                        state.product.spec!.width!.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text('0'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Speed Rating: ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                state.product.spec!.speedRating != null
                                    ? Text(
                                        state.product.spec!.speedRating!,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text('0'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Profile: ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                state.product.spec!.profile != null
                                    ? Text(
                                        state.product.spec!.profile!.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text('0'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailSuccess) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.r,
                    offset: const Offset(0.0, 1.0),
                  )
                ],
              ),
              height: 80.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp${state.product.price!.toString()}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('stocks: ${state.product.stocks.toString()}'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProductDetailBloc>().add(
                              GetProductDetail(id: state.product.id!),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPurchasePage(
                              id: state.product.id!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 0),
                        fixedSize: const Size(double.infinity, 40),
                      ),
                      child: const Text('Buy'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
