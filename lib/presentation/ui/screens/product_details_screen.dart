import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/Product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/Product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/Product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  List<Color> colors = [
    Colors.pink,
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.red
  ];

  List<String> sized = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
    "XXXL",
  ];

  late Color _selectedColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                 const ProductImageCarousel(),
                  productDetailsBody,
                ],
              ),
            ),
          ),
          priceAndAddToCartSection
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Nike Sport Shoe 2023 Edition E02R - ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                          ValueListenableBuilder(
                              valueListenable: noOfItems,
                              builder: (context, value, _) {
                                return ItemCount(
                                  initialValue: 1,
                                  minValue: 0,
                                  maxValue: 20,
                                  decimalPlaces: 0,
                                  step: 1,
                                  color: AppColors.primaryColor,
                                  onChanged: (v) {
                                    // Handle counter value changes
                                    noOfItems.value = v.toInt();
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ReviewAndRatingRow,
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Color",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      ColorSelector(
                          colors: colors,
                          onChange: (selectedColor) {
                            _selectedColor = selectedColor;
                          }),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Size",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizeSelector(sizes: sized, onChange: (s) {}),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                );
  }

  Row get ReviewAndRatingRow {
    return Row(
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "4.4",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Reviews",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.15),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Text(
                "\$120",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add To Cart"),
            ),
          )
        ],
      ),
    );
  }
}
