//C:\Users\DELL\Documents\Cadt\cadty3t2\Flutter\another\w4\w4practice\lib\2_download_app\ui\screens\downloads\widgets\download_tile.dart
import 'package:flutter/material.dart';
 
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;
 
 // TODO

  @override
  Widget build(BuildContext context) {
    String statusText;

    if (controller.status == DownloadStatus.notDownloaded) {
      statusText = "Not downloaded";
    } else if (controller.status == DownloadStatus.downloading) {
      statusText = "Downloading";
    } else {
      statusText = "completed";
    }
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.ressource.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed:
                          controller.status == DownloadStatus.notDownloaded
                          ? controller.startDownload
                          : null,
                      icon: Icon(
                        controller.status == DownloadStatus.downloading
                            ? Icons.downloading
                            : controller.status == DownloadStatus.downloaded
                            ? Icons.folder
                            : Icons.file_download,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),
                  Text(
                    "${(controller.progress * 100).toStringAsFixed(1)}% - " "$statusText - "
                    "${(controller.progress * controller.ressource.size).toStringAsFixed(1)} "
                    "of ${controller.ressource.size} MB",
                    style: const TextStyle(fontSize: 12),
                  ),

                const SizedBox(height: 10),

                if (controller.status == DownloadStatus.downloading)
                  LinearProgressIndicator(value: controller.progress),
              ],
            ),
          ),
        );
      },
    );
  }
}
