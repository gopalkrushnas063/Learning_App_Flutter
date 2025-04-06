import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/viewmodels/banner_viewmodel.dart';
import 'package:learning_app/services/banner_services.dart';

final bannerControllerProvider = StateNotifierProvider<BannerController, BannerViewModel>((ref) {
  return BannerController();
});

class BannerController extends StateNotifier<BannerViewModel> {
  BannerController() : super(BannerViewModel());

  Future<void> fetchBanners() async {
    state = BannerViewModel(state: BannerState.loading);
    try {
      final banners = await BannerService.getAllBanners();
      state = BannerViewModel(
        state: BannerState.success,
        banners: banners,
      );
    } catch (e) {
      state = BannerViewModel(
        state: BannerState.error,
        error: e.toString(),
      );
    }
  }
}