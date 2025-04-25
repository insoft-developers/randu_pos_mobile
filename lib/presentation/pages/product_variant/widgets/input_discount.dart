import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';

class InputDiscount extends StatelessWidget {
  const InputDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: 'Free Item'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: CustomColors.primaryColor,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const CustomRoundedContainer(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    shadow: [],
                    child: Text(
                      'Rp',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomRoundedContainer(
                    color: CustomColors.primaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.white),
                    shadow: const [],
                    child: const Text(
                      '%',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomRoundedContainer(
                    color: CustomColors.primaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.white),
                    shadow: const [],
                    child: const Text(
                      'Free',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
