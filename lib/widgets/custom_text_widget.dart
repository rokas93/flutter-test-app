import 'package:flutter/cupertino.dart';
import 'package:second_app/utils/colors.dart';

class CustomText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final FontWeight weight;
  final TextAlign align;

  const CustomText({
    Key? key,
    required this.text,
    this.color = AppColors.blackColor,
    this.weight = FontWeight.w500,
    this.size = 16,
    this.align = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
        color: color,
        fontFamily: 'Montserrat',
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
