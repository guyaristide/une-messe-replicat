import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/core/constants.dart';

import 'package:une_messe/components/formfield.dart';
import 'package:une_messe/core/shared/modals.dart';

class DemandeMesseDesktop extends StatefulWidget {
  final String time;
  final String hour;
  final dynamic data;

  const DemandeMesseDesktop({
    super.key,
    required this.time,
    required this.hour,
    required this.data,
  });

  @override
  State<DemandeMesseDesktop> createState() => _DemandeMesseDesktopState();
}

class _DemandeMesseDesktopState extends State<DemandeMesseDesktop> {
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
          alignment: Alignment.center,
          child: Container(
            width: 400, // Ajustement pour ressembler à un formulaire de site web
            constraints: BoxConstraints(
              minHeight: size.height / 1.3,
              maxHeight: size.height / 1.1,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(
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
                    child: Padding(
                      padding: EdgeInsets.all(padding * 2),
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                widget.time,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.hour,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(height: padding * 2),
                              Form(
                                child: Column(
                                  children: [
                                    Formfield(
                                      labelText: "Qui demande la messe",
                                      hintText: 'Qui demande la messe',
                                    ),
                                    SizedBox(
                                      height: padding * 2,
                                    ),
                                    DropdownButtonFormField<Map<String, dynamic>>(
                                      decoration: InputDecoration(
                                        floatingLabelStyle: TextStyle(
                                            color: greenColor, fontSize: 14),
                                        labelStyle: TextStyle(
                                            color: greenColor, fontSize: 14, fontWeight: FontWeight.w500),
                                        labelText: 'Choisissez une intention',
                                        border: const OutlineInputBorder(),
                                      ),
                                      value: selectedIntentionCategory,
                                      items: intentionCategories
                                          .map((Map<String, dynamic> value) {
                                        return DropdownMenuItem<Map<String, dynamic>>(
                                          value: value,
                                          child: Text(
                                            value['value'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: blackColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (Map<String, dynamic>? newValue) {
                                        setState(() {
                                          selectedIntentionCategory = newValue;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: padding * 2,
                                    ),
                                    Formfield(
                                      labelText: "Par l’intercession de",
                                      hintText: 'Par l’intercession de',
                                    ),
                                    SizedBox(
                                      height: padding * 2,
                                    ),
                                    Formfield(
                                      maxline: 4,
                                      labelText: "Motif de l’Intention",
                                      hintText: 'Pour...',
                                    ),
                                    SizedBox(
                                      height: padding * 2,
                                    ),
                                    AppButtonWidget(
                                      press: () async {
                                        Navigator.pop(context);
                                        Modals.showModalChoiceOffering(context);
                                      },
                                      label: "Envoyer la demande de messe",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
