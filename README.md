# ios-youtube-thumbnail-generator
Initial design based on this [fairly popular design](https://www.canva.com/p/templates/EAEqfS4X0Xw-most-attractive-youtube-thumbnail)

A SwiftUI based YouTube video thumbnail generator.
* Supply the main, top & bottom titles and a graphic to display on the right
* Run the app and tap the design to be prompted to save the design as an image to your Photos
* Photos are saved in the devices' native resolution. YouTube specifies the image dimensions to be 1280x720px with aspect ratio 16:9.
* The screenshot view is fixed at 640x360 (16:9) and the image saves on an iPhone 14 for example at a resolution of 1920x1080
* Check out the result below. If you want to see how it looks on YouTube you can do so [here on my channel.](https://www.youtube.com/@swiftodyssey/videos)


# Result:
![Thumbnail](https://github.com/anupdsouza/ios-youtube-thumbnail-generator/assets/103429618/2416fa93-eeb4-4b97-9f6f-3601ec3de8cc)

# TODO:
- [x] Scale result to 1280x720
- [ ] Display layouts in a dynamic updatable carousel that provides an input form below based on the design to allow for realtime editing.
- [ ] Add more layout options and designs. Feel free to contribute by forking this project and raising a PR.
