// ================================
//   Lab 01 - NoSQL (MongoDB)
// ================================

// q1 - Create database named: FacultySystemDB.
use('FacultySystemDB')

// q2
/**
2. Create collection (student) that has: 
◦ FirstName: string
◦ LastName: string
◦ Age: Number
◦ Faculty: An object that has Name and Address
◦ Grades: An array of objects, each object has: CourseName, Grade, Pass (Boolean).
◦ IsFired: Boolean
 */
db.createCollection("student")

db.student.insertOne({fName:"Hussein",lName:"Mohamed",age:26,faculty:{name:"Computer Engineering",address:"Minia"},grades:[{cname:"matlab",grade:60,pass:true},{cname:"C",grade:100,pass:true}],isFired:false})

// q3
/*
3. Insert 3 (at least) documents in Student collection with different values.
◦ Try inserting one record each time
◦ Try inserting collection
*/
db.student.insertOne({fName:"Ahmed",lName:"Alaa",age:25,faculty:{name:"Computer Engineering",address:"Minia"},grades:[{cname:"matlab",grade:70,pass:true},{cname:"C",grade:90,pass:true}],isFired:false})

db.student.insertMany([{fName:"Omar",lName:"Yehia",age:25,faculty:{name:"Computer Engineering",address:"Minia"},grades:[{cname:"matlab",grade:65,pass:true},{cname:"C",grade:95,pass:true}],isFired:false},
    {fName:"Abdlrhman",lName:"Amin",age:25,faculty:{name:"Computer Engineering",address:"Minia"},grades:[{cname:"matlab",grade:100,pass:true},{cname:"C",grade:80,pass:true}],isFired:false}])

// q4
/*
4. Retrieve the following data:
◦ All Students.
◦ Student with specific First Name.
◦ Students who his First Name=Ahmed, or Last Name= Ahmed.
◦ Students that their First name isn't "Ahmed".
◦ Students with Age less than 21.
◦ All fired students.
◦ Students with Age more than or equal to 21, and their faculty isn't NULL.
◦ Display student with specific First Name, and display his First Name, Last name, IsFired fields only.
*/
db.student.find()

db.student.find({fName:"Hussein"})

db.student.find({$or:[{fName:"Ahmed"}, {lName:"Ahmed"}]})

db.student.find({fName:{$ne:'Ahmed'}})

db.student.find({age:{$lt:26}})

db.student.find({isFired:false})

db.student.find({$and:[{age:{$gte: 26}}, {faculty:{$exists:true}}]})

db.student.find({fName:"Ahmed"}, {fName:1, lName:1,isFired:1,_id:0});

// q5
/*
Delete all students collection.
Delete the whole DB.
*/
db.student.drop()

db.dropDatabase()

//q6
/*9. Create new database named: FacultySystemV2.
◦ Create student collection that has (FirstName, lastName, IsFired, FacultyID,
    array of objects, each object has CourseID, grade).
◦ Create Faculty collection that has (Faculty Name, Address).
◦ Create Course collection, which has (Course Name, Final Mark).
◦ Insert some data in previous collections.
*/
use('FacultySystemV2')

db.createCollection("Student")
db.createCollection("Faculty")
db.createCollection("Course")

db.student.insertOne({fName:"Hussein",lName:"Mohamed",isFired:false, facultyID: 'CSE', grades:[{courseID: "cs50", grade:90}, {courseID: "cs40", grade:80}]})

db.faculty.insertOne({_id:"CSE", facultyName: "Computer Engineering", address:'Minia'})

db.course.insertMany([{_id:"cs50", courseName: "programming with C", finalMark: 100}, {_id:"cs40", courseName: "classic control", finalMark: 100}])

