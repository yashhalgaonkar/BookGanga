import 'dart:convert';

import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/default_styles.dart';
import 'package:flutter_quill/widgets/editor.dart';

class BlogWriteScreen extends StatefulWidget {
  const BlogWriteScreen({Key key}) : super(key: key);

  @override
  _BlogWriteScreenState createState() => _BlogWriteScreenState();
}

class _BlogWriteScreenState extends State<BlogWriteScreen> {
  // QuillController _controller = QuillController(
  //     document: Document.fromJson(jsonDecode("{}")),
  //     selection: TextSelection.collapsed(offset: 0));

  final FocusNode _focusNode = FocusNode();

  Widget _buildBlogContent(BuildContext context) {
    // final quillEditor = QuillEditor(
    //   scrollBottomInset: 0,
    //   controller: _controller,
    //   scrollController: ScrollController(),
    //   scrollable: true,
    //   focusNode: _focusNode,
    //   showCursor: true,
    //   autoFocus: true,
    //   readOnly: false,
    //   expands: false,
    //   placeholder: 'Loading content...',
    //   padding: EdgeInsets.zero,
    //   customStyles: DefaultStyles(
    //     color: BookGanga.kDarkBlack,
    //   ),
    // );

    // return quillEditor;
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () => print('Published'),
            child: Center(
              child: Text(
                'PUBLISH',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 16,
                      color: BookGanga.kAccentColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          )
        ],
      ),
      body: _buildBlogContent(context),
    );
  }
}
