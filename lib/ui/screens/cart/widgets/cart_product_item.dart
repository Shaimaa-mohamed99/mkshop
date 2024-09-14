/*

import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';
import 'package:e_commerce/ui/screens/cart/cubit/cart_screen_states.dart';
import 'package:e_commerce/ui/screens/cart/cubit/cart_screen_viewmodel.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatefulWidget {
  final ProductEntity product;
  final CartProductsEntity cartProduct;

  const CartProductItem(
      {required this.product, required this.cartProduct, super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartScreenStates>(
      buildWhen: (previous, current) {
        if (current is UpdateCartProductCountSuccessState ||
            current is DeleteFromCartSuccessState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return Container(
          height: 152.h,
          margin: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: MyColors.blueColor.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: MyColors.blueColor.withOpacity(0.3),
                    ),
                  ),
                  child: Image.network(
                    widget.product.imageCover ?? '',
                    height: 152.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 8.w, bottom: 2.h, right: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 190.w,
                              child: Text(widget.product.title ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: MyColors.blueColor))),
                          IconButton(
                              onPressed: () {
                                CartScreenViewModel.get(context)
                                    .deleteProductFromCart(
                                        widget.product.id ?? "");
                              },
                              icon: const ImageIcon(
                                  AssetImage('assets/images/delete_icon.png'),
                                  color: MyColors.blueColor))
                        ],
                      ),
                      Text(widget.product.brand?.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: MyColors.blueColor.withOpacity(0.4))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.cartProduct.price} LE',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: MyColors.blueColor),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.blueColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.r))),
                            child: Row(
                              children: [
                                IconButton(
                                  iconSize: 30.sp,
                                  color: MyColors.whiteColor,
                                  onPressed: () {
                                    int counter =
                                        widget.cartProduct.count?.toInt() ?? 0;

                                    0;
                                    counter++;
                                    CartScreenViewModel.get(context)
                                        .updateProductCountInCart(
                                            widget.product.id ?? '', counter);
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                      Icons.add_circle_outline_sharp),
                                ),
                                Text(widget.cartProduct.count.toString()),
                                IconButton(
                                  iconSize: 30.sp,
                                  color: MyColors.whiteColor,
                                  onPressed: () {
                                    int counter =
                                        widget.cartProduct.count?.toInt() ?? 0;

                                    counter--;
                                    if (counter <= 0) {
                                      counter = 0;
                                    }
                                    CartScreenViewModel.get(context)
                                        .updateProductCountInCart(
                                            widget.product.id ?? "", counter);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
*/