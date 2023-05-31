import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 135,
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: image(),
                  width: 80,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: StyleThemes.title.withColor(
                        AppColors.primaryColor,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: StyleThemes.subtitle.withColor(Colors.black38),
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ImageProvider<Object> image() {
    return imageUrl.contains("assets/images/")
        ? AssetImage(imageUrl)
        : NetworkImage(imageUrl) as ImageProvider<Object>;
  }
}
