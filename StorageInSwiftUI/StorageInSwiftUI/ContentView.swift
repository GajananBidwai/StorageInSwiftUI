//
//  ContentView.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI

struct ContentView: View {
    //AppStorage(String)- This property wrappers stores and retrives the values from user default The argument is a string with the key of the value we want to access.
    @AppStorage("StoreCounter") var counter: Int = 0
    
    @AppStorage("interval") var interval = Date.timeIntervalSinceReferenceDate
    @AppStorage("message") var message: String = ""
    
    var body: some View {
//        HStack {
//            //Value is preseisted even thoungh the app is shut down and restarted
//            Stepper("", value: $counter)
//                .labelsHidden()
//            Text("\(counter)")
//                .font(.title)
//        }
        
//      It persist the time when user last close the app
        HStack {
            Text("\(message)")
        }
        .onAppear {
            let calender = Calendar.current
            let lastDate = Date(timeIntervalSinceReferenceDate: interval)
            let componant = calender.dateComponents([.day, .dayOfYear, .hour, .minute, .month, .second, .nanosecond], from: lastDate, to: Date())
            message = "Time\(componant)"
            interval = Date.timeIntervalSinceReferenceDate
        }
        
    }
}

#Preview {
    ContentView()
}
