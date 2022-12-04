# Pose Detection

## Structure

```mermaid
graph LR
    A[Flutter] <--> B[Method Channel]
    B <--> C{Platform}
    C <-->|Android| D[Kotlin]
    C <-->|iOS| E[Swift]
    D <--> F[MLKit Pose Detection]
    E <--> F
```

## Rendering

<img src="https://github.com/ShuheiYoshidaJP/shus_flutter/tree/develop/README_ASSETS/rendering.png" width="300">

iOS [DrawRenderer.swift](https://github.com/ShuheiYoshidaJP/shus_flutter/blob/develop/ios/Runner/Feature/Pose/DrawRenderer.swift)

Android [DrawRenderer.kt](https://github.com/ShuheiYoshidaJP/shus_flutter/blob/develop/android/app/src/main/kotlin/com/example/shus_flutter/feature/pose/DrawRenderer.kt)