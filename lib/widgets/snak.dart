import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnakBar(String contexts, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(contexts)));
}
//Image Picker Code
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile ? file = await imagePicker.pickImage(source: source);

  if(file != null){
    return await file.readAsBytes();
  }
  print('No Image Selected');
}

///colors
const blueColor = Color(0xff3776FF);
const orangeColor = Color(0xffF0AD2B);
const purpleColor = Color(0xff5264FA);
const redColor = Color(0xffFF7575);
const greenColor = Color(0xff33D230);
const lightBlueColor = Color(0xff0085FF);
const extraLightBlueColor = Color(0xffD9E5FF);
const darkGreyColor = Color(0xff313131);
const greyColor = Color(0xffA6A6A6);
const darkRedColor = Color(0xffE80046);
const callButtonBackgroundColor = Color(0xffDDDDDD);

///gradients
var linearGradientBlue = const LinearGradient(colors: [
  Color(0xff6B7BFA),
  Color(0xff3776FF),
]);

var linearGradientGrey = LinearGradient(
  colors: [
    const Color(0xff313131),
    const Color(0xff313131).withOpacity(0.8),
    const Color(0xff313131),
  ],
  begin: Alignment.center,
);

 gradientBigButton(
      {width,
      height,
      borderColor,
      onTap,
      borderWidth,
      borderRadius,
      containerColor,
      text,
      enabled,
      shadowColors,
      textColor,
      fontSize,
      fontWeight}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth == null ? 2 : borderWidth.toDouble()),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          gradient: enabled == true
              ? LinearGradient(colors: [
                  Colors.grey.withOpacity(0.5),
                  Colors.grey.withOpacity(0.5),
                ])
              : const LinearGradient(colors: [
                  blueColor,
                  purpleColor,
                ]),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: shadowColors ?? Colors.black.withOpacity(0.2),
              blurRadius: 4,
            )
          ],
        ),
        child: Center(
          child: Text(
            text.toString(),
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: fontSize == null ? 13.0 : fontSize.toDouble(),
              fontWeight: fontWeight ?? FontWeight.bold,
              fontFamily: "ProximaNova",
            ),
          ),
        ),
      ),
    );
  }
