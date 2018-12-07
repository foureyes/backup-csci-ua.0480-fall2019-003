let d = [
{
  "address": {
    "building": "1007",
    "coord": [-73.856077, 40.848447],
    "street": "Morris Park Ave",
    "zipcode": "10462"
  },
  "borough": "Bronx",
  "cuisine": "Bakery",
  "grades": [
    {"date": ISODate("2018-03-01T00:00:00Z"), "grade": "A", "score": 10},
    {"date": ISODate("2018-05-21T00:00:00Z"), "grade": "B", "score": 9},
  ],
  "name": "Morris Park Bake Shop",
  "restaurant_id": "21362901"
},
{
  "address": {
    "building": "300",
    "coord": [-60.856000, 50.142007],
    "street": "Northern Blvd",
    "zipcode": "11462"
  },
  "borough": "Queens",
  "cuisine": "Thai",
  "grades": [
    {"date": ISODate("2017-07-01T00:00:00Z"), "grade": "B", "score": 8},
    {"date": ISODate("2018-07-01T00:00:00Z"), "grade": "C", "score": 7},
  ],
  "name": "Basil Basil",
  "restaurant_id": "30075445"
},
{
  "address": {
    "building": "567",
    "coord": [-25.156077, 20.214018],
    "street": "Driggs St",
    "zipcode": "11211"
  },
  "borough": "Brooklyn",
  "cuisine": "Pizza",
  "grades": [
    {"date": ISODate("2017-05-30T00:00:00Z"), "grade": "D", "score": 5},
    {"date": ISODate("2018-05-30T00:00:00Z"), "grade": "C", "score": 7},
    {"date": ISODate("2016-05-30T00:00:00Z"), "grade": "C", "score": 7},
  ],
  "name": "Paul's Pizza",
  "restaurant_id": "12312345"
},
{
  "address": {
    "building": "7891",
    "coord": [-20.987654, 25.123456],
    "street": "N 4th St",
    "zipcode": "11211"
  },
  "borough": "Brooklyn",
  "cuisine": "Bakery",
  "grades": [
    {"date": ISODate("2017-02-30T00:00:00Z"), "grade": "A", "score": 9},
    {"date": ISODate("2018-02-30T00:00:00Z"), "grade": "A", "score": 9},
  ],
  "name": "Billie's Bakery",
  "restaurant_id": "09876543"
}
]


db.restaurants.find(
  {"borough": {$ne: "Brooklyn"}, "cuisine": "Bakery" } 
).sort({"name": -1});

db.restaurants.find(
  {$and: 
    [{"grades.grade": 'A'}, 
    {$or: [{cuisine: 'Pizza'}, {cuisine: 'Bakery'}]}]
  },
  {_id:0, name: 1, address: 1}
).sort({"borough": 1});



db.foos.aggregate(
  [{$group : {
    _id: "$borough",
    restaurants: {$push: "$name"}
  }}]
)
