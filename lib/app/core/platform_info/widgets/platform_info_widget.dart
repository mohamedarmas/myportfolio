import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:site/app/core/tokens/app_text_styles.dart';

class PlatformInfoWidget extends StatefulWidget {
  const PlatformInfoWidget({
    super.key,
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  State<PlatformInfoWidget> createState() => _PlatformInfoWidgetState();
}

class _PlatformInfoWidgetState extends State<PlatformInfoWidget> {
  late Future<PackageInfo> packageInfo;

  EdgeInsets get padding => widget.padding;

  @override
  void initState() {
    super.initState();
    packageInfo = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: packageInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data!;
          final buildNumber = data.buildNumber;
          final text =
              'v${data.version}${buildNumber.isEmpty ? '' : '+$buildNumber'}';

          return Padding(
            padding: padding,
            child: SelectableText(
              text,
              style: AppTextStyles.f24WhiteFW500,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
