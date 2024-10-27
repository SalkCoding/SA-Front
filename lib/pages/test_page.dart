import 'package:air_front/config/default_layout.dart';
import 'package:air_front/dto/users/users.dart';
import 'package:air_front/provider/image_server/image_server_provider.dart';
import 'package:air_front/provider/secure_storage/secure_storage_provider.dart';
import 'package:air_front/provider/user/user_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:air_front/config/variable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class TestPage extends ConsumerStatefulWidget {
  static String get routeName => 'test';
  const TestPage({super.key});

  @override
  ConsumerState<TestPage> createState() => _TestPageState();
}

class _TestPageState extends ConsumerState<TestPage> {
  FilePickerResult? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = result;
      });
    }
  }

  Future<void> _uploadFile(String token) async {
    if (_selectedFile == null) {
      print("이미지가 없음");
      return;
    }

    final file = _selectedFile!.files.single;
    final fileBytes = await file.bytes!.toList();
    print(_selectedFile!.files.single.extension);
    print(file.name);
    final mimeType = lookupMimeType(file.name, headerBytes: fileBytes);
    FormData formData = FormData();
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromBytes(
          fileBytes,
          filename: file.name,
          contentType: MediaType.parse(mimeType!),
        ),
      ),
    );

    // 업로드 요청
    try {
      final Dio dio = Dio();
      // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      final resp = await dio.post(
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
        Image_URL + 'image',
        data: formData,
        queryParameters: {"token": token},
      );
      if (resp.statusCode == 200) {
        print("File uploaded successfully");
        print(resp);
      } else {
        print("File upload failed with status: ${resp.statusCode}");
        print(resp);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print("Error response status: ${e.response!.statusCode}");
        print("Response data: ${e.response!.data}");
      } else {
        print("Error: ${e.error}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userProvider);
    final storage = ref.watch(secureStorageProvider);
    return DefaultLayoutScreen(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          InkWell(
            onTap: () async {
              if (state is Users) {
                await ref.read(imageServerProvider.notifier).getToken();
                print("함수 전부 실행 완료");
              }
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.black,
              child: Center(
                child: Text(
                  '토큰 발행',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // _pickedImage == null
          //       ? Text('No image selected.')
          //       : Image.memory(_pickedImage!),
          TextButton(onPressed: _pickFile, child: Text('이미지 선택')),
          TextButton(
              onPressed: () async {
                final iToken = await storage.read(key: IMAGE_TOKEN);
                if (iToken != null) {
                  _uploadFile(iToken);
                } else {
                  print("토큰이 없습니다.");
                }
              },
              child: Text('이미지 업로드')),
        ],
      )),
    );
  }

  String GenerateImageName() {
    var now = DateTime.now();
    return 'image_${now.year}${now.month}${now.day}_${now.hour}${now.minute}${now.second}.webp';
  }
}