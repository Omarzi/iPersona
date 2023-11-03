import 'package:persona2/core/config/routes/app.dart';

class OpenEndDrawerButton extends StatelessWidget {
  const OpenEndDrawerButton({super.key, required this.scaffoldKey});
 final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(right: 20.w),
      onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
      icon: Icon(
        Icons.menu,
        size: 40,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
