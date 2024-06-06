import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/components/offering_item_wiget.dart';
import 'package:une_messe/core/constants.dart';
import 'package:une_messe/responsive_fragments/shopping_fragment_desktop.dart';

class ChoiceOfferingDesktop extends StatefulWidget {
  const ChoiceOfferingDesktop({super.key});

  @override
  State<ChoiceOfferingDesktop> createState() => _ChoiceOfferingDesktopState();
}

class _ChoiceOfferingDesktopState extends State<ChoiceOfferingDesktop> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            width: 400, 
            constraints: BoxConstraints(
              minHeight: size.height / 1.4,
              maxHeight: size.height / 1.2,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(radius * 3),
                    bottom: Radius.circular(radius * 3),

                    ),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.9,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(radius * 3)),
                          color: greenColor[50],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: Image.asset("assets/images/hands-gesture.png")),
                            const SizedBox(height: 8),
                            const Text(
                              "Choisissez votre offrande",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: padding * 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: ShapeDecoration(
                                color: Colors.black45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: greenColor[50],
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: offeringItems.length,
                        itemBuilder: (context, e) {
                          var item = offeringItems[e];
                          return OfferingItemWidget(data: item);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding * 2),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Offrande",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              "0 CFA",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                        AppButtonWidget(
                          label: "Ajouter au panier",
                          press: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShoppingFragmentDesktop()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
