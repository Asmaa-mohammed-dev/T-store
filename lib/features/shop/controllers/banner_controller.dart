import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  //Varaibles
  final isLoading = false.obs;

  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //Update Page Navigational Dits
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //Fetch Banners
  //Load category data
  Future<void> fetchBanners() async {
    try {
      //Show loader while loading categories
      print("Banner...");
      isLoading.value = true;
      //Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      //Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      print("Error fetching categories: $e");
      TLoaders.errorSnackBar(
          title: 'Something wrong happen', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }
}
