import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_template/model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Text(
                "My Cart",
                style: TextStyle(
                  fontFamily: 'ChangoOne',
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final cartItem = value.getCartItems[index];
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          cartItem.imagePath,
                          height: 36,
                        ),
                        title: Text(cartItem.itemTitle),
                        subtitle: Text('\$${cartItem.itemPrice}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // - Button
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false).decreaseQuantity(index);
                              },
                            ),

                            // Display quantitiy of item
                            Text(
                              cartItem.quantity.toString(),
                              style: TextStyle(fontSize: 16),
                            ),

                            // + Button
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false).increaseQuantity(index);
                              },
                            ),
                            
                            // x Button
                            IconButton(
                              onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index), 
                              icon: Icon(Icons.delete)
                            ),
                          ],
                        ),
                      ),
                    ), 
                  );
                }, itemCount: value.getCartItems.length,)
              ),

              Padding(
                padding: const EdgeInsets.all(36),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.green.shade100
                            ),
                          ),
                          Text(
                            value.calculateTotal(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              )
            ],
          );
        }),
    );
  }
}