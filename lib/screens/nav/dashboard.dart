import 'package:flutter/material.dart';
import 'package:keva/helpers/index.dart';
import 'package:keva/http_request/products.dart';
import 'package:keva/models/categories.dart';
import 'package:keva/models/products.dart';
import 'package:keva/screens/products/product.dart';
import 'package:keva/utils/index.dart';
import 'package:keva/constants/index.dart';
import 'package:shimmer/shimmer.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _played = false;

  late Future<List<ProductsModel>> _productsFuture;
  late Future<List<Categories>> _categoryFuture;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    if (!_played) {
      _controller.forward();
      _played = true;
    }

    _productsFuture = Products().getAllProducts();
    _categoryFuture = Products().getAllCategories();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass(context).dashboard(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top hero image section
                vertical(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _animation,
                      child: TextClass("Find Your").header3(size: 40),
                    ),
                    ScaleTransition(
                      scale: _animation,
                      child: TextClass("Favourite Items")
                          .header3(size: 40, color: appColor),
                    )
                  ],
                ),
                // title section

                vertical(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextClass("Categories").header3(size: 18),
                    GestureDetector(
                      child: TextClass("More").header0(appColor),
                    )
                  ],
                ),
                // category select button

                vertical(10),

                // FutureBuilder<List<Product>>(
                //   future: _productsFuture,
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return Center(child: Text('No data available'));
                //     } else if (snapshot.hasError) {
                //       return Center(child: Text('Error: ${snapshot.error}'));
                //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //       return Center(child: Text('No data available'));
                //     } else {
                //       return Center(child: Text('No data available'));
                //     }
                //   },
                // ),

                FutureBuilder(
                  future: _categoryFuture,
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      // Shimmer effect while loading
                      return DynamicHeightGridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (context, i) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              vertical(5),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * 0.2,
                              //   height: 10,
                              //   color: Colors.white,
                              // ),
                            ],
                          ),
                        ),
                        itemCount: 8,
                        crossAxisCount: 4,
                        mainAxisSpacing: 1,
                      );
                    } else if (snap.hasError) {
                      return Center(child: Text('Error: ${snap.error}'));
                    } else if (!snap.hasData || snap.data!.isEmpty) {
                      return const Center(
                        child: Text('No categories available.'),
                      );
                    }

                    return DynamicHeightGridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      builder: (context, i) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                color: appColor.withOpacity(0.1),
                              ),
                              child: FadeInImage.assetNetwork(
                                placeholder: placeholder,
                                image: snap.data![i].image!,
                                fit: BoxFit.cover,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                              ),
                            ),
                          ),
                          TextClass(snap.data![i].name ?? 'Unknown')
                              .header6(size: 10),
                        ],
                      ),
                      itemCount: snap.data!.length > 8 ? 8 : snap.data!.length,
                      crossAxisCount: 4,
                      mainAxisSpacing: 1,
                    );
                  },
                ),

                vertical(10),

                Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: appColor.withOpacity(0.1),
                    // borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images-static.nykaa.com/uploads/28cfd1cc-2232-46f4-8abd-715708195344.gif"),
                        fit: BoxFit.cover),
                  ),
                ),

                vertical(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextClass("Recent Products").header3(size: 18),
                    GestureDetector(
                      child: TextClass("More").header0(appColor),
                    )
                  ],
                ),

                vertical(10),

                FutureBuilder(
                  future: _productsFuture,
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      // Shimmer effect while loading
                      return DynamicHeightGridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (context, i) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              vertical(5),
                            ],
                          ),
                        ),
                        itemCount: 9,
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                      );
                    } else if (snap.hasError) {
                      return Center(child: Text('Error: ${snap.error}'));
                    } else if (!snap.hasData || snap.data!.isEmpty) {
                      return const Center(
                        child: Text('No categories available.'),
                      );
                    }

                    return DynamicHeightGridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      builder: (context, i) => GestureDetector(
                        onTap: () => pushPage(context,
                            ProductDetailPage(productID: snap.data![i].id!)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.1),
                                ),
                                child: FadeInImage.assetNetwork(
                                  placeholder: placeholder,
                                  image: snap.data![i].images![0],
                                  fit: BoxFit.cover,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                              ),
                            ),
                            TextClass(snap.data![i].title!).header6(size: 10),
                            vertical(5),
                            TextClass('£${snap.data![i].price!.toString()}')
                                .header6(size: 13),
                          ],
                        ),
                      ),
                      itemCount: snap.data!.length > 9 ? 9 : snap.data!.length,
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
