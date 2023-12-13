import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class SingleDownloadScreen extends StatefulWidget {
  const SingleDownloadScreen({
    super.key,
  });

  @override
  State<SingleDownloadScreen> createState() => _SingleDownloadScreenState();
}

class _SingleDownloadScreenState extends State<SingleDownloadScreen> {
  TextEditingController url = TextEditingController();
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Download any file from URL\nin flutter',
              style: TextStyle(
                fontSize: 16,
                //Text('https://images.unsplash.com/photo-1618042164219-62c820f10723?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG93bmxvYWR8ZW58MHx8MHx8fDA%3D')
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: url,
              decoration: const InputDecoration(label: Text('Url*')),
            ),
            const SizedBox(height: 16),
            _progress != null
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      FileDownloader.downloadFile(
                          url: url.text.trim(),
                          onProgress: (name, progress) {
                            setState(() {
                              _progress = progress;
                            });
                          },
                          onDownloadCompleted: (value) {
                            // print('path  $value ');
                            setState(() {
                              _progress = null;
                            });
                          });
                    },
                    child: const Text('Download')),
          ],
        ),
      ),
    );
  }
}
