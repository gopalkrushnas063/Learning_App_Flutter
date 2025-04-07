import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/controllers/banner.controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';

class CarouselView extends ConsumerStatefulWidget {
  @override
  ConsumerState<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends ConsumerState<CarouselView> {
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bannerControllerProvider.notifier).fetchBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bannerState = ref.watch(bannerControllerProvider);

    return bannerState.state == BannerState.loading
        ? _buildShimmer()
        : bannerState.state == BannerState.error
            ? _buildError(bannerState.error)
            : bannerState.banners.isEmpty
                ? Container()
                : Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: bannerState.banners.length,
                        itemBuilder: (context, index, realIndex) {
                          final banner = bannerState.banners[index];
                          return GestureDetector(
                            onTap: () {
                              // Handle banner tap
                              // if (banner.url.startsWith('/')) {
                              //   Navigator.pushNamed(context, banner.url);
                              // } else {
                              //   launchUrl(Uri.parse(banner.url));
                              // }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                banner.bannerImage,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Text(
                                        banner.title,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.width <= 600
                              ? 158
                              : 450,
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
                      buildIndicator(bannerState.banners.length),
                    ],
                  );
  }

  Widget _buildShimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.width <= 600 ? 158 : 450,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildError(String? error) {
    return Container(
      height: MediaQuery.of(context).size.width <= 600 ? 158 : 450,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          error ?? 'Failed to load banners',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: count,
        effect: const ScaleEffect(
          dotWidth: 7,
          dotHeight: 7,
          activeDotColor: Colors.green,
        ),
      );
}
