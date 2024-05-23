import 'package:flutter/material.dart';

import '../core/constants.dart';

// ignore: must_be_immutable
class OfferingItemWidget extends StatefulWidget {
   OfferingItemWidget({
    super.key,
    required this.data,
  });
dynamic data;
  @override
  State<OfferingItemWidget> createState() => _OfferingItemWidgetState();
}

class _OfferingItemWidgetState extends State<OfferingItemWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:PADDING*2).copyWith(bottom:PADDING*2 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${widget.data['type']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(width: 5,),
                  const Icon(Icons.info,size: 20,)
                ],
              ),
              Text("${widget.data['price']} F CFA",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: greenColor,
                  ),
                  ),
            ],
          ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                 if (value > 0) {
                    value--;
                 }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: value == 0? Colors.grey: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(RADIUS*2))
                ),
                child: const Icon(Icons.remove,color: Colors.white,),
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Text("${value}"),
              ),
            GestureDetector(
              onTap: () {
                setState(() {
                  value++;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: value == 0? Colors.grey: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(RADIUS*2))
                ),
                child: const Icon(Icons.add,color: Colors.white,),
              ),
            ),
          ],
        )
        ],
      ),
    );
  }
}
