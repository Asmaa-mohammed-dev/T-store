import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utilit.dart';
import 'package:t_store/utils/popups/loaders.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();
  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    
    super.onInit();
    initFavorites();
  }
  // Method to initialize favorites by reading from storage
  Future<void> initFavorites() async{
    final json = TLocalStorage.instance().readData('favorites');
      print("Local Storage JSON: $json");  // <-- هنا

    if(json != null){
      final storedFavorites = jsonDecode(json) as Map<String,dynamic>;
      favorites.assignAll(storedFavorites.map((key,value) => MapEntry(key,value as bool)));
    }
  }
  bool isFavourite(String productId){
    return favorites[productId] ?? false;
  }
  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the wishlist');
          print("Added $productId to favorites");
    }else{
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
            TLoaders.customToast(message: 'Product has been removed from the whislist');
                print("Added $productId to favorites");
// favorites.remove(productId);
// saveFavoritesToStorage();
// TLoaders.customToast(message: 'Product has been removed from the wishlist');

    }
  }
  void saveFavoritesToStorage(){
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
      print("Favorites saved: $encodedFavorites"); 
  }

  Future<List<ProductModel>> favoriteProducts()async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}