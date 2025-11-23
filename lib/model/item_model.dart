import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ItemModel extends StatelessWidget {
  final String itemTitle;
  final double itemPrice;
  final String imagePath;
  int quantity = 1;
  final color;

  void Function()? onPressed;

  ItemModel({
    super.key,
    required this.itemTitle,
    required this.itemPrice,
    required this.imagePath,
    this.quantity = 1,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.shade100,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 64,
            ),
            Text(itemTitle),
            MaterialButton(
              onPressed: onPressed,
              color: color.shade400,
              child: Text(
                '\$$itemPrice',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );  
  }
}