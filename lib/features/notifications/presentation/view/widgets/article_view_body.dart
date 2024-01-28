import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ArticleViewBody extends StatelessWidget {
  const ArticleViewBody({
    super.key,
    required this.banner,
  });

  final String banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.w),
            ),
            child: CachedNetworkImage(
              imageUrl: banner,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                'كواليس سقوط 5 من تُجار العُملة الصعبة بالمحافظات',
                style: TextStyles.textStyle16.copyWith(
                  color: AppColors.lightYellowActive,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'وجهت وزارة الداخلية ضربة لعدد من المتهمين بغسل الأموال الناتجة عن الاتجار بـ"العُملة الصعبة" خارج السوق المصرفي "السوق السوداء".',
                style: TextStyles.textStyle12.copyWith(
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 32.h),
              HtmlWidget(
                '<p style="text-align: right;"><strong>وجهت وزارة الداخلية ضربة لعدد من المتهمين بغسل الأموال الناتجة عن الاتجار بـ"العُملة الصعبة" خارج السوق المصرفي "السوق السوداء".</strong></p>\r\n<p style="text-align: right;">&nbsp;</p>\r\n<p style="text-align: right;">&nbsp; وتمكن قطاع الأمن العام بمشاركة عدد من مديريات الأمن من تحقيق النتائج التالية:-&nbsp;</p>\r\n<p style="text-align: right;">&nbsp;</p>\r\n<p style="text-align: right;"><strong>ضبط (أحد الأشخاص - مقيم بدائرة قسم شرطة أول الغردقة) حال تواجده بدائرة القسم، وبحوزته (مبالغ مالية "عملات محلية وأجنبية")، بقصد الإتجار في النقد الأجنبي خارج السوق المصرفي.&nbsp; </strong></p>\r\n<p style="text-align: right;">&nbsp;</p>\r\n<p style="text-align: right;">كما ضبط (شخصين &ndash; مقيمين بمحافظة قنا)، وبحوزتهما (مبالغ مالية "عملات محلية وأجنبية")، قاما بتجميعها من العاملين بالخارج بقصد الإتجار في النقد الأجنبي خارج السوق المصرفي.</p>\r\n<p style="text-align: right;">&nbsp;</p>\r\n<p style="text-align: right;"><strong>&nbsp; كما أثمرت الجهود عن ضبط شخصين بنطاق محافظة الغربية، وبحوزتهما (مبالغ مالية "عملات محلية وأجنبية")، بقصد الإتجار في النقد الأجنبي خارج نطاق السوق المصرفي، وتم اتخاذ الإجراءات القانونية. </strong></p>',
                textStyle: TextStyles.textStyle10.copyWith(
                    // color: AppColors.grey,
                    ),
              ),
              // Text(
              //   '',
              //   style: TextStyles.textStyle12.copyWith(
              //     color: AppColors.grey,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
