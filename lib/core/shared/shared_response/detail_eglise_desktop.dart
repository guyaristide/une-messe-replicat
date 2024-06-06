import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/components/items/calendarWidget.dart';
import 'package:une_messe/components/items/hour_item.dart';
import 'package:une_messe/core/constants.dart';

import 'package:une_messe/core/shared/modals.dart';

class DetailEgliseDesktop extends StatefulWidget {
  final dynamic data;

  const DetailEgliseDesktop({
    super.key,
    required this.data,
  });

  @override
  State<DetailEgliseDesktop> createState() => _DetailEgliseDesktopState();
}

class _DetailEgliseDesktopState extends State<DetailEgliseDesktop> {
  Map<String, dynamic>? selectedIntentionCategory;

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
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width * 0.9, // Ajustement pour ressembler à un formulaire de site web
            constraints: BoxConstraints(
              minHeight: size.height / 1.5,
              maxHeight: size.height / 1.3,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(radius * 3)),
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
                          color: primaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.church,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${widget.data['eglise']}",
                              style: TextStyle(
                                  color: yellowColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.data['adresse']}",
                              style: const TextStyle(color: Colors.white),
                            )
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const LocalizedCalendarWidget(),
                          const SizedBox(height: 20),
                          SpGrid(
                            width: size.width * 0.9,
                            spacing: padding * 2,
                            runSpacing: padding * 2,
                            crossAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.start,
                            children: [
                              if (widget.data['date'] != null)
                                ...List.generate(widget.data['date'].length, (index) {
                                  return SpGridItem(
                                    md: 2,
                                    sm: 3,
                                    xs: 4,
                                    child: HourItem(
                                      hour: "${widget.data['date'][index]['hour']}",
                                      press: () async {
                                        await Modals.showModalDemandeMesse(
                                          context,
                                          time: "DIM 05 MAI",
                                          hour: widget.data['date'][index]['hour'],
                                          data: widget.data,
                                        );
                                      },
                                    ),
                                  );
                                })
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
