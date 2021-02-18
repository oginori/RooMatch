
3.times do |n|
    Resident.create!(
      email: "resident#{n + 1}@test.com",
      password: "resident{n + 1}",
      name: "テスト住人#{n + 1}",
      user_name: "住人#{n + 1}",
      sex: 1,
      birthday: Date.today,
      profile_img: File.open('./app/assets/images/profile.jpg')
    )
end

5.times do |n|
    Coordinator.create!(
      email: "coordinator#{n + 1}@test.com",
      password: "coordinator{n + 1}",
      name: "テストコーディネーター#{n + 1}",
      user_name: "コーディネーター#{n + 1}",
      sex: 1,
      birthday: Date.today,
      occupation: "学生",
      profile_img: File.open('./app/assets/images/profile.jpg')
    )
end

Coordinator.all.each do |coordinator|
    3.times do [n]
      coordinator.interiors.create!(
        design_img: File.open("./app/assets/images/interiors/interior0#{n + 1}.jpg"),
        date_of_creation: Date.today,
        budget: n * 10000,
        description: 'aaaaaaaaaaaaaaaaaaa'
      )
    end
end

favorites_list = []
Resident.all.ids.sort.each do |resident_id|
  Interior.all.each do |interior|
    if rand(4) == 0
      favorites_list << { resident_id: resident_id, interior_id: interior.id }
    end
  end
end
Favorite.create!(favorites_list)


Resident.find(rand(1..2)).each do |resident|
  n = 
  resident.requests.create!(
    room_img: File.open("./app/assets/images/rooms/room0#{n + 1}.jpg"),
    room_size: "#{ 20 + n }平米",
    budget: n * 10000,
    deadline: Faker::Date.backward,
    remarks: 'xxxxxxxxxxxxxxxxxxxx'
  )
end

