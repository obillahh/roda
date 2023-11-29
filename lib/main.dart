import 'package:flutter/material.dart';
import 'package:setor_app/data/repository/product_repository.dart';
import 'package:setor_app/logic/product/product_bloc.dart';
import 'package:setor_app/pages/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logic/product_detail/product_detail_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(ProductRepository())..add(GetProduct()),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (context) => ProductDetailBloc(ProductRepository()),
        )
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          home: const ProductPage(),
        ),
      ),
    );
  }
}
