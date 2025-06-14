import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:ecommerce/screens/shopping_bag.dart';
import 'package:flutter/material.dart';

class CheckOut1 extends StatelessWidget {
  const CheckOut1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGray,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Checkout"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300, // You can use AppColors if needed
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _deliveryAddress(),
              _shoppingList(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ShoppingBag()),
                  );
                },
                child: _shoppingListCard(),
              ),
              _shoppingListCard2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _deliveryAddress() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on_outlined, size: 14),
            SizedBox(width: 8),
            Text(
              "Delivery Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Horizontal and vertical offset
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  bottom: 12,
                  right: 16,
                  top: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.edit_note_rounded, size: 12),
                    Text(
                      "Address :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "216 St Paul\'s Rd, London N1 2LL, UK",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Horizontal and vertical offset
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(27),
                child: Icon(Icons.add_circle_outline, size: 16),
              ),
            ),
          ],
        ),
        SizedBox(height: 14),
      ],
    );
  }

  Widget _shoppingList() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Shopping List",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _shoppingListCard2() {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3), // Horizontal and vertical offset
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120, // fixed height
                    width: 120, // same as height to make it square
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.checkout3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          "Men\’s Jacket",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text("Variation :", style: TextStyle(fontSize: 12)),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.darkMaroon,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Text(
                                  "Green",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.darkMaroon,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Text(
                                  "Grey",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text(
                              "4.7",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
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
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.darkMaroon,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                child: Text(
                                  "\$ 45.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 11),
                            Column(
                              children: [
                                Text(
                                  "upto 28% off",
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: AppColors.crimsonRed,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "\$ 67.00",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mediumGray1,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor:
                                        AppColors
                                            .mediumGray1, // Optional: strike color
                                    decorationThickness: 1,
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
              _divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order (1) :",
                    style: TextStyle(fontSize: 12, color: AppColors.black),
                  ),
                  Text(
                    "\$ 45.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shoppingListCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3), // Horizontal and vertical offset
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120, // fixed height
                    width: 120, // same as height to make it square
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.checkout2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          "Women\'s Casual Wear",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text("Variation :", style: TextStyle(fontSize: 12)),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.darkMaroon,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Text(
                                  "Black",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.darkMaroon,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Text(
                                  "Red",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text(
                              "4.8",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
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
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.darkMaroon,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                child: Text(
                                  "\$ 34.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 11),
                            Column(
                              children: [
                                Text(
                                  "upto 33% off",
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: AppColors.crimsonRed,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "\$ 64.00",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mediumGray1,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor:
                                        AppColors
                                            .mediumGray1, // Optional: strike color
                                    decorationThickness: 1,
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
              _divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order (1) :",
                    style: TextStyle(fontSize: 12, color: AppColors.black),
                  ),
                  Text(
                    "\$ 34.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(thickness: 1);
  }
}
