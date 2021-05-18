import 'dart:convert';

import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/default_styles.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class BlogViewScreen extends StatefulWidget {
  final BlogToDisplay blog;

  BlogViewScreen({@required this.blog});

  @override
  _BlogViewScreenState createState() => _BlogViewScreenState();
}

class _BlogViewScreenState extends State<BlogViewScreen> {
  QuillController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadFromAssets();
  }

  Future<void> _loadFromAssets() async {
    try {
      // this is the string that comes from API
      final result = await rootBundle.loadString('assets/sample_data.json');
      // conver this dtring into Document object
      final doc = Document.fromJson(jsonDecode(result));
      setState(() {
        _controller =
            QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    } catch (error) {
      print("error while loading the file:" + error.toString());
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller =
            QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    }
  }

  Widget _buildBlogContent(BuildContext context) {
    final quillEditor = QuillEditor(
      scrollBottomInset: 0,
      controller: _controller,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: _focusNode,
      showCursor: false,
      autoFocus: true,
      readOnly: true,
      expands: false,
      placeholder: 'Loading content...',
      padding: EdgeInsets.zero,
      customStyles: DefaultStyles(
        color: BookGanga.kDarkBlack,
      ),
    );

    return quillEditor;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          //* Header imgae with appbar on top
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1614517409437-2e25e4f5dbed?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDEyfHJuU0tESHd3WVVrfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Ionicons.arrow_back),
                  onPressed: () {},
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          //* Title
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Text(
              'Love in my generation',
              style: GoogleFonts.notoSans(
                color: BookGanga.kDarkBlack,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          //* Description
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'My views on how our generation loves and gets over it.',
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                color: BookGanga.kDarkBlack.withOpacity(0.8),
              ),
            ),
          ),
          //* author name
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Written by ',
                    style: GoogleFonts.notoSans(
                      color: BookGanga.kDarkBlack.withOpacity(0.8),
                    ),
                  ),
                  TextSpan(
                    text: 'Yash Halgaonkar',
                    style: GoogleFonts.notoSans(
                      color: BookGanga.kDarkBlack.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //* the divider
          const Divider(
            color: BookGanga.kDarkBlack,
            thickness: 2,
            endIndent: 10,
            indent: 10,
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: (_controller == null) ? CircularProgressIndicator() : _buildBlogContent(context),
          ),
        ],
      ),
    );
  }
}
