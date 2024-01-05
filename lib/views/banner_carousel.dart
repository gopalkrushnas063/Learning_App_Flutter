import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/model/banner.dart';
import 'package:learning_app/viewmodels/banner_viewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';

class CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}
// ... (previous imports and class definition remain unchanged)

class _CarouselViewState extends State<CarouselView> {
  late List<BannerModel> _banners = [];
  int _activeIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBanners();
  }

  Future<void> _loadBanners() async {
    try {
      final viewModel = BannerViewModel();
      final banners = await viewModel.getAllBanners();
      setState(() {
        _banners = banners;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? _buildShimmer()
        : _banners.isEmpty
            ? Container() // You can place a fallback widget or empty container here
            : Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: _banners.length,
                    itemBuilder: (context, index, realIndex) {
                      String imageURL = _banners[index].image;
                      return GestureDetector(
                        onTap: () async {
                          // String url = _banners[index].link;
                          // if (await canLaunch(url)) {
                          //   await launch(url);
                          // } else {
                          //   throw 'Could not launch $url';
                          // }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "$imageURL",
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Text('Failed to load image');
                            },
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.width <= 600 ? 158 : 450,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _activeIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildIndicator(),
                ],
              );
  }

  Widget _buildShimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: MediaQuery.of(context).size.width <= 600 ? 158 : 450,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // You can also render a shimmer effect for the indicator here if needed
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: _banners.length,
        effect: const ScaleEffect(
          dotWidth: 7,
          dotHeight: 7,
          activeDotColor: Colors.green,
        ),
      );
}
