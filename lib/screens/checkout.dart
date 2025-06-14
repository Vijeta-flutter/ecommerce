import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_images.dart';
import 'package:ecommerce/screens/checkout1.dart';
import 'package:ecommerce/widgets/rounded_textfield.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

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
      ),
      body: Container(
        color: AppColors.lightGray,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileimage(),
                _personalDetails(),
                _divider(),
                _businessAddressDetails(),
                _divider(),
                _bankAccountDetails(),
                _saveButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileimage() {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 15),
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(AppImages.checkout),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 120,
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Container(
              padding: EdgeInsets.all(4), // thickness of white ring
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // white ring color
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue,
                child: Icon(Icons.edit_outlined, color: Colors.white, size: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _personalDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Email Address",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: 'user@gmail.com'),
          SizedBox(height: 20),
          Text(
            "Password",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: '***********'),
          SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                  Container(
                    height: 1, // thickness of the underline
                    width:
                        100, // you can adjust this or calculate based on text width
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _divider() {
    return Column(
      children: [
        SizedBox(height: 34),
        Divider(thickness: 1),
        SizedBox(height: 6),
      ],
    );
  }

  Widget _businessAddressDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Business Address Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Pincode",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: '450116'),
          SizedBox(height: 20),
          Text(
            "Address",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: '216 St Paul\'s Rd,'),
          SizedBox(height: 20),
          Text("City", style: TextStyle(fontSize: 12, color: AppColors.black)),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: 'London'),
          SizedBox(height: 20),
          Text("State", style: TextStyle(fontSize: 12, color: AppColors.black)),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: 'N1 2LL,'),
          SizedBox(height: 20),
          Text(
            "Country",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: 'United Kingdom'),
        ],
      ),
    );
  }

  Widget _bankAccountDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bank Account Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Bank Account Number",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: '204356XXXXXXX'),
          SizedBox(height: 20),
          Text(
            "Account Holder'\s Name",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: 'Abhiraj Sisodiya'),
          SizedBox(height: 20),
          Text(
            "IFSC Code",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          SizedBox(height: 15),
          RoundedTextFormField(labelText: 'SBIN00428'),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckOut1()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text("Save", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
