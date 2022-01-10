import Foundation

class SomeClass: Codable {
  let firstName: String
  let lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}


let json = """
{
  "name":
  {
      "firstName": "Henry",
      "lastName": "Lee"
  },
  "age": 27
}
""".data(using: .utf8)!


let fetchedData = try! JSONSerialization.jsonObject(with: json) as! [String: Any]

if
  let name = try? JSONSerialization.data(withJSONObject: fetchedData["name"], options: .fragmentsAllowed),
  let someclass = try? JSONDecoder().decode(SomeClass.self, from: name) {
  dump(someclass)
} else {
  print("fail")
}
