import 'package:flutter/material.dart';
import 'package:qr_code/constants/color_lists.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRView extends StatefulWidget {
  const QRView({super.key});

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  late final TextEditingController _textEditingController;
  late final FocusNode _textFocus;
  String qrText = '';
  int qrColorIndex = 0;
  int qrBackgroundColorIndex = 0;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: qrText);
    _textFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController;
    _textFocus;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: QrImageView(
                    data: qrText,
                    padding: const EdgeInsets.all(16),
                    backgroundColor: qrBackgroundColors[qrBackgroundColorIndex],
                    eyeStyle: QrEyeStyle(
                      color: qrColors[qrColorIndex],
                      eyeShape: QrEyeShape.square,
                    ),
                    foregroundColor: qrColors[qrColorIndex],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _textEditingController,
                      focusNode: _textFocus,
                      decoration: InputDecoration(
                        labelText: 'QR Text',
                        labelStyle: const TextStyle(
                          color: Color(0xFF80919F),
                        ),
                        hintText: 'Enter URL or Text',
                        hintStyle: const TextStyle(
                          color: Color(0xFF80919F),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        qrText = value;
                      }),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Choose QR Color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemCount: qrColors.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => setState(() {
                              qrColorIndex = index;
                            }),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: qrColorIndex == index ? 23 : 22,
                                  backgroundColor: qrColorIndex == index
                                      ? Colors.black
                                      : Colors.black26,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: qrColors[index],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Text(
                      'Choose QR Background Color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemCount: qrBackgroundColors.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => setState(() {
                              qrBackgroundColorIndex = index;
                            }),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius:
                                      qrBackgroundColorIndex == index ? 23 : 22,
                                  backgroundColor:
                                      qrBackgroundColorIndex == index
                                          ? Colors.black
                                          : Colors.black26,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: qrBackgroundColors[index],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
