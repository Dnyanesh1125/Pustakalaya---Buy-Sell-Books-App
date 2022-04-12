// ignore_for_file: prefer_const_constructors, unused_import

// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:pustakalaya/appColors/app_colors.dart';
import 'package:pustakalaya/data/home-page-data.dart';
// import 'package:pustakalaya/data/home-page-data.dart';
import 'package:pustakalaya/models/SingleProductModel.dart';
import 'package:pustakalaya/routes/routes.dart';
// import 'package:pustakalaya/screens/detailscreen/detail_screen.dart';
// import 'package:pustakalaya/screens/filtter/filterScreen.dart';
import 'package:pustakalaya/screens/tabbar_data.dart';
import 'package:pustakalaya/stylies/home_screen_stylies.dart';
import 'package:pustakalaya/svgimages/svg_images.dart';
import 'package:pustakalaya/widgets/show_all_widget.dart';
import 'package:pustakalaya/widgets/singleProduct_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  late SingleProductModel singleProductModel;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          Tab(child: Text("All")),
          Tab(child: Text("Self Help")),
          Tab(child: Text("Autobiography")),
          Tab(child: Text("Startup")),
          // Tab(text:"Self Help"),
          // Tab(text:"Autobiography"),
          // Tab(text: "Startup"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            "PUSTAKALAYA",
            style: HomeScreenStylies.appBarUpperTitleStylies,
          ),
          Center(
            child: Text(
              "It's Time To Read!!!",
              style: HomeScreenStylies.appBarBottomTitleStylies,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: RotationTransition(
            turns: AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
              width: 30,
            ),
          ),
          onPressed: () {
            //   PageRouting.goToNextPage(
            //     context: context,
            //     navigateTo: FilterScreen(),
            //   );
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildAdvertismentPlace() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Container(
        height: 170,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(microseconds: 1000),
          showIndicator: false,
          images: [
            Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://blog.creatopy.com/wp-content/uploads/2019/03/creative-advertising-and-pop-culture-pop-culture-ads.png"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://blog.creatopy.com/wp-content/uploads/2018/05/advertisement-ideas-inspiration-advertising.png",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrendingProduct({
    required String productImage,
    required String productName,
    required String productModel,
    required double productPrice,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
      height: 65,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStylies.trendingProductNameStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    productModel,
                    style: HomeScreenStylies.trendingProductModelStyle,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: MaterialButton(
              color: AppColors.baseLightPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(0.7),
              ),
              onPressed: () {},
              child: Text(
                "\$ $productPrice",
                style: HomeScreenStylies.trendingProductPriceStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildAdvertismentPlace(),
                ShowAllWidget(
                  leftText: "New Arrival",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: singleProductData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      var arrivalDataStore = singleProductData[index];

                      return SingleProductWidget(
                        productImage: arrivalDataStore.productImage,
                        productModel: arrivalDataStore.productModel,
                        productName: arrivalDataStore.productName,
                        productOldPrice: arrivalDataStore.productOldPrice,
                        productPrice: arrivalDataStore.productPrice,
                        onPressed: () {
                          //   PageRouting.goToNextPage(
                          //     context: context,
                          //     navigateTo: DetailScreen(
                          //       data: arrivalDataStore,
                          //     )
                          //   );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                ShowAllWidget(
                  leftText: "What\'s trending",
                ),
                buildTrendingProduct(
                  productImage:
                      'https://images3.penguinrandomhouse.com/cover/9780735211292',
                  productModel: 'Personality',
                  productName: 'Atomic Habits',
                  productPrice: 27,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://images2.penguinrandomhouse.com/cover/9780385547932',
                  productModel: 'Fiction',
                  productName: 'To Paradise',
                  productPrice: 32,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://images3.penguinrandomhouse.com/cover/9780525559474',
                  productModel: 'Fiction',
                  productName: 'The Midnight Library',
                  productPrice: 26,
                ),
                ShowAllWidget(
                  leftText: "Your History",
                ),
                Container(
                  height: 260,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    itemCount: autobiographyData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      var historyDataStore = autobiographyData[index];

                      return SingleProductWidget(
                          onPressed: () {
                            // PageRouting.goToNextPage(
                            //   context: context,
                            //   navigateTo: DetailScreen(
                            //     data: historyDataStore,
                            //   ),
                            // );
                          },
                          productImage: historyDataStore.productImage,
                          productModel: historyDataStore.productModel,
                          productName: historyDataStore.productName,
                          productOldPrice: historyDataStore.productOldPrice,
                          productPrice: historyDataStore.productPrice);
                    },
                  ),
                ),
              ],
            ),
            // Center(
            //   child: Text('hello'),
            // ),
            // Center(
            //   child: Text('hello'),
            // ),
            // Center(
            //   child: Text('hello'),
            // ),
            TabBarBar(
              productData: selfhelpData,
            ),
            TabBarBar(
              productData: autobiographyData,
            ),
            TabBarBar(
              productData: startupData,
            ),
          ],
        ),
      ),
    );
  }
}
