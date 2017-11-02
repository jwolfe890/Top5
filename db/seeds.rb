require 'pathname'
RailsRoot = Pathname.new(RAILS_ROOT).expand_path

print "Loading data..."
fileData = File.read (RailsRoot + "db/data-file.csv")

@topic = Topic.create(name: "Entertainment")
@topic2 = Topic.create(name: "Politics")
@topic3 = Topic.create(name: "Sports")
@topic4 = Topic.create(name: "Food")
@topic5 = Topic.create(name: "Science")
@topic6 = Topic.create(name: "Technology")
@topic7 = Topic.create(name: "Pets & Animals")
@topic8 = Topic.create(name: "History")