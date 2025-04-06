import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/models/banner.dart';

class BannerViewModel {
  final List<BannerModel> banners;
  final BannerState state;
  final String? error;

  BannerViewModel({
    this.banners = const [],
    this.state = BannerState.initial,
    this.error,
  });
}