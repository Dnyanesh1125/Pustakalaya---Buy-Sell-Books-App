import 'package:pustakalaya/models/SingleProductModel.dart';
// import 'package:cheap_charly/models/categoryProductModel.dart';
import 'package:pustakalaya/routes/routes.dart';
// import 'package:cheap_charly/screens/category/sub_category.dart';
// import 'package:pustakalaya/screens/detailscreen/detail_screen.dart';
import 'package:pustakalaya/widgets/singleProduct_widget.dart';
import 'package:flutter/material.dart';

class TabBarBar extends StatelessWidget {
  late final List<SingleProductModel> productData;
  // final List<CategoryProductModel> categoryProductData;
  // TabBarBar({required this.productData, this.categoryProductData});
  TabBarBar({required this.productData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: productData.length,
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        var data = productData[index];
        return SingleProductWidget(
          onPressed: () {
            // PageRouting.goToNextPage(
            //   context: context,
            //   navigateTo: DetailScreen(data: data),
            // );
          },
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
          productOldPrice: data.productOldPrice,
          productPrice: data.productPrice,
        );
      },
    );
  }
}
