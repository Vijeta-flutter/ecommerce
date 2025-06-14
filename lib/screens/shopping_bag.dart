import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:ecommerce/screens/checkout2.dart';
import 'package:flutter/material.dart';

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({super.key});

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
        title: Text("Shopping Bag"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_shoppingListCard2(), _paymentDetails()],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.15,
            maxChildSize: 0.2,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  children: [
                    _sheet(context),
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _shoppingListCard2() {
    return Padding(
      padding: EdgeInsets.only(bottom: 54),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 153,
                    width: 123,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        AppImages.checkout2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          "Women’s Casual Wear",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Checked Single-Breasted ",

                          style: TextStyle(fontSize: 13),
                        ),
                        Text("Blazer", style: TextStyle(fontSize: 13)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGreyBorder,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 6,
                                      ),
                                      child: Text(
                                        "Size",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "42",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGreyBorder,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 6,
                                      ),
                                      child: Text(
                                        "Qty",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery by",
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "10 May 2XXX",
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Widget _paymentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 5),
            SizedBox(
              width: 30,
              height: 20,
              child: Icon(Icons.airplane_ticket_outlined),
            ),
            SizedBox(width: 10),
            Text("Apply Coupons", style: TextStyle(fontSize: 16)),
            Spacer(),
            Text(
              "Select",
              style: TextStyle(color: AppColors.pinkishRed, fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 16),
        _divider(),
        SizedBox(height: 15),
        Text("Order Payment Details", style: TextStyle(fontSize: 17)),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Amounts", style: TextStyle(fontSize: 16)),
            Text(
              "₹ 7,000.00",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Convenience", style: TextStyle(fontSize: 16)),
            SizedBox(width: 14),
            Text(
              "Know More",
              style: TextStyle(fontSize: 12, color: AppColors.pinkishRed),
            ),
            Spacer(),
            Text(
              "Apply Coupon",
              style: TextStyle(fontSize: 12, color: AppColors.fireEngineRed),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery Fee", style: TextStyle(fontSize: 14)),
            Text(
              "Free",
              style: TextStyle(fontSize: 14, color: AppColors.pinkishRed),
            ),
          ],
        ),
        SizedBox(height: 21),
        _divider(),
        SizedBox(height: 19),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: TextStyle(fontSize: 16)),
            Text(
              "₹ 7,000.00",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("EMI Available", style: TextStyle(fontSize: 16)),
            SizedBox(width: 22),
            Text(
              "Know More",
              style: TextStyle(fontSize: 12, color: AppColors.pinkishRed),
            ),
          ],
        ),
        SizedBox(height: 43),
      ],
    );
  }

  Widget _divider() {
    return Divider(thickness: 1);
  }

  Widget _sheet(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 6),
        Column(
          children: [
            Text(
              "₹ 7,000.00",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "View Details",
              style: TextStyle(fontSize: 12, color: AppColors.crimsonRed),
            ),
          ],
        ),
        SizedBox(width: 26),
        Expanded(child: _saveButton(context)),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _saveButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckOut2()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          "Proceed to Payment",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
