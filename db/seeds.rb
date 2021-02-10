3.times do |n|
    Resident.create!(
      email: "resident#{n + 1}@test.com",
      password: "resident{n + 1}",
      name: "テスト住人#{n + 1}",
      user_name: "住人#{n + 1}",
      sex: 1,
      birthday: Date.today,
      profile_img: File.open('./app/assets/images/sample/profile.jpg')
    )
end

3.times do |n|
    Coordinator.create!(
      email: "coordinator#{n + 1}@test.com",
      password: "coordinator{n + 1}",
      name: "テストコーディネーター#{n + 1}",
      user_name: "コーディネーター#{n + 1}",
      sex: 1,
      birthday: Date.today,
      occupation: "学生",
      profile_img: File.open('./app/assets/images/sample/profile.jpg')
    )
end

Coordinator.all.each do |coordinator|
    coordinator.interiors.create!(
      design_img: File.open("./app/assets/images/sample/interior01.jpg"),
      date_of_creation: Date.today,
      budget: 100000,
      description: 'aaaaaaaaaaaaaaaaaaa'
    )
end



