import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category});

  final String? category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? "Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 200,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.90,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8

            ),
            itemBuilder: (context,index){
              return FittedBox(
                child: ProductCardItem(),
              );
            }
        ),
      ),
    );
  }
}
