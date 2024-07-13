import 'package:flutter/material.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/helpers/index.dart';
import 'package:keva/http_request/products.dart';
import 'package:keva/models/products.dart';
import 'package:keva/utils/index.dart';
// import 'package:shimmer/shimmer.dart';

class ProductDetailPage extends StatefulWidget {
  final int productID;

  const ProductDetailPage({Key? key, required this.productID})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Future<ProductsModel> _productFuture;
  final PageController _pageController = PageController();

  bool isFavorite = false;

  @override
  void initState() {
    ToastContext().init(context);
    _productFuture = Products().getProduct(widget.productID);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarClass(context, apptitle: 'Products').innerpage(),
        body: FutureBuilder(
            future: _productFuture,
            builder: (context, snap) {
              if (snap.hasData) {
                return Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildImageCarousel(snap),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: padding21),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image carousel

                                const SizedBox(height: 16.0),
                                // Product name
                                TextClass(
                                  snap.data!.title!,
                                ).header3(size: 20),
                                const SizedBox(height: 8.0),
                                // Price
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextClass('£${snap.data!.price}')
                                        .header1(15),
                                    GestureDetector(
                                      onTap: () {
                                        // make a request to add this item to favourite
                                        toast(isFavorite
                                            ? "${snap.data!.title} removed from favorite"
                                            : "${snap.data!.title} add to favorite");
                                        setState(() {
                                          isFavorite = !isFavorite;
                                        });
                                      },
                                      child: Icon(
                                          !isFavorite
                                              ? Icons.favorite_border_outlined
                                              : Icons.favorite,
                                          color: appColor),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                // Description
                                TextClass(snap.data!.description!)
                                    .header3(size: 12),
                                const SizedBox(height: 16.0),
                                // Feedback
                                TextClass('Feedback').header1(14),
                                const SizedBox(height: 8.0),
                                _buildFeedbackList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(padding21),
                      child: ButtonClass(() {
                        // make a request to add item to cart
                        toast("${snap.data!.title} added to cart");
                      }, "Add to Cart"),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: appColor,
                  ),
                );
              }
            }));
  }

  Widget _buildImageCarousel(AsyncSnapshot<ProductsModel> product) {
    return Stack(
      children: [
        SizedBox(
          height: 300.0,
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            itemCount: product.data!.images!.length,
            itemBuilder: (context, index) {
              return FadeInImage.assetNetwork(
                placeholder: placeholder,
                image: product.data!.images![index],
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(placeholder, fit: BoxFit.cover);
                },
              );
            },
          ),
        ),
        Positioned(
          left: 10,
          top: 135,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
        ),
        Positioned(
          right: 10,
          top: 135,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: product.data!.images!.length,
              effect: const WormEffect(
                  dotHeight: 10, dotWidth: 10, activeDotColor: appColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackList() {
    if (true) {
      return Text('No feedback available.');
    }
    // return ListView.builder(
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: product.feedback.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       leading: Icon(Icons.comment),
    //       title: Text(product.feedback[index]),
    //     );
    //   },
    // );
  }
}
