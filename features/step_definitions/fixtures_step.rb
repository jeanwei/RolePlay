Given(/^the following agencies exist:$/) do |table|
  table.hashes.each do |hash|
    Agency.create!(hash)
  end
end

Given(/^the following agency people exist:$/) do |table|
  table.hashes.each do |hash|
    agency_name = hash.delete 'agency'
    agency_id = Agency.find_by_name(agency_name).id
    roles_array = hash.delete('roles').split(',').map(&:strip)
    hash['password'] = 'qwerty123'
    hash['password_confirmation'] = 'qwerty123'

    user = User.create!(hash)
    roles_array.each do |role|
      role.sub(/\s/,'').constantize.create(agency_id: agency_id) do |u|
        u.create_profile(user_id: user.id)
      end
    end
  end
end

Given(/^the following tour guide exist:$/) do |table|
  table.hashes.each do |hash|
    agency_name = hash.delete 'agency'
    agency_id = Agency.find_by_name(agency_name).id
    hash['password'] = 'qwerty123'
    hash['password_confirmation'] = 'qwerty123'

    user = User.create!(hash)
    TourGuide.create(agency_id: agency_id) { |u| u.create_profile(user_id: user.id) }
  end
end

Given(/^the following translator exist:$/) do |table|
  table.hashes.each do |hash|
    agency_name = hash.delete 'agency'
    agency_id = Agency.find_by_name(agency_name).id
    hash['password'] = 'qwerty123'
    hash['password_confirmation'] = 'qwerty123'

    user = User.create!(hash)
    Translator.create(agency_id: agency_id) { |u| u.create_profile(user_id: user.id) }
  end
end

Given(/^the following tourists exist:$/) do |table|
  table.hashes.each do |hash|
    hash['password'] = 'qwerty123'
    hash['password_confirmation'] = 'qwerty123'
    user = User.create!(hash)
    Tourist.create { |u| u.create_profile(user_id: user.id) }
  end
end