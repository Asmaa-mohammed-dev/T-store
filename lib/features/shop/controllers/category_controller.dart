import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/categories/category_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //Load category data
  Future<void> fetchCategories() async {
    try {
      //Show loader while loading categories
      print("Fetching categories...");
      isLoading.value = true;

      //Fetch categories from data source (FireStore, API, etc)
      final categories = await _categoryRepository.getAllCategories();
      print("Fetched categories: ${categories.length}");
      print("Data from Firestore: $categories");
      //Update the categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
      print("Featured categories: ${featuredCategories.length}");
    } catch (e) {
      print("Error fetching categories: $e");
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }
  //load selected category data

  //Get Category or sub-category Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4})async{
   // Fetch Limited (4) products against each subCategory;
   final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
   return products; 
  }
}
