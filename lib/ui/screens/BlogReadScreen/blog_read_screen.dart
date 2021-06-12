import 'dart:convert';
import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/models/documents/style.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/default_styles.dart';
import 'package:flutter_quill/widgets/editor.dart';

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
      final result = await rootBundle.loadString('assets/sample_blog.json');
      // conver this dtring into Document object
      final doc = Document.fromJson(jsonDecode(result));
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    } catch (error) {
      print("error while loading the file:" + error.toString());
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
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

  BlogToDisplay get blog => widget.blog;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'Merriweather',
        );
    //return Scaffold();
    return Scaffold(
      body: ListView(
        children: [
          //* Header imgae with appbar on top
          Container(
            width: double.infinity,
            height: 300,
            child: CachedNetworkImage(
              imageUrl: widget.blog.blogHeaderImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          //* Title
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Text(
              blog.title,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 25,
                  ),
            ),
          ),
          //* Description
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              blog.description,
              style: textStyle.copyWith(fontSize: 15),
            ),
          ),
          //* author name
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UserProfileScreen(username: blog.authorUsername))),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Written by ', style: textStyle),
                    TextSpan(
                        text: '${blog.authorName}',
                        style: textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
          ),
          //* the divider
          const Divider(color: BookGanga.kDarkBlack),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: (_controller == null)
                ? CircularProgressIndicator()
                : _buildBlogContent(context),
          ),
        ],
      ),
    );
  }
}
