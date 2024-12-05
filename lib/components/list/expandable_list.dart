import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/components/cards/child_card.dart';
import 'package:yh_design_system/components/cards/expandable_card.dart';
import 'package:yh_design_system/components/text/text.dart';
import 'package:yh_design_system/fonts.dart';
import 'package:yh_design_system/components/lists/app_expansion_panel.dart';
import 'package:yh_design_system/images.dart';

abstract class OpenableObject {
  final Object object;
  final List<ChildObject> children;
  final int id;
  final YHImage leadingImage;
  final String text;
  final String? rightText;
  final bool isExpand;

  OpenableObject(
    this.object,
    this.children,
    this.id,
    this.leadingImage,
    this.text,
    this.rightText,
    this.isExpand,
  );
}

abstract class ChildObject {
  final Object object;
  final int id;
  final YHImage leadingImage;
  final String text;
  final String? rightText;
  final bool isSelect;

  ChildObject(this.object, this.id, this.leadingImage, this.text,
      this.rightText, this.isSelect);
}

class ExpandableList extends StatelessWidget {
  const ExpandableList({
    super.key,
    required this.objects,
    required this.emptyText,
    required this.onTapOpenable,
    this.onLongPressedOpenable,
    required this.onTapChild,
    this.onLongPressedChild,
    this.onTapAddButton,
    this.showSelected = true,
    this.showAddButton = true,
    this.showExpanedNotes = true,
    this.showExpandableArrow = true,
    this.showChildArrow = true,
  });

  final List<OpenableObject> objects;
  final String emptyText;
  final void Function(int id, bool isExpand) onTapOpenable;
  final void Function(int id)? onLongPressedOpenable;
  final void Function(Object object) onTapChild;
  final void Function(Object object)? onLongPressedChild;
  final void Function(Object object)? onTapAddButton;

  final bool showSelected;
  final bool showAddButton;
  final bool showExpanedNotes;
  final bool showExpandableArrow;
  final bool showChildArrow;

  @override
  Widget build(BuildContext context) {
    if (objects.isEmpty) {
      return Expanded(
          child: Center(
        child: YHText(text: emptyText, font: YHFont.h4, color: YHColor.black),
      ));
    }

    return Flexible(
        child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 100), // contentInset
      child: AppExpansionPanelList(
        expansionCallback: onTapOpenable,
        onHeaderLongPress: onLongPressedOpenable,
        elevation: 0,
        dividerColor: Colors.transparent,
        children: objects.map<AppExpansionPanel>((OpenableObject object) {
          return AppExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: Colors.transparent,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return YHExpandableCard(
                object: object,
                onTapAddButton: onTapAddButton,
                isSelected: showSelected &&
                    object.children.every((o) => o.isSelect) &&
                    object.children.isNotEmpty,
                showAddButton: showAddButton,
                showArrow: showExpandableArrow,
              );
            },
            keyId: object.id,
            body: Column(
              children: object.children
                  .map((childObject) => YHChildCard(
                        object: childObject,
                        onTap: onTapChild,
                        onLongPress: onLongPressedChild,
                        isSelected: showSelected && childObject.isSelect,
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        showRight: showChildArrow,
                      ))
                  .toList(),
            ),
            isExpanded: showExpanedNotes ? object.isExpand : false,
            iconBuilder: (child, isExpanded) {
              return null;
            },
          );
        }).toList(),
      ),
    ));
  }
}
