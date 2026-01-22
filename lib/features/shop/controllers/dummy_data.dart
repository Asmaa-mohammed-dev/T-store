import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/routes/routes.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  //Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: TImages.promBanner1,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.promBanner2,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promBanner3,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promBanner3,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
  ];

  //User
  // static final UserModel user = UserModel(
  //   firstName: 'Coding',
  //   lastName: 'with Asmaa',
  //   email: 'ajyalacademy99@gmail.com',
  //   phoneNumber: '+01212883756',
  //   profilePicture: TImages.user,
  //   addresses: [
  //     AddressModel(
  //         id: '1',
  //         name: 'Coding with A',
  //         phoneNumber: '+201212883756',
  //         street: 'Abu-Musa',
  //         city: 'New Cairo',
  //         state: 'Egypt',
  //         postalCode: '832423',
  //         country: 'Egypt'),
  //     AddressModel(
  //         id: '6',
  //         name: 'AnyThing',
  //         phoneNumber: '+201212883756',
  //         street: 'Abu-Musa',
  //         city: 'New Cairo',
  //         state: 'Egypt',
  //         postalCode: '1212121',
  //         country: 'Egypt'),
  //   ],
  // );

  // //Cart
  // static final CartModel user = CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //     CartItemModel(
  //       productId: '002',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //   ],
  // );
  // //Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CWT001',
  //     status: OrderStatus.processing,
  //     item: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2025, 17, 6),
  //     deliveryDate: DateTime(2025, 23, 6),
  //   ),
  //   OrderModel(
  //     id: 'CWT002',
  //     status: OrderStatus.processing,
  //     item: cart.items,
  //     totalAmount: 396,
  //     orderDate: DateTime(2025, 17, 6),
  //     deliveryDate: DateTime(2025, 23, 6),
  //   ),
  // ];

  //List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: TImages.shoeIcon,
      name: 'لحوم',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: TImages.honeyIcon,
      name: 'دجاج',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: TImages.sportIcon,
      name: 'أسماك',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: TImages.sportIcon,
      name: 'خضار',
      isFeatured: true,
    ),
    // CategoryModel(
    //   id: '5',
    //   image: TImages.sportIcon,
    //   name: 'فاكهة',
    //   isFeatured: true,
    // ),
    // CategoryModel(
    //   id: '6',
    //   image: TImages.sportIcon,
    //   name: 'فاكهة',
    //   isFeatured: true,
    // ),
    // CategoryModel(
    //   id: '7',
    //   image: TImages.sportIcon,
    //   name: 'فاكهة',
    //   isFeatured: true,
    // ),
    //subcategories
    // subcategories
CategoryModel(
  id: '10',
  image: TImages.sportIcon,
  name: 'فاكهة صغيرة',
  parentId: '1', // لحوم
  isFeatured: false,
),
CategoryModel(
  id: '11',
  image: TImages.sportIcon,
  name: 'فاكهة صغيرة',
  parentId: '2', // دجاج
  isFeatured: false,
),
CategoryModel(
  id: '12',
  image: TImages.sportIcon,
  name: 'فاكهة صغيرة',
  parentId: '3', // أسماك
  isFeatured: false,
),

    // CategoryModel(
    //   id: '5',
    //   image: TImages.sportIcon,
    //   name: 'فاكهة',
    //   parentId: '10',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '6',
    //   image: TImages.sportIcon,
    //   name: 'فاكهة',
    //   parentId: '11',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '7',
    //   image: TImages.sportIcon,
    //   name: 'فاكهة',
    //   parentId: '12',
    //   isFeatured: false,
    // ),
  ];

  //List of all brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.fruitIcon,
        name: 'Fruit',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.fruitIcon,
        name: 'Fruit',
        productsCount: 95,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: TImages.fruitIcon,
        name: 'Fruit',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.fruitIcon,
        name: 'Fruit',
        productsCount: 265,
        isFeatured: true),
  ];
  // //List of all Brands Categories
  // static final List<BrandCategoryModel> brandCategory = [
  //   BrandCategoryModel(brandId: '1', categoryId: '1'),
  //   BrandCategoryModel(brandId: '1', categoryId: '8'),
  //   BrandCategoryModel(brandId: '1', categoryId: '9'),
  //   BrandCategoryModel(brandId: '2', categoryId: '1'),
  // ];
  // //list of product categories
  // static final List<ProductCategoryModel> productCategories = [
  //   ProductCategoryModel(productId: '001', categoryId: '1'),
  //   ProductCategoryModel(productId: '001', categoryId: '8'),
  //   ProductCategoryModel(productId: '004', categoryId: '3'),
  // ];

  //List of all products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Kids Jilbab. Iron Gray',
      stock: 15,
      price: 110,
      isFeatured: true,
      thumbnail: 'https://picsum.photos/200',
      description: 'Kids Jilbab. Iron Gray',
      brand: BrandModel(
        id: '1',
        image: 'assets/icons/categories/1.png',
        name: 'jilbab',
        productsCount: 265,
        isFeatured: true,
      ),
      images: ['https://picsum.photos/200', 'https://picsum.photos/200'],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['red', 'green', 'black']),
        ProductAttributeModel(
          name: 'Size',
          values: ['Large', 'Medium', 'Small'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: 'https://picsum.photos/200',
          description:
              "Kids' Jilbab in Iron Gray – a modest and comfortable outfit designed for children",
          attributeValues: {'Color': 'red', 'Size': 'Small'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 1,
          price: 134,
          salePrice: 122.6,
          image: 'https://picsum.photos/200',
          description:
              "Kids' Jilbab in Iron Gray – a modest and comfortable outfit designed for children",
          attributeValues: {'Color': 'black', 'Size': 'Medium'},
        ),
      ],
      productType: 'ProductType.variable',
      // productType: ProductType.variable.toString(),
    ),
  // 👇 المنتج الثاني
  ProductModel(
    id: '002',
    title: 'Kids Abaya. Navy Blue',
    stock: 20,
    price: 150,
    isFeatured: true,
    thumbnail: 'https://picsum.photos/201',
    description: 'Elegant Kids Abaya in Navy Blue',
    brand: BrandModel(
      id: '2',
      image: 'assets/icons/categories/23.png',
      name: 'abaya',
      productsCount: 180,
      isFeatured: false,
    ),
    images: ['https://picsum.photos/201', 'https://picsum.photos/202'],
    salePrice: 120,
    sku: 'XYZ789',
    categoryId: '2',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['blue', 'red']),
      ProductAttributeModel(name: 'Size', values: ['Small', 'Medium']),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 10,
        price: 150,
        salePrice: 120,
        image: 'https://picsum.photos/201',
        description: "Elegant Kids Abaya in Navy Blue – perfect for special occasions",
        attributeValues: {'Color': 'blue', 'Size': 'Medium'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
];  
    
    

  
}
