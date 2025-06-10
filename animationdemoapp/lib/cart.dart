import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), centerTitle: true),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: InkWell(
            onTap: () {
              // expanded
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: AnimatedContainer(
              curve: Easing.linear,
              duration: Duration(seconds: 1),
              width: _isExpanded ? 250 : 80,
              height: _isExpanded ? 70 : 60,
              decoration: BoxDecoration(
                color: _isExpanded ? Colors.blue.shade900 : Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      _isExpanded ? Icons.check : Icons.shopping_cart,
                      color: _isExpanded ? Colors.white : Colors.blue.shade900,
                      size: 30,
                    ),
                  ),

                  Text(
                    _isExpanded ? "Added to Cart" : "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
