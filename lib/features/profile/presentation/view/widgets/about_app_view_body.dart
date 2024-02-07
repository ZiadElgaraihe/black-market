import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppViewBody extends StatelessWidget {
  const AboutAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 25.h),
          Text(
            'Black Market',
            style: TextStyles.textStyle28.copyWith(
              color: AppColors.yellow,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            'بكام في السوق السوداء؟!',
            style: TextStyles.textStyle14.copyWith(
              color: AppColors.lightYellowActive,
            ),
          ),
          const Spacer(),
          Text(
            '''
      تطبيق " بكام في السوق السوداء " والقائمين عليه وشركة Flux Tech ىمالكة التطبيق لا يقومون بالتجارة في العملة ولا يشجعون عليها... بل بالعكس تماما نشجع على الالتزام بالسوق الرسمي للعملات حفاظا علي أموالكم\n
      مع العلم أيضا أن الأسعار في التطبيق هي أسعار تقريبية للاسترشاد بها فقط لذلك الرجاء عدم الاعتماد عليها بشكل أساسي في حساب أموالكم\n
      ولا نتحمل أي مسؤولية مادية أو قانونية نتيجة الاعتماد عليها لأن الأرقام يتم تجميعها من وسائل الإعلام العامة والخاصة التي قد تكون غير دقيقة.\n
      تنويه هام..
      برجاء العلم أن تعاملات السوق السوداء غير قانونية ومجرمة بحكم القانون المصري ويفرض على القائم بها أو من يعمل في السوق السوداء بإجراءت عقابية وفوق كل هذا يعتبر إضرار بالأمن القومي لاقتصاد مصر والأمن القومي لاقتصادك كمواطن.
      ''',
            style: TextStyles.textStyle12,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
