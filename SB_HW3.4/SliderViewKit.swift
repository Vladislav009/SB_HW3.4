//
//  SliderViewKit.swift
//  SB_HW3.4
//
//  Created by Vladislav Kulak on 31.01.2022.
//

import SwiftUI

struct SliderViewKit: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    let opacity: Int
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(.red).withAlphaComponent(CGFloat(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
    
}

extension SliderViewKit {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func updateSlider(_ sender: UISlider ) {
            currentValue = Double(sender.value)
        }
        
    }
}

struct SliderViewKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderViewKit(currentValue: .constant(20), opacity: 30)
    }
}

