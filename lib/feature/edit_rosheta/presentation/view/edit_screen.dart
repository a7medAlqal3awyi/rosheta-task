import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/feature/edit_rosheta/presentation/model_view/edit_rosheta_cubit.dart';
import 'package:task/feature/edit_rosheta/presentation/model_view/edit_rosheta_state.dart';
import 'package:task/feature/upload_rosheta/prestentation/model_view/upload_rosheta_cubit.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController termsController = TextEditingController();
  final TextEditingController specialController = TextEditingController();
  String? selectedImagePath;


  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

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
        selectedImagePath = pickedFile.path;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditRoshetaCubit>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Roshta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<EditRoshetaCubit, EditRoshtaState>(
              builder: (context, state) {
                if (state is EditRoshtaLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                else if (state is EditRoshtaSuccess) {

                  return Center(
                    child: Text(
                      'Success: ${state.response.message}',
                      style: const TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  );
                }
                else if (state is EditRoshtaError) {
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
                        controller: termsController,
                        decoration: const InputDecoration(labelText: 'Terms'),
                      ),
                      TextField(
                        controller: specialController,
                        decoration: const InputDecoration(labelText: 'special'),
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
                              cubit.editRosheta(

                                terms: termsController.text,
                                special: specialController.text,
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
                          child: const Text('Edit Roshta'),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
