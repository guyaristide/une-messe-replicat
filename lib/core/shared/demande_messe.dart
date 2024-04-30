import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/formfield.dart';
import 'modals.dart';

class DemandeMesse extends StatefulWidget {
  final String eglise;
  final String adresse;
  final String date;
  final String hour;

  const DemandeMesse({
    super.key,
    required this.eglise,
    required this.adresse,
    required this.date,
    required this.hour,
  });

  @override
  State<DemandeMesse> createState() => _DemandeMesseState();
}

class _DemandeMesseState extends State<DemandeMesse> {
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
            width: size.width,
            constraints: BoxConstraints(
              minHeight: size.height / 1.3,
              maxHeight: size.height / 1.1,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(RADIUS * 3)),
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
                        width: size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(RADIUS * 3)),
                          color: primaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.church,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${widget.eglise}",
                              style: TextStyle(
                                  color: yellowColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.adresse}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: PADDING * 2,
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
                              child: Icon(
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
                    child: Padding(
                      padding: EdgeInsets.all(PADDING * 2),
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "${widget.date}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.hour}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(height: PADDING * 2),
                              Form(
                                  child: Column(
                                children: [
                                  Formfield(
                                    labelText: "Qui demande la messe",
                                    hintText: 'Qui demande la messe',
                                  ),
                                  SizedBox(
                                    height: PADDING * 2,
                                  ),
                                  Formfield(
                                    labelText: "Par l’intercession de",
                                    hintText: 'Par l’intercession de',
                                  ),
                                  SizedBox(
                                    height: PADDING * 2,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:8),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.black45, width: 1),
                                    ),
                                    child: DropdownButton(
                                        isExpanded: true,
                                        hint:  Text(
                                          "Choisissez une intention",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: greenColor
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        value: selectedIntentionCategory,
                                        items: intentionCategories
                                            .map((Map<String, dynamic> value) {
                                          return DropdownMenuItem<
                                              Map<String, dynamic>>(
                                            value: value,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              child: Text(
                                                value['value'],
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    ),
                                                selectionColor: greenColor,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged:
                                            (Map<String, dynamic>? newValue) {
                                          setState(() {
                                            selectedIntentionCategory =
                                                newValue;
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: PADDING * 2,
                                  ),
                                  Formfield(
                                    maxline: 4,
                                    labelText: "Motif de l’Intention",
                                    hintText: 'Motif de l’Intention',
                                  ),
                                  SizedBox(
                                    height: PADDING * 2,
                                  ),
                                  AppButtomWidget(
                                    press: ()async{
                                      Navigator.pop(context);
                                      Modals.showModalAddToCart(context);
                                    }, 
                                    label: "Envoyer la demande de messe")
                                ],
                              )),
                            ],
                          ),
                        ),
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
