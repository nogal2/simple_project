import 'package:flutter/material.dart';
import 'package:mustad_test/brand/model/brand_model.dart';
import 'package:mustad_test/brand/provider/brand_provider.dart';
import 'package:mustad_test/common/component/pagination/pagination_list_view.dart';
import 'package:mustad_test/common/const/colors.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  List<int> checkedBrands = [];

  @override
  Widget build(BuildContext context) {
    return PaginationListView<BrandModel>(
      provider: brandProvider,
      itemBuilder: (_, __, model) {
        return _BrandItem(
          model: model,
          onChanged: (bool? value) {
            setState(
              () {
                if (value!) {
                  checkedBrands.add(model.id);
                } else {
                  checkedBrands.remove(model.id);
                }
                model.isChecked = value;
              },
            );
          },
        );
      },
    );
  }
}

class _BrandItem extends StatelessWidget {
  final BrandModel model;
  final ValueChanged<bool?> onChanged;

  const _BrandItem({
    required this.model,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      secondary: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: model.activated == 'ACTIVE' ? Colors.green : Colors.red,
          shape: BoxShape.circle,
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 10, right: 20),
      title: Row(
        children: [
          Text(model.brandName),
          const SizedBox(width: 8.0),
          Text(
            '(${model.businessCategory.businessCategoryName})',
            style: TextStyle(
              color: model.businessCategory.businessCategoryName == '체육시설'
                  ? SPORTS_COLOR
                  : FOOD_COLOR,
            ),
          ),
          const SizedBox(width: 8.0),
          Text('스토어수: ${model.placeCount.toString()}'),
        ],
      ),
      selected: model.isChecked,
      subtitle: Row(
        children: [
          Text(model.ownerName ?? '담당자'),
          const SizedBox(width: 8.0),
          Text(model.phoneNumber),
        ],
      ),
      value: model.isChecked,
      onChanged: onChanged,
    );
  }
}
