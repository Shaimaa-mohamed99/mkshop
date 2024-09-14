import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/wishlist_tab/cubit/wishlist_tab_states.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/wishlist_tab/cubit/wishlist_tab_viewmodel.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({super.key});

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
  final _viewModel = WishListTabViewModel(
      getWishListUseCase: injectGetWishListUseCase(),
      removeFromWishListUseCase: injectRemoveFromWishListUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsTabViewModel(
          getAllProductsUseCase: injectGetAllProductsUseCase(),
          addToCartUseCase: injectAddToCartUseCase(),
          addToWishListUseCase: injectAddToWishListUseCase()),

      ///
      child: BlocBuilder<WishListTabViewModel, WishListTabStates>(
        bloc: _viewModel..getWishList(),
        builder: (context, state) {
          if (state is WishListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.blueColor,
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _viewModel.wishListProducts.length,
                      itemBuilder: (context, i) {
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
                                      color:
                                          MyColors.blueColor.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Image.network(
                                    _viewModel.wishListProducts[i].imageCover ??
                                        "",
                                    height: 152.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 8.w, bottom: 2.h, right: 8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 190.w,
                                            child: Text(
                                              _viewModel.wishListProducts[i]
                                                      .title ??
                                                  "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      color:
                                                          MyColors.blueColor),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              _viewModel.removeFromWishList(
                                                  _viewModel.wishListProducts[i]
                                                          .id ??
                                                      '');
                                              _viewModel.relodaWishList();
                                            },
                                            icon: Material(
                                              elevation: 4,
                                              shape: const CircleBorder(),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    MyColors.whiteColor,
                                                radius: 18.r,
                                                child: ImageIcon(
                                                  const AssetImage(
                                                    "assets/images/wishlist_icon.png",
                                                  ),
                                                  size: 25.r,
                                                  color: MyColors.blueColor,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        _viewModel.wishListProducts[i].brand
                                                ?.name ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: MyColors.blueColor
                                                    .withOpacity(0.4)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${_viewModel.wishListProducts[i].price} LE',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    color: MyColors.blueColor),
                                          ),
                                          MaterialButton(
                                            color: MyColors.blueColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.r)),
                                            onPressed: () {
                                              ProductsTabViewModel.get(context)
                                                  .addToCart(_viewModel
                                                          .wishListProducts[i]
                                                          .id ??
                                                      "");
                                            },
                                            child: Text(
                                              "Add To Cart",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(fontSize: 14.sp),
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
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
