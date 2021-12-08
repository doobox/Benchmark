# Benchmark

A light weight gauge view written in SwiftUI.

<img src="https://github.com/doobox/DooGauge/blob/Master/gaugePreview.png" width="300">

## Installation

Xcode 11 and iOS 15 is required.

### Swift Package Manager

* Xcode: File -> Swift Packages -> Add Package Dependenc
* Paste https://github.com/doobox/Benchmark.git

### Manually

Drag `Benchmark.swift` into your project.

## Usage

### Import

Import the `Benchmark` in the file you would like to use it: 

```swift
import Benchmark
```

### Instantiate view

```swift
Benchmark(currentValue: 199, maxValue: 500, label: "Label", color1: .red, color2: .green, counterColor: .primary, labelColor: .secondary, minMaxColor: .primary, showLabel: true, showMinMax: true)
```
## License

`Benchmark` is distributed under the terms and conditions of the [MIT license](https://github.com/doobox/Benchmark/blob/Master/LICENSE).

## Credits

`Benchmark` is brought to you by [Doobox Software](https://www.doobox.co.uk). If you're using `Benchmark` in your project, attribution would be very appreciated.
