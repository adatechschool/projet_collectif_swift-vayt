//
//  SpotForm.swift
//  surf
//
//  Created by Victoire Stahl on 10/05/2022.
//

import SwiftUI

struct SpotForm: View {
    
    
    class RecordToSend: Encodable, ObservableObject {
        var records: [SpotFields] = [SpotFields()]
    }
    
    class SpotFields : Encodable, ObservableObject {
        var fields: FormSpotData = FormSpotData()
    }
    
    class FormSpotData: Encodable, ObservableObject {
        var name = "blop"
        var city = "blop"
        var country = "blop"
        var description = "blop"
        var latitude = "blop"
        var longitude = "blop"
        var image = "blop"
      }
    
    @ObservedObject var formData = RecordToSend()

    
    var body: some View {
        VStack{
            Text("Add a spooky place !")
            Form {
                TextField("name", text: $formData.records[0].fields.name)
                TextField("city", text: $formData.records[0].fields.city)
                TextField("country", text: $formData.records[0].fields.country)
                TextField("description", text: $formData.records[0].fields.description)
                TextField("latitude", text: $formData.records[0].fields.latitude)
                TextField("longitude", text: $formData.records[0].fields.longitude)
                TextField("image URL", text: $formData.records[0].fields.image)
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
        guard let encoded = try? JSONEncoder().encode(formData) else {
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
            print(formData)
            print($formData.records[0].fields.name)
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
