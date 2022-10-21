
import 'package:flutter/material.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:main_project/app/utities/fonts/font.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../view_model/lend_provider.dart';

class LendDatePickWidget extends StatelessWidget {
  const LendDatePickWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final LendProvider provider;

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
            '(lend availability till ?)',
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
              Consumer<LendProvider>(builder: (context, obj, _) {
                
                return Text( obj.dateNew ?? DateFormat('yyyy-MM-dd').format(obj.dateNow),
                    style: viga(
                        fsize: 12,
                        fweight: FontWeight.w600,
                        flettrspc: 1.5,
                        fcolor: kGreenColor.withOpacity(.5)));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
