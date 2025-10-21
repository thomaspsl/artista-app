import 'package:custom_gallery_display/custom_gallery_display.dart';
import 'package:flutter/material.dart';

class AddPostContent extends StatefulWidget {
  const AddPostContent({super.key});

  @override
  State<AddPostContent> createState() => _AddPostContentState();
}

class _AddPostContentState extends State<AddPostContent> {
  @override
  Widget build(BuildContext context) {
    return CustomGalleryDisplay.instagramDisplay(
      displaySource: DisplaySource.both,
      pickerSource: PickerSource.image,
      multiSelection: false,
      cropImage: true,
      galleryDisplaySettings: GalleryDisplaySettings(
        appTheme: AppTheme(
          primaryColor: Theme.of(context).backgroundColor,
          focusColor: Theme.of(context).primaryColor,
        ),
        tabsTexts: TabsTexts(
          videoText: "Vidéo",
          photoText: "Photo",
          clearImagesText: "Supprimer les images sélectionnées",
          galleryText: "Galerie",
          deletingText: "Supprimer",
          limitingText: "La limite est de 10 photos ou vidéos.",
          notFoundingCameraText: "La caméra secondaire introuvable",
          holdButtonText: "Appuyer et maintener pour enregistrer",
          noImagesFounded: "Il n'y a pas d'images",
          acceptAllPermissions:
              "Échec ! Accepter toutes les autorisations d'accès.",
        ),
      ),
      onDone: (SelectedImagesDetails details) async {},
    );
  }
}
