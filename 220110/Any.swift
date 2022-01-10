import Foundation

let json = """
{
  "name": "henry",
  "age": 27
}
""".data(using: .utf8)!


let fetchedData = try! JSONSerialization.jsonObject(with: json) as! [String: Any]


fetchedData["name"] as! String
fetchedData["age"] as! Int

