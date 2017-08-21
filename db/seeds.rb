User.create!([
  {email: "thensj6873@gmail.com", encrypted_password: "$2a$11$u3TRSTA41Pp9X84QW2D9ouZ.UNpMrElbLxPTIuVDwzu4rA9hHkGNu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-08-21 06:31:47", last_sign_in_at: "2017-08-21 06:31:47", current_sign_in_ip: "210.207.174.131", last_sign_in_ip: "210.207.174.131"}
])
ApiKey.create!([
  {access_token: "e066e73b3e1c30deff0fc53e7444d25b", accessible_id: 4, accessible_type: "Catalogue"}
])
Artist.create!([
  {name: "", role: "", user_id: nil},
  {name: "작가 이름test", role: "", user_id: 1}
])
ArtistExhibition.create!([
  {artist_id: 2, exhibition_id: 5},
  {artist_id: 2, exhibition_id: 6}
])
Catalogue.create!([
  {user_id: 1, artist_id: 2, space_id: nil, title: "도록제목test", description: "도록설명test"}
])
CatalogueExhibition.create!([
  {catalogue_id: 1, exhibition_id: 1},
  {catalogue_id: 2, exhibition_id: 2},
  {catalogue_id: 3, exhibition_id: 3},
  {catalogue_id: 4, exhibition_id: 4}
])
Contact.create!([
  {category: "phone", content: "", contactable_id: 1, contactable_type: "Artist"},
  {category: "email", content: "", contactable_id: 1, contactable_type: "Artist"},
  {category: "phone", content: "", contactable_id: 1, contactable_type: "Space"},
  {category: "phone", content: "phonetest", contactable_id: 2, contactable_type: "Artist"},
  {category: "email", content: "emailtest", contactable_id: 2, contactable_type: "Artist"},
  {category: "phone", content: "", contactable_id: 2, contactable_type: "Space"},
  {category: "phone", content: "", contactable_id: 3, contactable_type: "Space"},
  {category: "phone", content: "전시장 phone test", contactable_id: 4, contactable_type: "Space"},
  {category: "website", content: "전시장 website test", contactable_id: 4, contactable_type: "Space"},
  {category: "instagram", content: "전시장 인스타그램 test", contactable_id: 4, contactable_type: "Space"},
  {category: "facebook", content: "전시장 페이스북 test", contactable_id: 4, contactable_type: "Space"},
  {category: "facebook", content: "작가페이스북test", contactable_id: 2, contactable_type: "Artist"},
  {category: "instagram", content: "작가인스타그램test", contactable_id: 2, contactable_type: "Artist"},
  {category: "blog", content: "작가블로그test", contactable_id: 2, contactable_type: "Artist"}
])
Exhibition.create!([
  {category: "", title: "", start_date: "2017-08-21", end_date: "2017-08-21"},
  {category: "", title: "", start_date: "2017-08-22", end_date: "2017-08-22"},
  {category: "", title: "", start_date: "2017-08-22", end_date: "2017-08-22"},
  {category: "single", title: "전시제목test", start_date: "2016-07-21", end_date: "2017-09-23"},
  {category: "single", title: "작가전시경력개인전test", start_date: "2012-01-01", end_date: "2019-01-01"},
  {category: "group", title: "작가전시경력그룹전test", start_date: "2016-01-01", end_date: "2018-01-01"}
])
ExhibitionSpace.create!([
  {exhibition_id: 1, space_id: 1},
  {exhibition_id: 2, space_id: 2},
  {exhibition_id: 3, space_id: 3},
  {exhibition_id: 4, space_id: 4},
  {exhibition_id: 5, space_id: 5},
  {exhibition_id: 6, space_id: 6}
])
History.create!([
  {category: "academic", title: "작가 학력기관명test", detail: "작가 학력 학부학과test", status: "accomplished", start_date: "2013-01-01", end_date: nil, artist_id: 2},
  {category: "award", title: "작가 수상/레지던시 기관명test", detail: "작가 수상 레지던시test", status: nil, start_date: "2015-01-01", end_date: nil, artist_id: 2}
])
Page.create!([
  {category: "introduction", title: "서문제목test", content: "서문본문내용test", producer: "서문글쓴이이름 test", route: nil, page_num: nil, catalogue_id: 4}
])
Space.create!([
  {name: "", location: "", map: nil, service_time: nil},
  {name: "", location: "", map: nil, service_time: nil},
  {name: "", location: "", map: nil, service_time: nil},
  {name: "전시장 장소명test", location: "전시장 주소 test", map: nil, service_time: nil},
  {name: "작가전시경력장소test", location: nil, map: nil, service_time: nil},
  {name: "작가전시경력장소test", location: nil, map: nil, service_time: nil}
])
