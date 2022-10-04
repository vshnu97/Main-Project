import 'package:flutter/material.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DatepickWidget extends StatelessWidget {
  const DatepickWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final NeedJobPostProvider provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        provider.datePicker(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Date *',
              style: dmSans(
                  fcolor: kGreenColor, fsize: 18, fweight: FontWeight.w700)),
          Text(
            '(your available till ?)',
            textAlign: TextAlign.center,
            style: dmSans(
                fcolor: kGreenColor, fsize: 12, fweight: FontWeight.w400),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  provider.datePicker(context);
                },
                icon: const Icon(
                  Icons.calendar_month,
                  size: 28,
                  color: kyellowColor,
                ),
              ),
              Consumer<NeedJobPostProvider>(
                builder: (context, obj, _) => Text(
                    DateFormat('yMd').format(obj.dateNow),
                    style: viga(
                        fsize: 12,
                        fweight: FontWeight.w600,
                        flettrspc: 1.5,
                        fcolor: kGreenColor.withOpacity(.5))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}