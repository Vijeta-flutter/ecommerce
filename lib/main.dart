// import 'package:ecommerce/screens/home.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,

//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/getStarted.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetStarted(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomeScreen extends StatefulWidget {
//   const MyHomeScreen({super.key});

//   @override
//   State<MyHomeScreen> createState() => _MyHomeScreenState();
// }

// class _MyHomeScreenState extends State<MyHomeScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     Center(child: Text('Wishlist')),
//     CartScreen(),
//     Center(child: Text('Search')),
//     Center(child: Text('Settings')),
//   ];

//   void _onTabSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: _screens[_selectedIndex]),
//       bottomNavigationBar: _buildBottomNavigation(),
//     );
//   }

//   Widget _buildBottomNavigation() {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppColors.red,
//       unselectedItemColor: AppColors.black,
//       currentIndex: _selectedIndex,
//       onTap: _onTabSelected,
//       items: [
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.home_outlined),
//           label: 'Home',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_border),
//           label: 'Wishlist',
//         ),
//         BottomNavigationBarItem(
//           icon: CircleAvatar(
//             radius: 16,
//             backgroundColor: Colors.transparent,
//             child: Icon(
//               Icons.shopping_cart_outlined,
//               size: 20,
//               color: AppColors.black,
//             ),
//           ),
//           activeIcon: CircleAvatar(
//             radius: 16,
//             backgroundColor: AppColors.red,
//             child: Icon(
//               Icons.shopping_cart_outlined,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
//           label: 'Cart',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: 'Search',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.settings_outlined),
//           label: 'Setting',
//         ),
//       ],
//     );
//   }
// }

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text('Wishlist')),
    CartScreen(),
    Center(child: Text('Search')),
    Center(child: Text('Settings')),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_selectedIndex]),
      // Stack to position floating cart icon
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          _buildBottomNavigation(),
          Positioned(
            top: -15,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: GestureDetector(
              onTap: () {
                _onTabSelected(2);
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == 2 ? AppColors.red : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                  color: _selectedIndex == 2 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.red,
      unselectedItemColor: AppColors.black,
      currentIndex: _selectedIndex,
      onTap: _onTabSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Wishlist',
        ),
        // Leave Cart icon empty because we render it separately above
        BottomNavigationBarItem(
          icon: SizedBox(height: 0), // placeholder
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Setting',
        ),
      ],
    );
  }
}
