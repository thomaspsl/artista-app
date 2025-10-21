import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShortArtwork extends StatefulWidget {
  const ShortArtwork({
    super.key,
    required this.url,
    required this.radius,
    required this.height,
    this.child,
  });

  final String url;
  final double radius;
  final double height;
  final Widget? child;

  @override
  State<ShortArtwork> createState() => _ShortArtworkState();
}

class _ShortArtworkState extends State<ShortArtwork>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  final double minScale = 1;
  final double maxScale = 5;
  double scale = 1;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )
      ..addListener(() => controller.value = animation!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(true),
    );
  }

  Widget buildImage(bool title) {
    return Builder(
      builder: (context) => InteractiveViewer(
        transformationController: controller,
        clipBehavior: Clip.none,
        panEnabled: false,
        minScale: minScale,
        maxScale: maxScale,
        onInteractionStart: (details) {
          if (details.pointerCount > 2) return;
          if (entry == null) showOverlay(context);
        },
        onInteractionUpdate: (details) {
          if (details.pointerCount > 2 || entry == null) return;
          this.scale = details.scale;
          entry!.markNeedsBuild();
        },
        onInteractionEnd: (details) {
          resetAnimation();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: SizedBox.fromSize(
            size: Size(MediaQuery.of(context).size.width - 40, widget.height),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: widget.height,
                  child: Image.network(
                    widget.url,
                    fit: BoxFit.cover,
                  ),
                ),
                (title) ? widget.child! : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    Size size = MediaQuery.of(context).size;

    entry = OverlayEntry(
      builder: (contextP) {
        double opacity = ((scale - 1) / (maxScale - 1)).clamp(0, 1);

        return Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: opacity,
                child: Container(color: AppColors.blackCoal),
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy - 94,
              width: size.width - 40,
              child: buildImage(false),
            ),
          ],
        );
      },
    );
    OverlayState overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  void resetAnimation() {
    animation = Matrix4Tween(begin: controller.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeOut));
    animationController.forward(from: 0);
  }
}
