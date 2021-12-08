import SwiftUI

func newGaugeValue(value: CGFloat, from: ClosedRange<CGFloat>) -> CGFloat {
    let result = ((value - from.lowerBound) / (from.upperBound - from.lowerBound)) * (0.75 - 0) + 0
    return result
}

#if arch(arm64)
@available(iOS 13.0, macOS 10.15, *)
public struct Benchmark: View {
    
    var progress: CGFloat
    var maxValue: CGFloat
    var label: String
    var color1: Color
    var color2: Color
    var counterColor: Color = .primary
    var labelColor: Color = .primary
    var minMaxColor: Color = .primary
    var showLabel: Bool = true
    var showMinMax: Bool = true
    
    private var cmtCurrentValue: CGFloat {
        if progress > maxValue {
            return maxValue
        }
        return progress
    }

    public init(progress: CGFloat, maxValue: CGFloat, label: String, color1: Color, color2: Color, counterColor: Color, labelColor: Color, minMaxColor: Color, showLabel: Bool, showMinMax: Bool) {
        self.progress = progress
        self.maxValue = maxValue
        self.label = label
        self.color1 = color1
        self.color2 = color2
        self.counterColor = counterColor
        self.labelColor = labelColor
        self.minMaxColor = minMaxColor
        self.showLabel = showLabel
        self.showMinMax = showMinMax
    }
    
    public var body: some View {
        GeometryReader { geometery in
            ZStack{
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(style: StrokeStyle.init(lineWidth: CGFloat(Int(geometery.size.width / 10)), lineCap: .round))
                    .foregroundColor(color2)
                    .padding(CGFloat(Int(geometery.size.width / 10)) / 2)
                    .rotationEffect(Angle(degrees: Double(-225)))
                
                Circle()
                    .trim(from: 0, to: newGaugeValue(value: cmtCurrentValue, from: 0...maxValue))
                    .stroke(style: StrokeStyle.init(lineWidth: CGFloat(Int(geometery.size.width / 10)), lineCap: .round))
                    .foregroundColor(color1)
                    .padding(CGFloat(Int(geometery.size.width / 10)) / 2)
                    .rotationEffect(Angle(degrees: Double(-225)))
                
                VStack{
                    Text("\(Int(cmtCurrentValue))")
                        .font(.system(size: CGFloat(Int(geometery.size.width / 3.5))).bold())
                        .foregroundColor(counterColor)
                    if showLabel {
                        Text(label)
                            .font(.system(size: CGFloat(Int(geometery.size.width / 8))))
                            .foregroundColor(labelColor)
                            .opacity(0.6)
                    }
                }
                
                if showMinMax {
                    HStack{
                        Text("0")
                            .font(.system(size: geometery.size.width > 250 ? 28 : CGFloat(Int(geometery.size.width / 9))))
                            .foregroundColor(minMaxColor)
                        
                        Spacer()
                        
                        Text("\(Int(maxValue))")
                            .font(.system(size: geometery.size.width > 250 ? 28 : CGFloat(Int(geometery.size.width / 9))))
                            .foregroundColor(minMaxColor)
                    }
                    .frame(width: geometery.size.width / 2.1, alignment: .center)
                    .offset(y: geometery.size.height / 2.7)
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
#endif

/*
@available(iOS 13.0, macOS 10.15, *)
struct Doo_a_Gauge_Previews: PreviewProvider {
    static var previews: some View {
        Benchmark(progress: 45, maxValue: 180, label: "Label", color1: .red, color2: .green, counterColor: .primary, labelColor: .secondary, minMaxColor: .primary, showLabel: true, showMinMax: true)
            .frame(width: 300)
    }
}
 */
 
