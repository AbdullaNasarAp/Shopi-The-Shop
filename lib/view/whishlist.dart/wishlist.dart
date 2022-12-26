import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/homepro/productpro.dart';
import 'package:shopi/controller/provider/wishlist.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/productdetail/productdetail.dart';
import 'package:shopi/view/splash/widget/texttile.dart';
import 'package:shopi/view/whishlist.dart/widget.dart/wishtile.dart';

class WishList extends StatelessWidget {
  static const wRishlist = "/wishlist";
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: kBlack,
          backgroundColor: kWhite,
          leading: IconButton(
              splashRadius: 25,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 30,
              )),
          centerTitle: true,
          title: const TextWithFamily(
            title: "Your Wishlist",
            ls: 0,
            colors: kBlack,
            fontwght: FontWeight.bold,
            fontsz: 25,
            textalign: TextAlign.center,
            maxline: 1,
            ws: 0,
          ),
        ),
        body: const SingleChildScrollView(
            child: SizedBox(height: 600, child: WishListItem())));
  }
}

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishListProvider.getWishListItems();
    });
    return Consumer2<ProductProvider, WishlistProvider>(
      builder: (context, prodValue, wishListValue, child) {
        return wishListValue.isLoading == true
            ? Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: kBlack,
                  rightDotColor: Colors.grey,
                  size: 50,
                ),
              )
            : wishListValue.wishList == null ||
                    wishListValue.wishList!.products.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    child: Column(
                      children: const [
                        SizedBox(height: 40),
                        Image(image: AssetImage('assets/images/Fast Cart.png')),
                        Text('Your wishlist is empty'),
                      ],
                    ))
                : ListView.separated(
                    itemCount: wishListValue.wishList!.products.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) {
                            return showAlert(context);
                          },
                          onDismissed: (direction) {
                            Provider.of<WishlistProvider>(context,
                                    listen: false)
                                .addRemoveWishlistItem(wishListValue
                                    .wishList!.products[index].product.id);
                          },
                          key: ValueKey(wishListValue
                              .wishList!.products[index].product.id),
                          child: WishTile(
                              ontap: () {
                                Navigator.of(context).pushNamed(
                                    ProductDetail.routeName,
                                    arguments: wishListValue
                                        .wishList!.products[index].product.id);
                              },
                              image:
                                  "http://172.16.1.180:5005/products/${wishListValue.wishList!.products[index].product.image[0]}",
                              title1: wishListValue.wishList!.products[index]
                                  .product.discountPrice
                                  .toStringAsFixed(1),
                              title2: wishListValue
                                  .wishList!.products[index].product.price
                                  .toString(),
                              title: wishListValue
                                  .wishList!.products[index].product.name),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return ksizedBox10;
                    },
                  );
      },
    );
  }

  Future<bool?> showAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'Do you want to remove the item from the cart?',
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
