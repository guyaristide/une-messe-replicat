import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:une_messe/components/app_buttom_widget.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/formfield.dart';
import 'modals.dart';

class AddAdresse extends StatefulWidget {
  

  const AddAdresse({
    super.key,
  });

  @override
  State<AddAdresse> createState() => _AddAdresseState();
}

class _AddAdresseState extends State<AddAdresse> {
  Map<String, dynamic>? _selectedItem;

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
              minHeight: size.height / 1.4,
              maxHeight: size.height / 1.3,
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
                          color: greenColor.withOpacity(0.15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           Center(child: Image.asset("assets/images/3d Hand-Phone.png")),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Vos coordonnées",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
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
                        width: size.width,
                      color: greenColor.withOpacity(0.15),
                        child: SingleChildScrollView(
                          child: SpGrid(
                            crossAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.start,
                            spacing: PADDING*1.5,
                            runSpacing: PADDING*2,
                            padding: EdgeInsets.symmetric(vertical: PADDING*1.5),
                            children: [
                               SpGridItem(
                                xs: 4,
                                 child: DropdownButtonFormField<Map<String, dynamic>>(
                                  decoration: InputDecoration(
                                   floatingLabelStyle: TextStyle(color: greenColor, fontSize: 14),
                                  labelStyle: TextStyle(color: greenColor, fontSize: 14,fontWeight: FontWeight.w500,),
                                    labelText: 'Indicatif',
                                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w400,),
                                    border: const OutlineInputBorder(),
                                  ),
                                value: _selectedItem,
                                onChanged: ( Map<String, dynamic>? newValue) {
                                  setState(() {
                                    _selectedItem = newValue;
                                  });
                                },
                                items: indicatifContries.map((Map<String, dynamic> value) {
                                  return DropdownMenuItem<Map<String, dynamic>>(
                                    value: value,
                                    child: Center(
                                      child: Text(value['value'],
                                       maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:  TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: blackColor,
                                                      ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                               ),
                               ),
                               SpGridItem(
                                xs: 8,
                                 child: Formfield(
                                        labelText: "Numéro de téléphone",
                                        hintText: 'Numéro de téléphone',
                                        keyboard: TextInputType.phone,
                                      ),
                               ),
                               SpGridItem(
                                 child: Formfield(
                                        labelText: "Adresse email",
                                        hintText: 'Adresse email',
                                      ),
                               ),
                               SpGridItem(
                                 child: AppButtomWidget(
                                  label: "Confirmer",
                                   press: () async{ 
                                    Navigator.pop(context);
                                    await Modals.showModalSuccessful(context);
                                    },),
                               )
                            ],
                          ),
                        ),
                      )),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

