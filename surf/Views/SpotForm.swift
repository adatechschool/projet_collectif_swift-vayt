//
//  SpotForm.swift
//  surf
//
//  Created by Victoire Stahl on 10/05/2022.
//

import SwiftUI

struct SpotForm: View {
    
//    struct RecordToSend: Encodable {
//        var records: [SpotFields]
//    }
//
//    struct SpotFields : Encodable {
//        var fields: FormSpotData
//    }
    
    class FormSpotData: Encodable, ObservableObject {
        var name = ""
        var city = ""
        var country = ""
        var description = ""
        var latitude: Double = 0
        var longitude: Double = 0
        var image_URL = ""
      }
    
    @ObservedObject var formData = FormSpotData()
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var coordFormater: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = ""
        return formatter
    }()
    
    var body: some View {
        VStack{
            Text("Add a spooky place !").font(.title)
            Text("All fields are mandatory").font(.title3)
            Form {
                Section {
                TextField("name", text: $formData.name)
                TextField("city", text: $formData.city)
                TextField("country", text: $formData.country)
                TextField("description", text: $formData.description)
                TextField("latitude", value: $formData.latitude, formatter: coordFormater)
                TextField("longitude", value: $formData.longitude, formatter: coordFormater)
                TextField("image URL", text: $formData.image_URL)
                }
                Section {
                    Button("Spook me !") {
                        Task {
                            await sendSpot()
                        }
                    }
                }
            }
        }.alert("Thank you!", isPresented: $showingConfirmation) {Button("OK"){}} message: {
            Text(confirmationMessage)}
    }


    func sendSpot() async {
        
        print("posting")
        let dataToSend: FormSpotData =  formData
        print("posting")
        guard let encoded = try? JSONEncoder().encode(dataToSend) else {
            print("Failed to encode order")
            return
        }

        let url = URL(string: "http://localhost:8080/spot")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (_, _) = try await URLSession.shared.upload(for: request, from: encoded)
            confirmationMessage = "You added a spooky spot !"
            showingConfirmation = true
        } catch {
            print("Spooky error")
        }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        SpotForm()
    }
}
