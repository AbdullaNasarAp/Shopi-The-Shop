import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/address/address.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddressController>(context, listen: false).getAllAddresses();
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<AddressController>(
        builder: (context, value, child) {
          return value.addressList.isEmpty
              ? LoadingAnimationWidget.flickr(
                  leftDotColor: kBlack, rightDotColor: kGrey, size: 30)
              : Container(
                  height: 185,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: kGrey,
                        offset: Offset(1, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: kGrey,
                        offset: Offset(1, -5.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor: kIndigo,
                              child: FaIcon(
                                FontAwesomeIcons.mapLocation,
                                color: kWhite,
                              ),
                            ),
                            ksizedBoxW10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWithFamily(
                                    title: value.addressList[index].fullName,
                                    ls: 0,
                                    colors: kIndigo,
                                    fontwght: FontWeight.normal,
                                    fontsz: 15,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                                TextWithFamily(
                                    title: value.addressList[index].phone,
                                    ls: 0,
                                    colors: kGrey,
                                    fontwght: FontWeight.normal,
                                    fontsz: 13,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                                TextWithFamily(
                                    title: value.addressList[index].place,
                                    ls: 0,
                                    colors: kGrey,
                                    fontwght: FontWeight.normal,
                                    fontsz: 13,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                                TextWithFamily(
                                    title: value.addressList[index].landMark,
                                    ls: 0,
                                    colors: kGrey,
                                    fontwght: FontWeight.normal,
                                    fontsz: 13,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                                TextWithFamily(
                                    title: value.addressList[index].pin,
                                    ls: 0,
                                    colors: kGrey,
                                    fontwght: FontWeight.normal,
                                    fontsz: 13,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                                TextWithFamily(
                                    title: value.addressList[index].state,
                                    ls: 0,
                                    colors: kGrey,
                                    fontwght: FontWeight.normal,
                                    fontsz: 13,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                                TextWithFamily(
                                    title: value.addressList[index].title,
                                    ls: 0,
                                    colors: kGrey,
                                    fontwght: FontWeight.normal,
                                    fontsz: 13,
                                    textalign: TextAlign.center,
                                    maxline: 1,
                                    ws: 0),
                              ],
                            ),
                            ksizedBoxW20,
                          ],
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .43,
                                child: OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      FontAwesomeIcons.pencil,
                                      size: 15,
                                    ),
                                    label: const Text("Edit")),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .43,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: const TextWithFamily(
                                          ws: 0,
                                          title: "Are you sure?",
                                          ls: 0,
                                          colors: kBlack,
                                          fontwght: FontWeight.bold,
                                          fontsz: 17,
                                          textalign: TextAlign.justify,
                                          maxline: 1,
                                        ),
                                        content: const TextWithFamily(
                                          ws: 0,
                                          title:
                                              "Do you want to remove the Address ?",
                                          ls: 0,
                                          colors: kIndigo,
                                          fontwght: FontWeight.bold,
                                          fontsz: 17,
                                          textalign: TextAlign.justify,
                                          maxline: 2,
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
                                              value.deleteAddress(
                                                  value.addressList[index].id);
                                              Navigator.of(ctx).pop(true);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  action: SnackBarAction(
                                                    label: "UNDO",
                                                    onPressed: () {},
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 1000),
                                                  content: const Text(
                                                    "Address Deleted",
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.xmark,
                                    size: 15,
                                  ),
                                  label: const Text("Delete"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class OutlinedContainerButton extends StatelessWidget {
  const OutlinedContainerButton(
      {super.key, required this.label, required this.iconData});
  final String label;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20,
      decoration: BoxDecoration(border: Border.all(color: kBlack, width: 10)),
      child: Row(
        children: [Text(label), Icon(iconData)],
      ),
    );
  }
}
