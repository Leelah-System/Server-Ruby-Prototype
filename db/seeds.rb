# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.save([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.save(:name => 'Daley', :city => cities.first)
require 'yaml'

UserRole.destroy_all
User.destroy_all
Company.destroy_all
Contact.destroy_all
Address.destroy_all


#seed file in 'db/seeds/seeds.yml'
seeds = YAML.load_file (File.join(Rails.root, 'db', 'seeds', 'seeds.yml'))

#===========================================================================#
#===   USER_ROLES CREATION
#===========================================================================#
UserRole.save(seeds['user_roles'])

#===========================================================================#
#===   USERS CREATION
#===========================================================================#

# conversion of label of user_roles into UserRole
seeds["users"].each { |user|
  user["user_roles"].each_with_index { |role, index|
    user["user_roles"][index] = UserRole.find_by_label(role)
  }
}

User.save(seeds['users'])

#===========================================================================#
#===   COMPANY CREATION
#===========================================================================#
seeds['company']["address"] = Address.new(seeds['company']["address"])
seeds['company']["contact"] = Contact.new(seeds['company']["contact"])

Company.save(seeds['company'])