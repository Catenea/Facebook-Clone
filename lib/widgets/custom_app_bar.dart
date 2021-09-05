import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:test/config/palette.dart';
import 'package:test/models/models.dart';
import 'package:test/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final int selectedIndex;
  final Function(int) onTap;
  final List<IconData> icons;

  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      required this.selectedIndex,
      required this.onTap,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(color: Colors.black, offset: Offset(0, 2), blurRadius: 4.0)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
                icons: icons,
                selectedIndex: selectedIndex,
                onTap: onTap,
                isBottomIndicator: true),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(currentUser: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                    icon: Icons.search, iconSize: 30.0, onPressed: () {}),
                CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0,
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
