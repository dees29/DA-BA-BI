import pymongo
import datetime
import pprint

from pymongo import MongoClient
client = MongoClient("localhost", 27017)
##connect to database
db = client.test

##print all collections
db.collection_names(include_system_collections=False)

##use collection Employees, if Collection Employee is not exist it will be created
Emp_projects = db.Emp_projects


project_assign = {"first name": "Mike",
        "last name": "edward",
        "projects": ["Server Maintenance", "Database Migration","Development"],
        "status":"ongoing",         
        "date": datetime.datetime.utcnow()}
## insert one document in the Employees collection
Emp_projects.insert_one(project_assign)

##print one document from collection
pprint.pprint(Emp_projects.find_one())
## filter on specific atribute
pprint.pprint(Emp_projects.find_one({"department":"NETWORK"}))

##list all documents
for employee in Emp_projects.find():
    pprint.pprint(employee)

##insert many documents
new_projects=[{"first name": "edward",
        "last name": "ales",
        "projects": ["Database Migration","DB Maintenance"],
        "status":"ongoing",         
        "date": datetime.datetime.utcnow()},
         {"first name": "alex",
        "last name": "matt",
        "projects": ["Development"],
        "status":"Finished",         
        "date": datetime.datetime.utcnow()}]
        
Emp_projects.insert_many(new_projects)


##Update Document
Emp_projects.update_one({"first name":"Mike"},{'$set':{"status":"Finished"}})
## you can use Update_many to update multiple documents


##delete document
Emp_projects.delete_many({"status":"Finished"})


##Aggregate


##MapReduce Code