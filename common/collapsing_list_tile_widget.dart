import 'package:flutter/material.dart';
import 'package:sidebar2/custom_navigation_drawer.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final Animation<double> animationController;
  final bool isSelected;
  final VoidCallback? onTap;

  const CollapsingListTile({
    required this.title,
    required this.icon,
    required this.animationController,
    this.isSelected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  late Animation<double> widthAnimation;
  late Animation<double> sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation = Tween<double>(begin: 200, end: 70)
        .animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(begin: 10, end: 0)
        .animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              color: widget.isSelected
                  ? Colors.transparent.withOpacity(0.3)
                  : Colors.transparent,
            ),
            width: widthAnimation.value,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  widget.icon,
                  color:
                  widget.isSelected ? selectedColor : Colors.white30,
                  size: 38.0,
                ),
                SizedBox(width: sizedBoxAnimation.value),
                (widthAnimation.value >= 190)
                    ? Text(
                  widget.title,
                  style: widget.isSelected
                      ? listTitleSelectedTextStyle
                      : listTitleDefaultTextStyle,
                )
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
