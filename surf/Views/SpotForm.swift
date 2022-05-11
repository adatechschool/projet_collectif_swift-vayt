//
//  SpotForm.swift
//  surf
//
//  Created by Victoire Stahl on 10/05/2022.
//

import SwiftUI

struct SpotForm: View {
    
    
    struct RecordToSend: Encodable {
        var records: [SpotFields]
    }
    
    struct SpotFields : Encodable {
        var fields: FormSpotData
    }
    
    class FormSpotData: Encodable, ObservableObject {
        var name = ""
        var city = ""
        var country = ""
        var description = ""
        var imageName = ""
        var latitude: Double = 0
        var longitude: Double = 0
      }
    
    @ObservedObject var formData = FormSpotData()
    
    var coordFormater: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = ""
        return formatter
    }()
    
    var body: some View {
        VStack{
            Text("Add a spooky place !")
            Form {
                TextField("name", text: $formData.name)
                TextField("city", text: $formData.city)
                TextField("country", text: $formData.country)
                TextField("description", text: $formData.description)
                TextField("latitude", value: $formData.latitude, formatter: coordFormater)
                TextField("longitude", value: $formData.longitude, formatter: coordFormater)
                TextField("image URL", text: $formData.imageName)
                Button("Spook me !") {
                    Task {
                        await sendSpot()
                    }
                }
            }
        }
    }


    func sendSpot() async {
        print("posting")
        let dataToSend: RecordToSend = RecordToSend(records: [SpotFields(fields: formData)])
        print("posting")
        guard let encoded = try? JSONEncoder().encode(dataToSend) else {
            print("Failed to encode order")
            return
        }

        let url = URL(string: "https://api.airtable.com/v0/appI8YDBcRniNVt9u/Spots?api_key=keyUf2J6tpBtwzKyG")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, bla) = try await URLSession.shared.upload(for: request, from: encoded)
            print("posted \(data) \(bla)")
            print(encoded)
            print(dataToSend)
            print($formData.name)
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
