import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/pages/home.dart';
import 'package:scholar_shore/pages/scheme_detail_page.dart';
import 'package:scholar_shore/theme/theme_colors.dart';
import 'package:scholar_shore/widgets/small_text.dart';

import '../theme/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final double textHeightRatio;
  final List<String> elegibiltyCrit;
  final List<String> requirements;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    this.textHeightRatio = 1, required this.elegibiltyCrit, required this.requirements,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    double textHeight = Dimensions.screenHeight / 2.2 * widget.textHeightRatio;
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: secondHalf.isEmpty
              ? SmallText(
                  text: firstHalf,
                  relativeSize: 1.25,
                  height: 1.4,
                )
              : Column(
                  children: [
                    SmallText(
                      text:
                          hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                      relativeSize: 1.25,
                      height: 1.4,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          hiddenText = !hiddenText;
                        });
                      },
                      child: Row(
                        children: [
                          SmallText(
                            text: hiddenText ? "Show more" : "Show less",
                            color: ThemeColors.fontColor2,
                          ),
                          Icon(
                            hiddenText
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: ThemeColors.fontColor1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    )
                  ],
                ),
        ),
        ListView.builder(shrinkWrap: true,itemCount: eligibilityText.length,itemBuilder: (BuildContext context,int index){
          return Row(
            children: [
              Text(' ~'),
              Text(
                eligibilityText[index],
              ),
            ],
          );
        }),
        ListView.builder(shrinkWrap: true,itemCount: requirements.length,itemBuilder: (BuildContext context,int index){
          return Row(
            children: [
              Text(' * '),
              Text(
                requirements[index],
              ),
            ],
          );
        }),
      ],
    );
  }
}
