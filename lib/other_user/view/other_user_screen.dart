import 'package:flutter/material.dart';
import 'package:mustad_test/common/component/pagination/pagination_list_view.dart';
import 'package:mustad_test/other_user/model/other_user_model.dart';
import 'package:mustad_test/other_user/provider/other_user_provider.dart';

class OtherUserScreen extends StatefulWidget {
  const OtherUserScreen({super.key});

  @override
  State<OtherUserScreen> createState() => _OtherUserScreenState();
}

class _OtherUserScreenState extends State<OtherUserScreen> {
  List<String> checkedOtherUsers = [];
  @override
  Widget build(BuildContext context) {
    return PaginationListView<OtherUserModel>(
      provider: otherUserProvider,
      itemBuilder: <OtherUserModel>(_, __, model) {
        return _OtherUserItem(
          model: model,
          onChanged: (bool? value) {
            setState(() {
              if (value!) {
                checkedOtherUsers.add(model.userId);
              } else {
                checkedOtherUsers.remove(model.userId);
              }
              model.isChecked = value;
            });
          },
        );
      },
    );
  }
}

class _OtherUserItem extends StatelessWidget {
  final OtherUserModel model;
  final ValueChanged<bool?> onChanged;
  const _OtherUserItem({
    required this.model,
    required this.onChanged,
    super.key,});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      value: model.isChecked,
      onChanged: onChanged,
      secondary: Text(model.activeStatus == 'REGISTERED' ? 'REGISTERED' : 'CONFIRMED'),
      title: Row(
        children: [
          Text(model.name),
          const SizedBox(width: 8),
          Text(model.phoneNumber),
        ],
      ),
      subtitle: Text(model.email),
      selected: model.isChecked,
    );
  }
}

