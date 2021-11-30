//
//  ResponseMode.swift
//  SoftExpertTask
//
//  Created by Youssef on 29/11/2021.
//

import Foundation
import Alamofire

// MARK: - RecipeHead
struct RecipeHead: Codable {
    let q: String?
    let from, to: Int?
    let more: Bool?
    let count: Int?
    let hits: [Hit]?
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe?
}
// MARK: - Recipe
struct Recipe: Codable {
   public let uri: String?
   public let label: String?
   public let image: String?
   public let source: String?
   public let url: String?
   public let shareAs: String?
   public let yield: Int?
   public let dietLabels, healthLabels: [String]?
   public let cautions: [Caution]?
   public let ingredientLines: [String]?
   public let ingredients: [Ingredient]?
   public let calories, totalWeight: Double?
   public let totalTime: Int?
   public let cuisineType: [String]?
   public let mealType: [MealType]?
   public let dishType: [DishType]?
   public let totalNutrients, totalDaily: [String: Total]?
   public let digest: [Digest]?
}
enum Caution: String, Codable {
    case fodmap = "FODMAP"
    case sulfites = "Sulfites"
}
// MARK: - Digest
struct Digest: Codable {
    let label, tag: String?
    let schemaOrgTag: SchemaOrgTag?
    let total: Double?
    let hasRDI: Bool?
    let daily: Double?
    let unit: Unit?
    let sub: [Digest]?
}

enum SchemaOrgTag: String, Codable {
    case carbohydrateContent = "carbohydrateContent"
    case cholesterolContent = "cholesterolContent"
    case fatContent = "fatContent"
    case fiberContent = "fiberContent"
    case proteinContent = "proteinContent"
    case saturatedFatContent = "saturatedFatContent"
    case sodiumContent = "sodiumContent"
    case sugarContent = "sugarContent"
    case transFatContent = "transFatContent"
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

enum DishType: String, Codable {
    case condimentsAndSauces = "condiments and sauces"
    case mainCourse = "main course"
    case starter = "starter"
}
// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String?
    let quantity: Double?
    let measure: String?
    let food: String?
    let weight: Double?
    let foodCategory, foodID: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

enum MealType: String, Codable {
    case brunch = "brunch"
    case lunchDinner = "lunch/dinner"
}

// MARK: - Total
struct Total: Codable {
    let label: String?
    let quantity: Double?
    let unit: Unit?
}
