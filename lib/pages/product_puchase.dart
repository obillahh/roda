import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/product_detail/product_detail_bloc.dart';
import 'payment_gateway_page.dart';

class ProductPurchasePage extends StatelessWidget {
  final String id;
  const ProductPurchasePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Purchase'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  builder: (context, state) {
                    if (state is ProductDetailSuccess) {
                      return Row(
                        children: [
                          Image.network(
                            state.product.images![0].image!,
                            width: 120.w,
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.product.brand!.name!,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.product.name!,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                state.product.description!,
                              )
                            ],
                          )
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Information',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name',
                            ),
                            Text(
                              'Jason Statham',
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                            ),
                            Text(
                              'T9mUe@example.com',
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                            ),
                            Text(
                              '+62 812 3456 7890',
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                            ),
                            Text(
                              'Male',
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                            ),
                            Text(
                              'Indonesia, Jakarta',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
                  if (state is ProductDetailSuccess) {
                    return SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 18.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Price :'),
                                  Text(
                                    state.product.price.toString(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Discount :'),
                                  Text(state.product.discount.toString()),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Max Discount :'),
                                  Text(state.product.maxDiscount.toString()),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Final Discount :'),
                                  Text(state.product.finalDiscount.toString()),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Final Price :'),
                                  Text(state.product.finalPrice.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
                  if (state is ProductDetailSuccess) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${state.product.finalPrice.toString()}',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<ProductDetailBloc>().add(
                                      GetProductDetail(id: state.product.id!),
                                    );
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PaymentGatewayPage(
                                    id: state.product.id!,
                                  );
                                }));
                              },
                              child: const Text(
                                'Buy it!',
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
