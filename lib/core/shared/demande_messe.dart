
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:une_messe/core/constants.dart';

import '../../components/formfield.dart';


class DemandeMesse extends StatefulWidget {
  final String eglise;
  final String adresse;
  final String date;
  final String hour;

  const DemandeMesse({super.key,
   required this.eglise,
   required this.adresse,
   required this.date,
   required this.hour,
   });

  @override
  State<DemandeMesse> createState() => _DemandeMesseState();
}

class _DemandeMesseState extends State<DemandeMesse> {
  

 

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
                maxHeight: size.height / 1.2,
              ),
              child: Container(
                 decoration:  ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(RADIUS*3)),
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
                            borderRadius: BorderRadius.vertical(top: Radius.circular(RADIUS*3)),
                            color: primaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.church,color: Colors.white,),
                              SizedBox(height: 8,),
                              Text("${widget.eglise}",
                              style: TextStyle(
                                color: yellowColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                               Text("${widget.adresse}",
                              style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                      Positioned(
                        top: 20,
                        left: PADDING*2,
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
                      padding: EdgeInsets.all(PADDING*2),
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                             Text("${widget.date}",
                                               textAlign: TextAlign.center,
                                               style: TextStyle(
                                                fontWeight: FontWeight.bold
                                               ),),
                                             Text("${widget.hour}",
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                             ),),
                          SizedBox(height: PADDING*2),
                          Form(
                            child: Column(
                                          
                              children: [
                                Formfield(
                                  labelText: "Qui demande la messe",
                                  hintText: 'Qui demande la messe',
                                  
                                ),
                                SizedBox(height: PADDING*2,),
                                Formfield(
                                  labelText: "Par l’intercession de",
                                  hintText: 'Par l’intercession de',
                                  
                                ),
                                 SizedBox(height: PADDING*2,),
                                Formfield(
                                  maxline: 4,
                                  labelText: "Motif de l’Intentione",
                                  hintText: 'Motif de l’Intentione',
                                  
                                ),
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
