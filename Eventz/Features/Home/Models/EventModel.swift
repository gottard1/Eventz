//
//  EventModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 31/10/23.
//

import UIKit

final class EventModel: Decodable {
    var id: String?
    let name: String
    let type: String
    var image: UIImage?
    let startDate: String
    let endDate: String
    let localizationDescription: String
    let eventDescription: String
    let localization: LocalizationDataModel
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, localizationDescription, eventDescription, startDate, endDate, localization
        case image = "imageUrl"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        localizationDescription = try container.decode(String.self, forKey: .localizationDescription)
        startDate = try container.decode(String.self, forKey: .startDate)
        endDate = try container.decode(String.self, forKey: .endDate)
        eventDescription = try container.decode(String.self, forKey: .eventDescription)
        localization = try container.decode(LocalizationDataModel.self, forKey: .localization)
        
        if let imageUrlString = try container.decodeIfPresent(String.self, forKey: .image),
           let imageUrl = URL(string: imageUrlString) {
            
            URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                if let error = error {
                    print("Erro ao obter imagem: \(error)")
                } else {
                    if let data = data, let downloadedImage = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.image = downloadedImage
                        }
                    }
                }
            }.resume()
        }
    }
    
    init(id: String? = nil, name: String, type: String, image: UIImage? = nil, localizationDescription: String, startDate: String, endDate: String, eventDescription: String, localization: LocalizationDataModel) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
        self.localizationDescription = localizationDescription
        self.startDate = startDate
        self.endDate = endDate
        self.eventDescription = eventDescription
        self.localization = localization
    }
    
    static func getMock() -> [EventModel] {
        return [
            EventModel(
                name: "Exemplo",
                type: "Tipo exemplo",
                image: UIImage(named: "bannerImage"),
                localizationDescription: "Localização exemplo",
                startDate: "2024-01-15T15:30",
                endDate: "2024-02-15T15:30",
                eventDescription: "Descrição do evento",
                localization: LocalizationDataModel(latitude: 0,
                                                    longitude: 0)
            ),
            EventModel(
                name: "Exemplo 2",
                type: "Tipo de exemplo 2",
                image: UIImage(named: "bannerImage"),
                localizationDescription: "Localização exemplo 2",
                startDate: "2024-01-15T15:30",
                endDate: "2024-02-15T15:30",
                eventDescription: "Descrição do evento 2",
                localization: LocalizationDataModel(latitude: 10,
                                                    longitude: 10)
            ),
            EventModel(
                name: "Exemplo 3",
                type: "Tipo exemplo 3",
                image: UIImage(named: "bannerImage"),
                localizationDescription: "Localização exemplo 3",
                startDate: "2024-01-15T15:30",
                endDate: "2024-02-15T15:30",
                eventDescription: "Descrição do evento 3",
                localization: LocalizationDataModel(latitude: -10,
                                                    longitude: -10)
            ),
            
            EventModel(
                name: "Exemplo 4",
                type: "Tipo exemplo 4",
                image: UIImage(named: "bannerImage"),
                localizationDescription: "Localização exemplo 4",
                startDate: "2024-01-15T15:40",
                endDate: "2024-02-15T15:40",
                eventDescription: "Descrição do evento 4",
                localization: LocalizationDataModel(latitude: 100,
                                                    longitude: 100)
            )
        ]
    }
}
