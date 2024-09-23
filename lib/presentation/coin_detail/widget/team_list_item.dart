import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';
import 'package:flutter/material.dart';

class TeamListItem extends StatelessWidget {
  final TeamMember teamMember;

  const TeamListItem({
    super.key,
    required this.teamMember,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0), // Default to no padding if not provided
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teamMember.name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall, // Adjust to your desired text style
          ),
          const SizedBox(height: 4), // Spacer equivalent
          Text(
            teamMember.position,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }
}
