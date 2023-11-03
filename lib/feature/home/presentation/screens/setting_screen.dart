import 'package:persona2/core/config/routes/app.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool textMessages = false;
  bool phoneCalls = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          AppLocalizations.of(context)!.translate('settings')!,
          //AppLocalizations.of(context)!.translate(AppStrings.workout)!
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account settings",
              style: TextStyle(
                  fontSize: 20.r,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF677294)),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: SettingModel.listSettingData.length,
                itemBuilder: (context, index) {
                  var item = SettingModel.listSettingData[index];
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: item.color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item.icon,
                        color: AppColors.wColor,
                      ),
                    ),
                    title: Text(item.title),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  );
                },
              ),
            ),
            Text(
              "More Options",
              style: TextStyle(
                  fontSize: 20.r,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF677294)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Text messages',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: textMessages,
                    onChanged: (value) {
                      textMessages = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone calls',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: phoneCalls,
                    onChanged: (value) {
                      phoneCalls = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            const ChangeLang(),
            Spacer()
          ],
        ),
      ),
    );
  }
}
