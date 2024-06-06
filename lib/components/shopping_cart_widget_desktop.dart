import 'package:flutter/material.dart';
import 'package:une_messe/components/items/app_item_card_widget_desktop.dart';

import '../core/constants.dart';
import 'items/customTooltip.dart';

class ShoppingCartWidgetDesktop extends StatefulWidget {
  const ShoppingCartWidgetDesktop({
    super.key,
    required this.indexItemColor,
    required this.data,
  });

  final int indexItemColor;
  final dynamic data;

  @override
  State<ShoppingCartWidgetDesktop> createState() => _ShoppingCartWidgetDesktopState();
}

class _ShoppingCartWidgetDesktopState extends State<ShoppingCartWidgetDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: greenColor.withOpacity(0.08),
        borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppItemCardWidgetDesktop(
            itemHeight: 150,
            indexItemColor: widget.indexItemColor,
            listWidgets: [
              Text(
                "${widget.data['date']}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(height: 1),
              CustomTooltip(
                message: '${widget.data['communaute']}',
                child: Text(
                  "${widget.data['communaute']}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              CustomTooltip(
                message: '${widget.data['adresse']}',
                textColor: Colors.grey,
                child: Text(
                  "${widget.data['adresse']}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Nombre de messes",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(height: 1),
              CustomTooltip(
                message: '${int.parse(widget.data['nombre_messe'] ?? "0")} x Une Messe',
                child: Text(
                  "${int.parse(widget.data['nombre_messe'] ?? "0")} x Une Messe",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 2),
            child: CustomTooltip(
              message: '${widget.data['intention']}',
              textColor: primaryColor,
              child: Text(
                "${widget.data['intention']}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: padding * 2),
            child: CustomTooltip(
              message: '${widget.data['motif']}',
              child: Text(
                "${widget.data['motif']}",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 2),
            child: Text(
              "Par l’intercession de",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          const SizedBox(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 2),
            child: CustomTooltip(
              message: '${widget.data['name']}',
              child: Text(
                "${widget.data['name']}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.delete, color: Colors.red, size: 16),
                    Text(
                      "SUPPRIMER",
                      style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.edit, color: greenColor, size: 16),
                    Text(
                      "MODIFIER",
                      style: TextStyle(color: greenColor, fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: padding*2),
        ],
      ),
    );
  }
}
