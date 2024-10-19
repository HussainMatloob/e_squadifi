import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/color_constants.dart';
import '../../main.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String>? dropDownButtonList;
  final String? text;
  const CustomDropDownButton({super.key, this.dropDownButtonList, this.text});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedValue;
  void selectDropDownListValue(String value){
    setState(() {
      selectedValue=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                SizedBox(
                  width:  3.w,
                ),
                Expanded(
                  child:  CustomText(widget.text,fw: FontWeight.w400,size: 12.sp,color: ColorConstant.whiteColor,)
                ),
              ],
            ),
            items: widget.dropDownButtonList!
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )).toList(),
            value: selectedValue,
            onChanged: (value) {
               selectDropDownListValue(value.toString());
            },
            buttonStyleData: ButtonStyleData(
              height:  57.h,
              width: 311.w,
              padding: EdgeInsets.only(
                  left: mq.width * 0.03, right: mq.width * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(93),
                border: Border.all(
                  color: Colors.transparent,
                ),
                color:  ColorConstant.greyLightColor,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
              ),
              iconSize: 20,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: mq.height * 0.2,
              width: null, // Let it automatically adjust to button width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorConstant.greyColor,
              ),
              offset: Offset(
                  0, 0), // Adjust based on your need, initially try (0, 0)
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
          ),
    );
  }
}
