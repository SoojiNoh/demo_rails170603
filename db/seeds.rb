Admin.create!([
  {email: "thensj@hanmail.net", password: "123123", password_confirmation: "123123"}
])
User.create!([
  {email: "thensj6873@gmail.com", password: "123123", password_confirmation: "123123"}
])
ApiKey.create!([
  {access_token: "9369b7c95d67cd9b320c084381d68696", accessible_id: 1, accessible_type: "Catalogue"}
])
Artist.create!([
  {name: "작가이름테스트", role: nil, user_id: 1}
])
ArtistArtwork.create!([
  {artist_id: 1, artwork_id: 1}
])
ArtistCatalogue.create!([
  {artist_id: 1, catalogue_id: 1}
])
ArtistExhibition.create!([
  {artist_id: 1, exhibition_id: 1},
  {artist_id: 1, exhibition_id: 2},
  {artist_id: 1, exhibition_id: 3}
])
Catalogue.create!([
  {user_id: 1, artist_id: nil, space_id: nil, title: "도록제목테스트1", description: "도록설명테스트1"}
])
CatalogueExhibition.create!([
  {catalogue_id: 1, exhibition_id: 3}
])
Contact.create!([
  {category: "phone", content: "작가phone테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "email", content: "작가email테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "facebook", content: "작가페이스북테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "instagram", content: "작가인스타그램테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "twitter", content: "작가트위터테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "blog", content: "작가블로그테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "etc", content: "작가기타SNS테스트", contactable_id: 1, contactable_type: "Artist"},
  {category: "phone", content: "도록전시장phone테스트1", contactable_id: 3, contactable_type: "Space"},
  {category: "website", content: "도록전시장website테스트1", contactable_id: 3, contactable_type: "Space"},
  {category: "facebook", content: "도록전시장페이스북테스트1", contactable_id: 3, contactable_type: "Space"}
])
Exhibition.create!([
  {category: "single", title: "작가전시경력전시명테스트1", start_date: "2010-01-01", end_date: "2011-01-01"},
  {category: "group", title: "작가전시경력전시명테스트2", start_date: "2016-01-01", end_date: nil},
  {category: "single", title: "도록전시제목테스트1", start_date: "2017-09-01", end_date: "2017-09-05"}
])
ExhibitionSpace.create!([
  {exhibition_id: 1, space_id: 1},
  {exhibition_id: 2, space_id: 2},
  {exhibition_id: 3, space_id: 3}
])
History.create!([
  {category: "academic", title: "작가학력기관명테스트1", detail: "작가학력학부학과테스트1", status: "graduated", start_date: "2010-01-01", end_date: "2013-01-01", artist_id: 1},
  {category: "academic", title: "작가학력기관명테스트2", detail: "작가학력학부학과테스트2", status: "undergraduate", start_date: "2014-01-01", end_date: nil, artist_id: 1},
  {category: "award", title: "작가수상레지던시기관명테스트1", detail: "작가수상레지던시테스트1", status: nil, start_date: "2007-01-01", end_date: "2009-01-01", artist_id: 1},
  {category: "award", title: "작가수상레지던시테스트2", detail: "작가수상레지던시테스트2", status: nil, start_date: "2017-01-01", end_date: nil, artist_id: 1}
])
Notice.create!([
  {title: "웹 도록 베타 버전을 오픈합니다1.", content: "Team Louvre는 기술로 작가를 보조하고, 창작물의 가치를 더하기 위해 노력하는 팀입니다. 저희 팀 및 서비스에 관심이 있으신 분은 메일 주소를 알려주세요! 업데이트되는 소식을 전해드립니다1."},
  {title: "웹 도록 베타 버전을 오픈합니다2.", content: "Team Louvre는 기술로 작가를 보조하고, 창작물의 가치를 더하기 위해 노력하는 팀입니다. 저희 팀 및 서비스에 관심이 있으신 분은 메일 주소를 알려주세요! 업데이트되는 소식을 전해드립니다2."},
  {title: "웹 도록 베타 버전을 오픈합니다3.", content: "Team Louvre는 기술로 작가를 보조하고, 창작물의 가치를 더하기 위해 노력하는 팀입니다. 저희 팀 및 서비스에 관심이 있으신 분은 메일 주소를 알려주세요! 업데이트되는 소식을 전해드립니다3."},
  {title: "도록을 독립 웹페이지로 제공해드립니다.", content: "인쇄료 낭비 없이 URL로 전시를 쉽게 홍보하세요. 웹페이지형 도록을 통해 더 오래, 더 많이 기록하세요. 디지털 액자로 활용, 전시를 다채롭게 만들어보세요.\r\n"}
])
Page.create!([
  {category: "introduction", title: "도록서문제목테스트1", content: "도록서문본문테스트1", producer: "도록서문작성자테스트1", route: nil, page_num: nil, catalogue_id: 1}
])
Space.create!([
  {name: "작가전시경력전시장소테스트1", location: nil, map: nil, service_time: nil},
  {name: "작가전시경력전시장소테스트2", location: nil, map: nil, service_time: nil},
  {name: "도록전시장장소명테스트1", location: "도록전시장주소테스트1", map: nil, service_time: nil}
])
