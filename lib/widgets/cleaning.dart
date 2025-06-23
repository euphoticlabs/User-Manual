import 'package:flutter/material.dart';
import 'package:user_manual/constants/text_constants.dart';
import 'package:user_manual/widgets/day_to_day_cleaning.dart';

class CleaningWidget extends StatelessWidget {
  const CleaningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50), 
            child: Text(
              'Cleaning',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCleaningButton(
                  context,
                  icon: Icons.access_time,
                  label: TextConstants.dayToDayCleaning,
                  onPressed: () {
                   
                  },
                ),
                const SizedBox(height: 24),
                _buildCleaningButton(
                  context,
                  icon: Icons.refresh,
                  label: TextConstants.monthlyCleaning,
                  onPressed: () {
                    // TODO: Navigate to Monthly Cleaning section
                  },
                ),
                const SizedBox(height: 24),
                _buildCleaningButton(
                  context,
                  icon: Icons.hourglass_empty,
                  label: TextConstants.everyFourMonths,
                  onPressed: () {
                    // TODO: Navigate to Every 4 Months section
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCleaningButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return OutlinedButton.icon(
      icon: Icon(icon, color: const Color(0xFFFF6B2C)),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFFF6B2C), width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        minimumSize: const Size(280, 50),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
} 