//
//  ContentView.swift
//  test 4
//
//  Created by Machlan Pettersen on 10/1/21.
//
import CoreMotion
import SwiftUI
import Foundation
import Combine
import Accelerate
import simd
import PythonKit

let sys = Python.import("sys")

struct MotionView: View {
    
    @State var accelerate = false
    @State var time: Array = []
    @State var aX: Array<Double> = [0.0, 0.0]
    @State var aY: Array<Double> = [0.0, 0.0]
    @State var aZ: Array<Double> = [0.0, 0.0]
    @State var xDelta: Double = 0.0
    @State var yDelta: Double = 0.0
    @State var zDelta: Double = 0.0
    @State private var currentTime = 0.1
    @State private var previousTime = 0.0
    @State private var counter = 0
    
    
    @ObservedObject
    var motion: MotionManager
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        //button instance with closure
        VStack {
            Spacer()
            Text("Welcome to the QOR360.com active sitting App!")
                Spacer()
            
            Toggle(isOn: $accelerate)
            {
                Text("Start Session")
            }.padding()
            
            Spacer()
            
           
           if accelerate == true
           {
            
            Text("Session is in Progress!")
            
            Text("Time: \(currentTime)")
                .onReceive(timer)
                { input in
                    self.currentTime += 0.1
                    self.previousTime += 0.1
                    self.counter += 1
                    time.append(currentTime*0.1)
                    
                    
                    var xCurrent = aX[counter]
                    var xPrevious = aX[counter - 1]
                    xDelta = xCurrent - xPrevious
                    var yCurrent = aY[counter]
                    var yPrevious = aY[counter - 1]
                    yDelta = yCurrent - yPrevious
                    var zCurrent = aZ[counter]
                    var zPrevious = aZ[counter - 1]
                    zDelta = zCurrent - zPrevious
                    aX.append(abs(motion.x))
                    aY.append(abs(motion.y))
                    aZ.append(abs(motion.z))
                    
                    
                    
                }
            
            
            Spacer()
            Text("Max X Acceleration:\(aX.max()!*98/10)")
            Text("Max Y Acceleration:\(aY.max()!*98/10)")
            Text("Accelerometer Data")
            
           
            Text("X: \(round(xDelta*98)/10)")
                
            Text("Y: \(round(yDelta*98)/10)")
            
            Text("Z: \(round(zDelta*98)/10)")
            var testArray = Python.linspace(10,20)
            var testVal = testArray.max()!
            
            
            
            
      
           }
           else if accelerate == false
           {
            Button("Export Files")
            {
                
            }
            var totalX = abs(aX.reduce(0, +))
            var totalY = abs(aY.reduce(0, +))
            var totalZ = abs(aZ.reduce(0, +))
            Button("Reset Data")
            {
                
                currentTime = 0.0
                aX = [0.0]
                aY = [0.0]
                aZ = [0.0]
                totalX = 0
                totalY = 0
                totalZ = 0
            }.padding()
            
            
            
            Text("Total X: \(totalX)")
            Text("Total Y: \(totalY)")
            Text("Total z: \(totalZ)")
            Text("Array Size: \(aX.count)")
            Spacer()
           
            
           }
            
            
        
    }
        
        
}
    class MotionManager: ObservableObject {

        private var motionManager: CMMotionManager

        @Published
        var x: Double = 0.0
        @Published
        var y: Double = 0.0
        @Published
        var z: Double = 0.0
        @Published
        var accelX: Array<Double> = []
        @Published
        var accelY: Array<Double> = []
        @Published
        var accelZ: Array<Double> = []

        init() {
            self.motionManager = CMMotionManager()
            self.motionManager.accelerometerUpdateInterval = 1/10
            self.motionManager.startAccelerometerUpdates(to: .main) { (accelerometerData, error) in
                guard error == nil else {
                    print(error!)
                    return
                }

                if let motionData = accelerometerData {
                    self.x = (accelerometerData?.acceleration.x)!
                    self.accelX.append(self.x)
                    self.y = (accelerometerData?.acceleration.y)!
                    self.accelY.append(self.y)
                    self.z = (accelerometerData?.acceleration.z)!
                    self.accelZ.append(self.z)
                
                }

            }

        }
        
        
        
    }
    
    
    
    
    struct MotionView_Previews: PreviewProvider {
        static var previews: some View {
            MotionView( motion:
            MotionView.MotionManager())
        }
    }
}
    



