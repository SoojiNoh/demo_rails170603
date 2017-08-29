(1..3).each do |i|
  User.create(email: "thensj6873#{i}@gmail.com", password: "123123", password_confirmation: "123123")
  Artist.create!([
    {name: "작가이름테스트#{i}", role: nil, user_id: i}
  ])
  (1..3).each do |j|
    ApiKey.create!([
      {access_token: "723e7801c2f894ccab34bdf9344f84d5", accessible_id: {j, accessible_type: "Catalogue"}
    ])
    ArtistExhibition.create!([
      {artist_id: 1, exhibition_id: 1},
      {artist_id: 1, exhibition_id: 2}
    ])
    Catalogue.create!([
      {user_id: 1, artist_id: 1, space_id: nil, title: "도록제목테스트", description: "도록설명테스트"}
    ])
    CatalogueExhibition.create!([
      {catalogue_id: 1, exhibition_id: 3}
    ])
    Contact.create!([
      {category: "phone", content: "작가폰테스트", contactable_id: 1, contactable_type: "Artist"},
      {category: "email", content: "작가이메일테스트", contactable_id: 1, contactable_type: "Artist"},
      {category: "facebook", content: "작가페이스북테스트", contactable_id: 1, contactable_type: "Artist"},
      {category: "instagram", content: "작가인스타그램테스트", contactable_id: 1, contactable_type: "Artist"},
      {category: "blog", content: "작가블로그테스트", contactable_id: 1, contactable_type: "Artist"},
      {category: "phone", content: "전시장정보폰테스트", contactable_id: 3, contactable_type: "Space"},
      {category: "website", content: "전시장정보웹사이트테스트", contactable_id: 3, contactable_type: "Space"},
      {category: "facebook", content: "전시장정보페이스북테스트", contactable_id: 3, contactable_type: "Space"},
      {category: "instagram", content: "전시장정보인스타그램테스트", contactable_id: 3, contactable_type: "Space"},
      {category: "blog", content: "전시장정보블로그테스트", contactable_id: 3, contactable_type: "Space"}
    ])
    Exhibition.create!([
      {category: "single", title: "작가전시개인전전시명테스트", start_date: "2012-01-01", end_date: "2013-01-01"},
      {category: "group", title: "작가전시그룹전전시명테스트", start_date: "2016-01-01", end_date: nil},
      {category: "single", title: "도록전시정보제목테스트", start_date: "2017-08-18", end_date: "2017-08-26"}
    ])
    ExhibitionSpace.create!([
      {exhibition_id: 1, space_id: 1},
      {exhibition_id: 2, space_id: 2},
      {exhibition_id: 3, space_id: 3}
    ])
    History.create!([
      {category: "academic", title: "작가학력테스트졸업", detail: "작가학부학과졸업테스트", status: "graduated", start_date: "2000-01-01", end_date: "2004-01-01", artist_id: 1},
      {category: "academic", title: "작가학력테스트재학", detail: "작가학부학과재학테스트", status: "undergraduate", start_date: "2006-01-01", end_date: nil, artist_id: 1},
      {category: "award", title: "작가수상기관명테스트", detail: "작가수상내용테스트", status: nil, start_date: "2014-01-01", end_date: nil, artist_id: 1},
      {category: "award", title: "작가레지던시기관명테스트", detail: "작가레지던시내용테스트", status: nil, start_date: "2015-01-01", end_date: "2016-01-01", artist_id: 1}
    ])
    Page.create!([
      {category: "introduction", title: "도록일반서문제목테스트", content: "도록일반서문본문테스트", producer: "도록일반서문작성자테스트", route: nil, page_num: nil, catalogue_id: 1}
    ])
    Space.create!([
      {name: "작가전시개인전장소명테스트", location: nil, map: nil, service_time: nil},
      {name: "작가전시그룹전장소명테스트", location: nil, map: nil, service_time: nil},
      {name: "전시장정보장소명테스트", location: "전시장정보주소테스트", map: nil, service_time: nil}
    ])
  end
end
