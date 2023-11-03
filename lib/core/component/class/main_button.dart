
import 'package:persona2/core/config/routes/app.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.minimumSize,
    required this.text,
    this.borderRadius = 12,
    this.fontSizeText = 16,
    required this.onPressed,
    this.isTextCenter = true,
    this.isBorderSide = false,
    this.paddingVertical = 0.07,
    this.paddingHorizontal = 0.9,
    this.iconOrImageButtonWidget,
    this.textColor = AppColors.wColor,
    this.widthbetweenImageAndText = 0.0,
    this.backgroundColorButtonByMaterial,
    this.isQuestionMaterialColor = false,
    this.colorSide = AppColors.primaryColor,
    this.colorButton = AppColors.primaryColor,
    this.childWidget,
  });

  final String text;
  final Color colorSide;
  final Color textColor;
  final bool isBorderSide;
  final Color colorButton;
  final bool isTextCenter;
  final double borderRadius;
  final double fontSizeText;
  final VoidCallback onPressed;
  final double paddingVertical;
  final double paddingHorizontal;
  final double widthbetweenImageAndText;
  final Widget? iconOrImageButtonWidget;
  final bool isQuestionMaterialColor;
  final Color? backgroundColorButtonByMaterial;
  final MaterialStateProperty<Size?>? minimumSize;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * paddingHorizontal,
      height: context.h * paddingVertical,
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: minimumSize,
          side: isBorderSide
              ? MaterialStateProperty.all(
                  BorderSide(color: colorSide, width: 1.5),
                )
              : null,padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor: isQuestionMaterialColor
              ? MaterialStateProperty.all(backgroundColorButtonByMaterial)
              : MaterialStateProperty.all(colorButton),
        ),
        onPressed: onPressed,
        child: childWidget ?? Row(
          mainAxisAlignment:
              isTextCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            iconOrImageButtonWidget ?? const SizedBox.shrink(),
            context.sizeW(widthbetweenImageAndText),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSizeText,
                fontWeight: FontWeight.bold,
                color: isQuestionMaterialColor == true
                    ? AppColors.primaryColor
                    : textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
