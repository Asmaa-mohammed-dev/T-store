import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.colors.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      //Show loader while loading Products
      isLoading.value = true;
      //Fetch Products
      final products = await productRepository.getFeaturedProducts();
      //Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Something went wrong!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //
  // String getProductPrice(ProductModel product) {
  //   double smallestPrice = double.infinity;
  //   double largestPrice = 0.0;

  //   //If no variation exist, return the simple price or sale price
  //   if (product.productType == ProductType.single.toString()) {
  //     return (product.salePrice > 0 ? product.salePrice : product.price)
  //         .toString();
  //   } else {
  //     //calculate the smallest and largest prices among variations
  //     for (var variation in product.productVariations!) {
  //       //Determine the price to consider (sale price if available, otherwise regular price)
  //       double priceToConsider =
  //           variation.salePrice > 0.0 ? variation.salePrice : variation.price;
  //       //Update smallest and largest prices
  //       if (priceToConsider < smallestPrice) {
  //         smallestPrice = priceToConsider;
  //       }
  //       if (priceToConsider > largestPrice) {
  //         largestPrice = priceToConsider;
  //       }
  //     }
  //     //Id smallest and largest prices are the same, return a single price
  //     if (smallestPrice.isEqual(largestPrice)) {
  //       return largestPrice.toString();
  //     } else {
  //       //Otherwise, return a price range
  //       return '$smallestPrice -\$$largestPrice';
  //     }
  //   }
  // }
  String getProductPrice(ProductModel product) {
    double? smallestPrice;
    double? largestPrice;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    }

    // Ensure variations are not null or empty
    if (product.productVariations == null ||
        product.productVariations!.isEmpty) {
      return product.price.toString();
    }

    for (var variation in product.productVariations!) {
      double priceToConsider =
          variation.salePrice > 0.0 ? variation.salePrice : variation.price;

      // Skip variations with invalid prices
      if (priceToConsider <= 0) continue;

      smallestPrice ??= priceToConsider;
      largestPrice ??= priceToConsider;

      if (priceToConsider < smallestPrice) {
        smallestPrice = priceToConsider;
      }
      if (priceToConsider > largestPrice) {
        largestPrice = priceToConsider;
      }
    }

    if (smallestPrice == null || largestPrice == null) {
      return product.price.toString(); // fallback to default price
    }

    if (smallestPrice == largestPrice) {
      return smallestPrice.toString();
    } else {
      return '\$${smallestPrice.toStringAsFixed(2)} - \$${largestPrice.toStringAsFixed(2)}';
    }
  }

  //Calculate Discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  //check Product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : '';
  }
}
