import 'package:flutter/material.dart';
import '../core/constants.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
    required this.title,
    required this.cartItemCount,
    required this.image,
  });

  final String title;
  final int cartItemCount;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Définir les tailles de l'image en fonction de la largeur de l'écran
    double imageSize;

    // Pour les écrans de petite taille
    if (screenWidth < 500) {
      imageSize = 24.0;
    } else if (screenWidth < 1100) {
      imageSize = 45.0;
    } else {
      imageSize = 60.0;
    }

    return Container(
      height: 90,
      color: greenColor[50],
      padding: EdgeInsets.symmetric(horizontal: padding * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(width: 5),
          Image.asset(
            image,
            height: imageSize,
            width: imageSize,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                if (cartItemCount > 0)
                  Positioned(
                    right: 30,
                    top:30,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 10,
                      child: Text(
                        "$cartItemCount",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
