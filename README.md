# Portfolio

Open Source Portfolio flutter app.

## Output
![Portfolio App Demo](sample_output.gif)

# Follow below step to successfully run this project after cloing this
### Read complete guide to enable web support at [get started web](https://flutter.dev/docs/get-started/web)

Step 1: run below command in `terminal` to switch to `dev` channel,
```
 flutter channel dev
 flutter upgrade
```

Step 2: enter below command to enable web support,
 `flutter config --enable-web`
 
Step 3: To run the app choose chrome from device dropdown or run `flutter run -d chrome`

# [Building the app for release](https://flutter.dev/docs/deployment/web#building-the-app-for-release)
Build the app for deployment using the `flutter build web` command. 
This generates the app, including the assets, and places the files into the /build/web directory of the project.

The release build of a simple app has the following structure:
```
content_copy
/build/web
  assets
    AssetManifest.json
    FontManifest.json
    LICENSE
    fonts
      MaterialIcons-Regular.ttf
      <other font files>
    <image files>
  index.html
  main.dart.js
  main.dart.js.map
```

# How Deploy your project on Github?
Read https://pages.github.com/
