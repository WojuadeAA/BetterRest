//
//  ContentView.swift
//  BetterRest
//
//  Created by Wojuade Abdul Afeez on 13/12/2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    static var defaultWakeTime : Date {
        var component = DateComponents()
        component.hour = 5
        component.minute = 0
        return Calendar.current.date(from: component) ?? .now
    }
    var body: some View {
        NavigationStack{
            Form {
                
            Section{
                    Text("When do you want to wake up")
                        .font(.headline)
                    DatePicker("Please enter a Time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                    
                }
                
                Section{ Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount,in :4...12,step: 0.25)
                }
                
                Section{
                    Picker("Daily Coffee intake",selection:$coffeeAmount){
                        ForEach(0...20, id: \.self){
                           Text("^[\($0) cup](inflect:true)")
                        }
                    }
               }
                
                Section{
                    HStack{
                        Text("Recomended BedTime")
                        Spacer()
                        Text(recomendedBedtime)
                    }
                }
                
            }
            .navigationTitle("Better Rest")
            .toolbar(){
                    Button("Calculate", action: showRecommendedBedTime)
                }
            
        }.alert(alertTitle,isPresented: $showingAlert){
            Button("Ok"){
                showingAlert = false
            }
        }message: {
            Text(alertMessage)
        }
       
    }
    
    
  var  recomendedBedtime : String {
      do {
            let sleepTime = try calculateRecommendedBedTime()
          return "\(sleepTime.formatted(date: .omitted, time: .shortened))"
          
      }catch {
         return "\(wakeUp)"
      }
    }
    
    
    
    func calculateRecommendedBedTime() throws -> Date {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let commponents = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (commponents.hour ?? 0) * 60 * 60
            let minutes = (commponents.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep:  sleepAmount, coffee:  Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime;
        }catch {
            throw error
        }
    }
    
    func showRecommendedBedTime() {
        
       
        do{
            let sleepTime = try calculateRecommendedBedTime()
            alertTitle = "Recomended Sleep time"
            alertMessage = "Better Rest Recomends that you sleep by \(sleepTime.formatted(date: .omitted, time: .shortened)) to get \(sleepAmount.formatted()) hours of sleep)"
          
        }catch {
            alertTitle = "Error"
            alertMessage = "Sorry, There was a problem calculating your bedtime"
        }
        showingAlert = true
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
