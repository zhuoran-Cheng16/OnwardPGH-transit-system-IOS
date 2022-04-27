//
//  BusTable.swift
//  Scooter
//
//  Created by 然 on 4/23/22.
//

import SwiftUI
import UIKit
func matches(for regex: String, in text: String) -> [String] {

    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
class BusGPS: ObservableObject {
    @Published var attitude : String = ""
    @Published var longtitude : String = ""
    var dataset : String = ""
    init(){
        load()
    }
    func load() {
        let url = URL(string: "https://truetime.portauthority.org/gtfsrt-bus/vehicles?debug")!
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("text/plain",forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data,
        let strData = String(bytes: data, encoding: .utf8)
                {

            let components = strData.components(separatedBy: "entity")
           
            for k in components{
                if k.contains("6650")
                {
                    let timestamp = k.components(separatedBy: "position {")
             
                    let weightt = timestamp[1].components(separatedBy: CharacterSet.init(charactersIn: "-0123456789.").inverted).joined(separator: "a")
                    DispatchQueue.main.async { [self] in
                    for i in weightt{
                        if i != "a"{
                            self.dataset.append(i)
                            }
                        }
                        self.attitude=self.dataset.components(separatedBy: "-")[0]
                        self.longtitude=self.dataset.components(separatedBy: "-")[1]

                    }
                }
            }
        } }.resume()

    }

}
struct BusTable: View {
    @ObservedObject var model:BusGPS=BusGPS()
    var body: some View {
        VStack(alignment: .leading) {
                       HStack {
                           Image (systemName: "bus")
                               .foregroundColor(.blue)
                           Text("Bus Route")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                       }
                        Divider()
            VStack(alignment: .leading) {
                Text("61A")
                            .font(.title)
                            .padding(.leading)

                       HStack {
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.green)
           
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.green)
                           Text("6 Min")
                               .font(.title3)
                               .foregroundColor(.gray)
                       }
                       .padding(.leading, 240.0)
                       HStack {
                           Image (systemName: "arrow.forward.circle.fill")
                               .foregroundColor(.blue)
                               .padding(.leading)
                           Text("Downtown")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                       }
                
                       Text("Forbes Ave/Wightman")
                           .font(.subheadline)
                           .foregroundColor(.blue)
                           .padding(.leading)
                       Text("         Also in 37 min & 1h")
                           .font(.subheadline)
                HStack{
                Text("Bus Current Location")
                Text(model.attitude)
                Text("-"+model.longtitude.prefix(8))
                }.font(.footnote)
                 .foregroundColor(.blue)
                 .padding(.leading)
        
            }
                Divider()
            VStack(alignment: .leading){
                
                HStack{Text("61B")
                    .font(.title)
                    .padding(.leading)
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("Too many waiting")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                HStack{
           
                    HStack{
                    Image(systemName: "figure.stand")
                            .padding(.trailing)
                            .font(.body)
                            .foregroundColor(.red)
                    Image(systemName: "figure.stand")
                        .padding(.trailing)
                        .font(.body)
                        .foregroundColor(.orange)
                    Text("9 Min")
                        .font(.title2)
                        .foregroundColor(.gray)
                    }
                    .padding(.leading, 240.0)
                    

                }
                HStack {
                    Image (systemName: "arrow.forward.circle.fill")
                        .foregroundColor(.blue)
                        .padding(.leading)
                    Text("Downtown")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                Text("Forbes Ave/Wightman")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.leading)
                Text("         Also in 37 min & 1h")
                    .font(.subheadline)
                    .foregroundColor(.black)
            }

            Divider()
            VStack(alignment: .leading) {
                HStack{Text("61C")
                    .font(.title)
                    .padding(.leading)
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("No more boarding")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                       HStack {
                        
                    
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.red)
           
                           Image(systemName: "figure.stand")
                               .padding(.trailing)
                               .font(.body)
                               .foregroundColor(.red)
                           Text("2 Min")
                               .font(.title3)
                               .foregroundColor(.gray)
                       }
                       .padding(.leading, 240.0)

                       HStack {
                           Image (systemName: "arrow.forward.circle.fill")
                               .foregroundColor(.blue)
                               .padding(.leading)
                           Text("Downtown")
                               .font(.subheadline)
                               .foregroundColor(.blue)
                       }
                       Text("Forbes Ave/Wightman")
                           .font(.subheadline)
                           .foregroundColor(.blue)
                           .padding(.leading)
                       Text("         Also in 37 min & 1h")
                           .font(.subheadline)}
            Divider()
        }
            .foregroundColor(.black)
            .padding(.top, -300)
            
        
            
          
            
    }
        
    }

struct BusTable_Previews: PreviewProvider {
    static var previews: some View {
        BusTable().previewDevice("iPhone 13 Pro")
    }
}
