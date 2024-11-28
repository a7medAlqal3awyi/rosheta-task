import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/feature/upload_rosheta/prestentation/model_view/upload_rosheta_cubit.dart';

import '../model_view/upload_rosheta_state.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController termsController = TextEditingController();
  String? selectedImagePath;


  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    // Show a dialog to let the user choose between camera and gallery
    final XFile? pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () async {
                final pickedFile = await picker.pickImage(source: ImageSource.camera);
                Navigator.pop(context, pickedFile);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                Navigator.pop(context, pickedFile);
              },
            ),
          ],
        );
      },
    );

    if (pickedFile != null) {
      setState(() {
        selectedImagePath = pickedFile.path; // Save the selected image path
      });
    } else {
      // Handle the case where no image was selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UploadRoshetaCubit>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Upload Roshta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<UploadRoshetaCubit, UploadRoshtaState>(
              builder: (context, state) {
            if (state is UploadRoshtaLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UploadRoshtaSuccess) {

              return Center(
                child: Text(
                  'Success: ${state.response.message}',
                  style: const TextStyle(color: Colors.green, fontSize: 18),
                ),
              );
            }
            else if (state is UploadRoshtaError) {
              return Center(
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: idController,
                    decoration: const InputDecoration(labelText: 'ID'),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: termsController,
                    decoration: const InputDecoration(labelText: 'Terms'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: pickImage,
                    child: const Text('Pick Image'),
                  ),
                  const SizedBox(height: 10),
                  if (selectedImagePath != null)
                    Text('Selected Image: ${selectedImagePath!}'),
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedImagePath != null) {
                          cubit.uploadRoshta(
                            id: idController.text,
                            title: titleController.text,
                            terms: termsController.text,
                            imagePath: selectedImagePath!,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select an image'),
                            ),
                          );
                        }
                      },
                      child: const Text('Upload Roshta'),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
