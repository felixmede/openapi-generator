//
// Order.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Order: Codable, JSONEncodable, Hashable {

    public enum Status: String, Codable, CaseIterable {
        case placed = "placed"
        case approved = "approved"
        case shipped = "delivered"
    }
    public var id: Int64?
    public var petId: Int64?
    public var quantity: Int?
    public var shipDate: Date?
    /** Order Status */
    public var status: Status?
    public var complete: Bool? = false

    public init(id: Int64? = nil, petId: Int64? = nil, quantity: Int? = nil, shipDate: Date? = nil, status: Status? = nil, complete: Bool? = false) {
        self.id = id
        self.petId = petId
        self.quantity = quantity
        self.shipDate = shipDate
        self.status = status
        self.complete = complete
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case petId
        case quantity
        case shipDate
        case status
        case complete
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(petId, forKey: .petId)
        try container.encodeIfPresent(quantity, forKey: .quantity)
        try container.encodeIfPresent(shipDate, forKey: .shipDate)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(complete, forKey: .complete)
    }
}

