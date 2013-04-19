# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:name => 'Alex Bird', :email => 'alexebird@gmail.com', :password => 'asdfasdf')

ContributorType.create(:name => 'author')
ContributorType.create(:name => 'photographer')

Category.create(:name => 'article')
Category.create(:name => 'editorial')
Category.create(:name => 'feature')
Category.create(:name => 'wide')
Category.create(:name => 'full')
Category.create(:name => 'professor profile')
Category.create(:name => 'just one more')
