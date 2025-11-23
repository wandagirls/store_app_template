import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_template/model/cart_model.dart';
import 'package:store_app_template/model/item_model.dart';
import 'package:store_app_template/screens/cart_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartPage();
        })),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's order fresh items",
                style: TextStyle(
                  fontFamily: 'ChangaOne',
                  fontSize: 40,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Fresh Items',
                style: TextStyle(
                  fontFamily: 'SourceSans3',
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              )
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      final shopItem = value.getShopItems[index];
                      return ItemModel(
                        itemTitle: shopItem.itemTitle,
                        itemPrice: shopItem.itemPrice,
                        imagePath: shopItem.imagePath,
                        color: shopItem.color,
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                        },
                      );
                    }, itemCount: value.getItemCount);
                }
              ),
            ),
          ],
        )),
    );
  }
}