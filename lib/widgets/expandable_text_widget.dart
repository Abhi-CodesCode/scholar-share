import 'package:flutter/material.dart';
import 'package:scholar_shore/theme/dimensions.dart';
import 'package:scholar_shore/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final double textHeightRatio;
  String eligibilityText;
  String requirements;

  ExpandableTextWidget({
    Key? key,
    required this.text,
    this.textHeightRatio = 1,
    required this.eligibilityText,
    required this.requirements,
  }) : super(key: key);

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
          widget.text.substring(textHeight.toInt() + 1, widget.text.length )+" \n\n\nEligibility :"+widget.eligibilityText + "\n\n";
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
                      color: Colors.black, // assuming you want black color
                    ),
                    Icon(
                      hiddenText
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      color: Colors.black, // assuming you want black color
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
            // Wrap(
            //   children: [
            //
            //     Text(
            //
            //       "Eligibility: "+widget.eligibilityText,
            //     ),
            //   ],
            // ),
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: widget.requirements.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Row(
        //       children: [
        //         Text(' * '),
        //         Text(
        //           widget.requirements[index],
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ],
    );
  }
}
