import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:ecommerce/widgets/rounded_textfield.dart';
import 'package:flutter/material.dart';

class CheckOut2 extends StatelessWidget {
  const CheckOut2({super.key});

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
        title: Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300, // You can use AppColors if needed
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_paymentProcess(), _saveButton(context)],
          ),
        ),
      ),
    );
  }

  Widget _paymentProcess() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order",
              style: TextStyle(fontSize: 18, color: AppColors.veryLightGray),
            ),
            Text(
              "₹ 7,000",
              style: TextStyle(fontSize: 18, color: AppColors.veryLightGray),
            ),
          ],
        ),
        SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping",
              style: TextStyle(fontSize: 18, color: AppColors.veryLightGray),
            ),
            Text(
              "₹ 30",
              style: TextStyle(fontSize: 18, color: AppColors.veryLightGray),
            ),
          ],
        ),
        SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(fontSize: 18, color: AppColors.darkLabel),
            ),
            Text(
              "₹ 7,030",
              style: TextStyle(fontSize: 18, color: AppColors.darkLabel),
            ),
          ],
        ),
        SizedBox(height: 17),
        _divider(),
        SizedBox(height: 17),
        Text(
          "Payment",
          style: TextStyle(fontSize: 18, color: AppColors.darkGrey),
        ),
        SizedBox(height: 15),
        RoundedTextFormField(
          labelText: 'VISA',
          keyboardType: TextInputType.emailAddress,
          hintText: "*********2109",
        ),
        SizedBox(height: 25),
        RoundedTextFormField(
          labelText: 'PayPAl',
          keyboardType: TextInputType.emailAddress,
          hintText: "*********2109",
        ),
        SizedBox(height: 25),
        RoundedTextFormField(
          labelText: 'MasterCard',
          keyboardType: TextInputType.emailAddress,
          hintText: "*********2109",
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget _divider() {
    return Divider(thickness: 1);
  }

  Widget _saveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SizedBox(
                    width: 330,
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.paymentSucessful, height: 100),
                          SizedBox(height: 12),

                          Text(
                            "Payment done successfully.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
