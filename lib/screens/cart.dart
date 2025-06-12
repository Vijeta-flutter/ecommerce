import 'dart:async';

import 'package:ecommerce/constants/app_images.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CircleAvatar(
            radius: 16,
            child: Icon(Icons.shopping_cart_outlined, size: 20),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promotional Banner
          _buildPromotionalBanner(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Size: 7UK',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
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
}
