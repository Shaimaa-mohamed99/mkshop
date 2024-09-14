import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_states.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:e_commerce/ui/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cartProductsCubit..getAllProducts(),
      child: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
          builder: (context, state) {
        if (state is ProductsTabLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColors.blueColor,
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 1 / 1.3,
            ),
            itemCount: cartProductsCubit.products.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                      arguments: cartProductsCubit.products[i]);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(15.r),
                  elevation: 1.5.r,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        width: 2.w,
                        color: MyColors.blueColor.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 200.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r),
                                  ),
                                  child: (state is ProductsTabLoadingState)
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: MyColors.blueColor,
                                          ),
                                        )
                                      : Image.network(
                                          cartProductsCubit
                                                  .products[i].imageCover ??
                                              "",
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: BlocListener<ProductsTabViewModel,
                                    ProductsTabStates>(
                                  listener: (_, state) {
                                    if (state is AddToWishListLoadingState &&
                                        state.productId ==
                                            cartProductsCubit.products[i].id) {
                                      showTopSnackBar(
                                        displayDuration:
                                            const Duration(milliseconds: 1200),
                                        snackBarPosition:
                                            SnackBarPosition.bottom,
                                        Overlay.of(context),
                                        CustomSnackBar.error(
                                          icon: Icon(
                                              Icons.favorite_border_rounded,
                                              color: Colors.red[200],
                                              size: 120),
                                          message: " Added To Wishlist",
                                        ),
                                      );
                                    }
                                  },
                                  child: IconButton(
                                    onPressed: () {
                                      // ProductsTabViewModel.get(context)
                                      cartProductsCubit.addToWishList(
                                          cartProductsCubit.products[i].id ??
                                              '');
                                    },
                                    icon: Material(
                                      elevation: 4,
                                      shape: const CircleBorder(),
                                      child: CircleAvatar(
                                        backgroundColor: MyColors.whiteColor,
                                        radius: 18.r,
                                        child: ImageIcon(
                                          const AssetImage(
                                            "assets/images/favorit_icon.png",
                                          ),
                                          size: 25.r,
                                          color: MyColors.blueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                cartProductsCubit.products[i].title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: MyColors.blueColor,
                                      fontSize: 14.sp,
                                    ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${cartProductsCubit.products[i].price} LE",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: MyColors.blueColor,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  // SizedBox(
                                  //   width: 45.w,
                                  // ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Review ${cartProductsCubit.products[i].ratingsAverage} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: MyColors.blueColor,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                      "assets/images/stat_icon.png",
                                    ),
                                  ),
                                  const Spacer(),
                                  BlocConsumer<ProductsTabViewModel,
                                      ProductsTabStates>(
                                    buildWhen: (_, current) {
                                      if (current is AddToCartLoadingState ||
                                          current is AddToCartSuccesslState) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    },
                                    listener: (_, state) {
                                      if (state is AddToCartSuccesslState) {
                                        showTopSnackBar(
                                          displayDuration: const Duration(
                                              milliseconds: 1200),
                                          snackBarPosition:
                                              SnackBarPosition.bottom,
                                          Overlay.of(context),
                                          const CustomSnackBar.info(
                                            icon: Icon(
                                                Icons.shopping_cart_outlined,
                                                color: Color(0x15000000),
                                                size: 120),
                                            message: "Added To Cart",
                                          ),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is AddToCartLoadingState &&
                                          state.productId ==
                                              cartProductsCubit
                                                  .products[i].id) {
                                        return SizedBox(
                                          width: 35.w,
                                          height: 35.h,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: MyColors.blueColor,
                                            ),
                                          ),
                                        );
                                      }
                                      return IconButton(
                                        onPressed: () {
                                          ProductsTabViewModel.get(context)
                                              .addToCart(cartProductsCubit
                                                      .products[i].id ??
                                                  "");
                                        },
                                        icon: SizedBox(
                                          width: 35.w,
                                          height: 35.h,
                                          child: const ImageIcon(
                                            AssetImage(
                                              "assets/images/add_icon.png",
                                            ),
                                            color: MyColors.blueColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
