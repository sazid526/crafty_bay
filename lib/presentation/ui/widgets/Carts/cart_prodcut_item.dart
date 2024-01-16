import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  @override
  Widget build(BuildContext context) {

    ValueNotifier<int> noOfItems = ValueNotifier(1);

    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeImage,
            width: 100,
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nike show 12kmn 2021 edition",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis
                            ),),
                          Row(
                            children: [
                              Text("Color: Red"),
                              SizedBox(width: 8,),
                              Text("Size XL")
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.delete,color: Colors.grey,),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$100",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                    ValueListenableBuilder(
                        valueListenable: noOfItems,
                        builder: (context,value,_) {
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
                        }
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

