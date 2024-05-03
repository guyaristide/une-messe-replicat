import 'package:flutter/material.dart';

import '../core/constants.dart';

// ignore: must_be_immutable
class TopBarWidget extends StatelessWidget {
   TopBarWidget({
    super.key,
    required this.title
  });
String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: greenColor.withOpacity(0.15),
      padding:  EdgeInsets.symmetric(horizontal: PADDING * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('${title}'),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    padding: EdgeInsets.all(PADDING * 1.5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.all(Radius.circular(RADIUS))),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Text(
                      "0",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}