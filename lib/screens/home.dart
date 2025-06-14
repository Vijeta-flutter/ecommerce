import 'dart:async';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  // Banner data
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
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              _buildHeader(),

              // Search Bar
              _buildSearchBar(),

              // Filter Section
              _buildFilterSection(),

              // Category Section
              _buildCategorySection(),

              // Promotional Banner
              _buildPromotionalBanner(),

              // Deal of the Day
              _buildDealOfTheDay(),

              _productList(),

              // // Product Grid
              // _buildProductGrid(),

              // Special Offers
              _buildSpecialOffers(),

              // Flat and Heels Section
              _buildFlatAndHeels(),

              _buildTrending(),

              // Trending Products
              _buildTrendingProducts(),

              // Hot Summer Sale
              _buildHotSummerSale(),

              SizedBox(height: 16),
              // Sponsored Section
              _buildSponsoredSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, size: 24),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  AppImages.logo,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 8),
              const Text(
                'Stylish',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImages.profile),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            SizedBox(width: 16),
            Icon(Icons.search, color: AppColors.textfieldicon),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Search any Product..',
                style: TextStyle(color: AppColors.textfieldicon, fontSize: 16),
              ),
            ),
            Icon(Icons.mic, color: AppColors.textfieldicon),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'All Featured',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    Text('Sort', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Icon(Icons.swap_vert, size: 16),
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
                    Text('Filter', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Icon(Icons.filter_alt_outlined, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {'name': 'Beauty', 'image': AppImages.beauty},
      {'name': 'Fashion', 'image': AppImages.fashion},
      {'name': 'Kids', 'image': AppImages.kids},
      {'name': 'Mens', 'image': AppImages.mens},
      {'name': 'Womens', 'image': AppImages.womens},
    ];

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 78,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        category['image'] as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category['name'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
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
                final banner = _banners[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.banner1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              banner['subtitle1'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              banner['subtitle2'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                banner['buttonText'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                          ? const Color(0xFFFF6B9D)
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

  Widget _buildDealOfTheDay() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBlue, // Set background color
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deal of the Day',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '22h 55m 20s remaining',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View all →',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _productList() {
    final products = [
      {
        'title': 'Women Printed Kurta',
        'description': 'Neque porro quisquam est qui dolorem ipsum quia',
        'price': '₹1500',
        'originalPrice': '₹2499',
        'discount': '40% Off',
        'rating': 4.0,
        'reviews': 56890,
        'image': AppImages.kurta,
      },
      {
        'title': 'HRX by Hrithik Roshan',
        'description': 'Neque porro quisquam est qui dolorem ipsum quia',
        'price': '₹2499',
        'originalPrice': '₹4999',
        'discount': '50% Off',
        'rating': 4.2,
        'reviews': 344567,
        'image': AppImages.shoe,
      },
    ];

    return Column(
      children: [
        const SizedBox(height: 16),
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
                p['originalPrice'] as String,
                p['discount'] as String,
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
    String originalPrice,
    String discount,
    double rating,
    int reviews,
  ) {
    return Container(
      width: 190,
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
            height: 135,
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
                Row(
                  children: [
                    Text(
                      originalPrice,
                      style: TextStyle(
                        color: AppColors.textfieldicon,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      discount,
                      style: const TextStyle(
                        color: AppColors.lightRed,
                        fontSize: 12,
                      ),
                    ),
                  ],
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

  Widget _buildSpecialOffers() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.specialOffer)),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Offers 😱',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'We make sure you get the offer you need at best prices',
                  style: TextStyle(color: AppColors.black, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlatAndHeels() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white, width: 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 25),
          // Image section
          Image.asset(
            'assets/images/heels.png',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.error),
          ),

          // Spacer between image and text
          SizedBox(width: 25),
          // Text section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Center(
                    child: const Text(
                      'Flat and Heels',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: const Text(
                      'Stand a chance to get rewarded',
                      style: TextStyle(color: AppColors.black, fontSize: 10),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Visit now →',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrending() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightPink, // Set background color
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending Products',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 16,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Late Date 29/02/22',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View all →',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingProducts() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 270,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildProductCard(
              AppImages.watch,
              'IWC Schaffhausen',
              '2021 Pilot\'s Watch "SIHH 2019" 44mm',
              '₹650',
              '₹1599',
              '59% Off',
              4.5,
              6890,
            ),
            _buildProductCard(
              AppImages.sneaker,
              'Labbin White Sneakers',
              'For Men and Female',
              '₹650',
              '₹1250',
              '48% Off',
              4.0,
              5890,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotSummerSale() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(AppImages.hotSale, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Summer\' 25 Collections',
                        style: TextStyle(color: AppColors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.pinkishRed,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'View all →',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsoredSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Container(
          margin: const EdgeInsets.all(16),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sponsored',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.sale),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'up to 50% off',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 10),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
