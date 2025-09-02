
# Lab 03 - Atlas and Python

### Atlas seacrh
```javascript
[
  {
    $search: {
      index: "default",
      text: {
        query: "hssen",
        path: {
          wildcard: "*"
        },
        fuzzy:{}
      }
    }
  }
]
```

### Python connection

```python
print ("hi")
import mongoengine as ME

client = "mongodb+srv://................"
ME.connect(host=client, db = "FacultySystemV2")
class course(ME.Document):
    _id = ME.IntField()
    courseName = ME.StringField(required = True)
    finalMark = ME.IntField(required = False)
    meta = {"collection":"course"}
print ("All")
for c in course.objects():
    print(c.courseName)
addCourse = course(courseName = "Network")
addCourse.save()

```

### Validation
```javascript
{
  $jsonSchema: {
    bsonType: 'object',
    required: [
      '_id',
      'courseName'
    ],
    additionalProperties: false,
    properties: {
      _id: {
        bsonType: 'objectId'
      },
      courseName: {
        bsonType: 'string',
        'enum': [
          'Databases',
          'Network'
        ]
      },
      finalMark: {
        bsonType: 'int',
        maxLength: 3
      }
    }
  }
}
```
