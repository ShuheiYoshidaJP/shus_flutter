# shus_flutter

Shuhei Yoshida's Flutter project.

[Twitter](https://twitter.com/TyrionJP)
[Wantedly](https://www.wantedly.com/id/shuhei_yoshida_mob)

## Setting up

### [FVM](https://fvm.app/)

FVMが導入されてない場合、[Installation](https://fvm.app/docs/getting_started/installation) に従って導入してください。

```
fvm install
```

### [Freezed](https://pub.dev/packages/freezed), [Auto route](https://pub.dev/packages/auto_route)

[build runner](https://pub.dev/packages/build_runner) を使用してファイルを生成します。

```
make gen
```

## MLkit Pose Detection

[Pose Detection](https://developers.google.com/ml-kit/vision/pose-detection) を使用して人の画像にレンダリングを行います。

詳しくはこちら→[Watch me](https://github.com/ShuheiYoshidaJP/shus_flutter/blob/develop/lib/feature/pose/README.md)

<img src="https://github.com/ShuheiYoshidaJP/shus_flutter/blob/develop/README_ASSETS/pose_detection.gif" width="300">