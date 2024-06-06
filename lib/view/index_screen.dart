import 'package:flutter/material.dart';
import 'package:une_messe/responsive/mobile_scaffold.dart';
import 'package:une_messe/responsive/responsive_layout.dart';
import 'package:une_messe/responsive/tablet_scaffold.dart';
import 'package:une_messe/responsive/desktop_scaffold.dart';


class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: MobileScaffold(),
      tabletScaffold: TabletScaffold(),
      desktopScaffold: DesktopScaffold(),
    );
  }
}
