import 'dart:async';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:ecommerce/screens/checkout.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  final List<Map<String, dynamic>> _banners = [
    {
      'title': '50-40% OFF',
      'subtitle1': 'Now in (product)',
      'subtitle2': 'All colours',
      'buttonText': 'Shop Now →',
      'gradient': [Color(0xFFFF6B9D), Color(0xFFFF8E9B)],
      'icon': Icons.shopping_bag,
    },
    {
      'title': '60% OFF',
      'subtitle1': 'Summer Collection',
      'subtitle2': 'Limited Time',
      'buttonText': 'Buy Now →',
      'gradient': [Color(0xFF4CAF50), Color(0xFF8BC34A)],
      'icon': Icons.local_offer,
    },
    {
      'title': 'MEGA SALE',
      'subtitle1': 'Fashion Week',
      'subtitle2': 'New Arrivals',
      'buttonText': 'Explore →',
      'gradient': [Color(0xFF2196F3), Color(0xFF03DAC6)],
      'icon': Icons.star,
    },
    {
      'title': 'FREE SHIPPING',
      'subtitle1': 'On orders above ₹999',
      'subtitle2': 'Nationwide delivery',
      'buttonText': 'Order Now →',
      'gradient': [Color(0xFF9C27B0), Color(0xFFE91E63)],
      'icon': Icons.local_shipping,
    },
    {
      'title': 'FREE SHIPPING',
      'subtitle1': 'On orders above ₹999',
      'subtitle2': 'Nationwide delivery',
      'buttonText': 'Order Now →',
      'gradient': [Color(0xFF9C27B0), Color(0xFFE91E63)],
      'icon': Icons.local_shipping,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.lightGrey,
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 20,
              color: AppColors.black,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        color: AppColors.almostWhite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPromotionalBanner(),
              _productDetails(),
              _goToCart(),
              _delivery(),
              _viewSimilar(),
              _buildFilterSection(),
              _productList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      height: 220,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _banners.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.cart1)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Page Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _banners.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index
                          ? AppColors.pinkishRed
                          : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Size: 7UK',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _sizeSquare('6 UK'),
                  _sizeSquare('7 UK'),
                  _sizeSquare('8 UK'),
                  _sizeSquare('9 UK'),
                  _sizeSquare('10 UK'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'Nike Sneakers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Vision Alta Men\'s Shoes Size (All Colours)',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: AppColors.yellow),
                  const Icon(Icons.star, size: 16, color: AppColors.yellow),
                  const Icon(Icons.star, size: 16, color: AppColors.yellow),
                  const Icon(Icons.star, size: 16, color: AppColors.yellow),
                  const Icon(
                    Icons.star_half,
                    size: 16,
                    color: AppColors.textfieldicon,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '56,890',
                    style: TextStyle(
                      color: AppColors.textfieldicon,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "₹2,999",
                    style: TextStyle(
                      color: AppColors.textfieldicon,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "₹1,500",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "50% Off",
                    style: const TextStyle(
                      color: AppColors.coralPink,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "Product Details",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Perhaps the most iconic sneaker of all-time, this original \"Chicago\"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More",
                style: const TextStyle(fontSize: 13),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(width: 2, color: AppColors.mediumGray),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.location_pin,
                            size: 10,
                            color: AppColors.mediumGray,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Nearest Store",
                          style: TextStyle(
                            color: AppColors.mediumGray,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 6),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(width: 2, color: AppColors.mediumGray),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.lock,
                            size: 10,
                            color: AppColors.mediumGray,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "VIP",
                          style: TextStyle(
                            color: AppColors.mediumGray,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 6),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(width: 2, color: AppColors.mediumGray),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.autorenew_rounded,
                            size: 10,
                            color: AppColors.mediumGray,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Return policy",
                          style: TextStyle(
                            color: AppColors.mediumGray,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _sizeSquare(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 8),
      child: Container(
        height: 32,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: AppColors.coralPink),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: AppColors.coralPink, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _goToCart() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckOutScreen(),
              ), // Replace with your target screen
            );
          },
          child: Container(
            height: 40,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Main container
                Container(
                  height: 36,
                  margin: const EdgeInsets.only(left: 40),
                  padding: const EdgeInsets.only(right: 12, left: 24),
                  decoration: BoxDecoration(
                    gradient: AppColors.blueGradient,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Go to cart",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),

                // Circle with icon
                Positioned(
                  left: 20,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.blueGradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 44, // Ensures full visibility of the circle (40) + padding
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Main container
              Container(
                height: 36, // Slightly shorter than the circle
                margin: const EdgeInsets.only(left: 40), // space for the circle
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  right: 12,
                  left: 24,
                ),
                decoration: BoxDecoration(
                  gradient: AppColors.greenGradient,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              // Circular icon with shadow
              Positioned(
                left: 20,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.greenGradient,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.touch_app, size: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _delivery() {
    return Padding(
      padding: EdgeInsets.only(left: 14, right: 14, top: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightBlushPink,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 11),
              Text("Delivery in", style: TextStyle(fontSize: 14)),
              SizedBox(height: 6),
              Text(
                "1 within Hour",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              SizedBox(height: 11),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewSimilar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 0.5, color: AppColors.lightGrey),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 4),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 12),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.darkCharcoal,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "View Similar",
                    style: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 0.5, color: AppColors.lightGrey),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 4),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 12),
                    child: Icon(
                      Icons.library_add,
                      color: AppColors.darkCharcoal,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Add to Compare",
                    style: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar To',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '282+ Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Sort',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.swap_vert,
                          size: 16,
                          color: AppColors.darkCharcoal,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.filter_alt_outlined,
                          size: 16,
                          color: AppColors.darkCharcoal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productList() {
    final products = [
      {
        'title': 'Nike Sneakers',
        'description': 'Nike Air Jordan Retro 1 Low Mystic Black',
        'price': '₹1,900',
        'rating': 4.0,
        'reviews': 46890,
        'image': AppImages.cart2,
      },
      {
        'title': 'Nike Sneakers',
        'description': 'Mid Peach Mocha Shoes For Man White Black Pink S...',
        'price': '₹1,900',
        'rating': 4.2,
        'reviews': 256890,
        'image': AppImages.cart3,
      },
    ];

    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 270,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return _buildProductCard(
                p['image'] as String,
                p['title'] as String,
                p['description'] as String,
                p['price'] as String,
                p['rating'] as double,
                p['reviews'] as int,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(
    String image,
    String title,
    String description,
    String price,
    double rating,
    int reviews,
  ) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: AppColors.textfieldicon),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
                bottom: Radius.circular(8),
              ),
              child: Image.asset(
                image, // 🔁 Replace with your asset path
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: AppColors.black, fontSize: 10),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.yellow,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.yellow,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.yellow,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.yellow,
                        ),
                        const Icon(
                          Icons.star_half,
                          size: 12,
                          color: AppColors.textfieldicon,
                        ),

                        Text(
                          '($reviews)',
                          style: TextStyle(
                            color: AppColors.textfieldicon,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
