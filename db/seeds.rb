# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create default users
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!(
  :name => 'Jack Brown',
  :email => 'jack@brownjohnf.com',
  :password => 'password',
  :password_confirmation => 'password'
)
puts 'New user created: ' << user.name
user.add_role :admin

user = User.create!(
  :name => 'Chris Hedrick',
  :email => 'chedrick@peacecorps.gov',
  :password => 'hedrick',
  :password_confirmation => 'hedrick'
)
puts 'New user created: ' << user.name
user.add_role :admin

user = User.create!(
  :name => 'Andrew Kistler',
  :email => 'akistler63@gmail.com',
  :password => 'kistler',
  :password_confirmation => 'kistler'
)
puts 'New user created: ' << user.name
user.add_role :admin

# create default page
puts 'CREATING DEFAULT COUNTRIES'
Page.create([{
  :country_id => 1,
  :title => 'Default Page',
  :html => '<p>You should edit this page, or replace it with a better page...</p>'
}])

# create default countries
puts 'SETTING UP DEFAULT COUNTRIES'
Country.create!([{
  :code => 'BJ',
  :start_date => '1968-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=bn',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'BW',
  :start_date => '1966-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=bc',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'BF',
  :start_date => '1967-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=uv',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'CM',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=cm',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'CV',
  :start_date => '1988-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=cv',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'ET',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=et',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'GM',
  :start_date => '1967-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ga',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'GH',
  :start_date => '1961-02-01',
  :site_url => '',
  :donate_url => '',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'GN',
  :start_date => '1963-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=gv',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'KE',
  :start_date => '1964-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ke',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'LS',
  :start_date => '1967-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=lt',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'LR',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=li',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'MG',
  :start_date => '1993-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ma',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'MW',
  :start_date => '1963-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=mi',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'ML',
  :start_date => '1970-03-24',
  :site_url => '',
  :donate_url => '',
  :contact_email => '',
  :active => false,
  :page_id => 1
},{
  :code => 'MZ',
  :start_date => '1998-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=mi',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'NA',
  :start_date => '1990-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=mi',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'RW',
  :start_date => '1975-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=rw',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'SN',
  :start_date => '1963-02-15',
  :site_url => 'http://www.pcsenegal.org',
  :donate_url => '',
  :contact_email => 'admin@pcsenegal.org',
  :page_id => 1
},{
  :code => 'SL',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=sl',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'ZA',
  :start_date => '1997-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=sf',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'SZ',
  :start_date => '1969-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=wz',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'TZ',
  :start_date => '1961-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=tz',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'TG',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=to',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'UG',
  :start_date => '1964-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ug',
  :contact_email => '',
  :page_id => 1
},{
  :code => 'ZM',
  :start_date => '1994-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=za',
  :contact_email => '',
  :page_id => 1
}])

# create default initiatives
puts 'SETTING UP DEFAULT INITIATIVES'
Initiative.create!([{
  :name => 'Stomping Out Malaria in Africa',
  :abbreviation => 'STOMP',
  :start_date => '2011-04-25',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.projDetail&projdesc=SPF-MLR',
  :site_url => 'http://www.stompoutmalaria.org',
  :contact_email => 'stompoutmalaria@gmail.com',
  :page_id => 1
},{
  :name => 'Food Security',
  :abbreviation => 'FOODSEC',
  :start_date => '2009-08-28',
  :page_id => 1
},{
  :name => 'HIV/AIDS Prevention',
  :abbreviation => 'HIVAIDS',
  :start_date => '1995-03-24',
  :page_id => 1
}])

# create a starter page for each country
puts 'BUILDING PAGES FOR COUNTRIES'
Country.all.each do |country|
  page = Page.create!(
    :title => "#{country.name} Info",
    :country_id => country.id
  )
  page.update_attributes(
    :revisions_attributes => [{
      :content => "<p>Starter content about #{country.name}, auto-generated by Jack.</p>",
      :author_id => 1
    }]
  )
  country.update_attributes(:page_id => page.id)
end

Country.find_by_code('BJ').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
More than 1,800 Volunteers have served in Benin since 1968.  See here for more information about Peace Corps Benin.

Returned Peace Corps Benin Volunteers established the Friends of Benin  in 1999. Their mission is to maintain communications between Friends of Benin (FOB) members, keep the Peace Corps/Benin experience alive, sustain the commitment to international service, encourage members to share their experiences with their own communities, support the Peace Corps mission in Benin, support recently returned volunteers as well as volunteers who are about to leave for Benin, and distribute news and information about Benin.
HEREDOC
}])
Country.find_by_code('BW').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Botswana:
More than 2,220 Peace Corps Volunteers have served in Botswana since the program was established in 1966. See here for more information about Peace Corps Botswana.
Click here for an introduction to Setswana, one of the Bantu language groups, mostly spoken in Botswana, South Africa and Namibia.
HEREDOC
}])
Country.find_by_code('BF').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Burkina Faso:
More than 1,740 Peace Corps Volunteers have served in Burkina Faso since the program was established in 1967. See here for more information on Peace Corps Burkina Faso.
Volunteers are often looking to connect their communities to the larger global community, to share their experiences throughout their service and to use every available resource to meet the needs of local community members. See here for a site to connect volunteers to resources, family and friends back home, and Burkinabe communities with the world.
The Peace Corps Burkina Faso YouTube channel contains videos of training, cultural experiences, and testimonials.
Friends of Burkina Faso is a non-profit charitable NPCA-affiliated organization with the goals of maintaining a network of returned Peace Corps Volunteers (RPCVs) and friends of Burkina Faso; providing funding and assistance to support projects in Burkina Faso; Improve social interaction, communication and information exchange; and educate others about the country and culture of Burkina Faso.
The Peace Corps Burkina Faso Wiki is an online database of information about Peace Corps that invites all users to edit any page or to create new pages within the PeaceCorpsWiki website. It seeks to involve the visitor in an ongoing process of creation and collaboration that constantly changes the Web site landscape.
See here for an introduction to the Moore language, which is spoken broadly across Burkina Faso.
HEREDOC
}])
Country.find_by_code('CM').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Cameroon:
More than 3,280 Peace Corps Volunteers have served in Cameroon since the program was established in 1962. See here for more information about Peace Corps Cameroon.
To learn about the projects that volunteers are working on in Cameroon, to find information for invitees, resources for visitors, and other resources, see here.
Friends of Cameroon funds a number of small development projects in Cameroon every year.  The project committee evaluates project proposals received from Cameroonians, PCVs and the Peace Corps Partnership program and makes funding recommendations to the board of directors.
HEREDOC
}])
Country.find_by_code('CV').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Cape Verde:
More than 520 Peace Corps Volunteers have served in Cape Verde since the program was established in 1988. See here for more information on Peace Corps Cape Verde.
For information about Peace Corps Cape Verde projects, volunteer resources, information on visiting, and a list of FAQs, see here.
To find Peace Corps Cape Verde information such as project plans, teaching materials, counterpart organizations, and the Cape Verdean Kriolu Dictionary, see here.
The Peace Corps Cape Verde Wiki is an online database of information about Peace Corps that invites all users to edit any page or to create new pages within the PeaceCorpsWiki website. It seeks to involve the visitor in an ongoing process of creation and collaboration that constantly changes the Web site landscape.
HEREDOC
}])
Country.find_by_code('ET').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Ethiopia:
More than 3,150 Peace Corps Volunteers have served in Ethiopia since the program was established in 1962. Currently, 133 volunteers serve in Ethiopia. See here for more information on Peace Corps Ethiopia.
The Ethiopia & Eritrea Returned Peace Corps Volunteers is an affiliate of the National Peace Corps Association (NPCA) and helps to find previous volunteers who served in Ethiopia or Eritrea.
HEREDOC
}])
Country.find_by_code('GH').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Ghana:
More than 4,190 Peace Corps Volunteers have served in Ghana since the program was established in 1961. Ghana was the first country in Africa  to receive Peace Corps Volunteers. See here for more information on Peace Corps Ghana.
For information about Peace Corps Ghana projects, volunteer resources, information on visiting, and other resources, see here.
The Peace Corps Ghana Wiki is an online database of information about Peace Corps that invites all users to edit any page or to create new pages within the PeaceCorpsWiki website. It seeks to involve the visitor in an ongoing process of creation and collaboration that constantly changes the Web site landscape.
The Ghana Facebook group helps to keep volunteers in touch with one another.
Friends of Ghana is a non-profit and NPCA-affiliated organization. We welcome current volunteers, returned volunteers, Peace Corps staff, and other friends of Ghana. Our mission is to help promote a better understanding of the Ghanaian people on the part of Americans, establish Friends of Ghana as the essential resource for and about the Peace Corps Ghana community, and enable our members to build upon and extend their Peace Corps experience and values by facilitating their engagement in Ghanaian issues.
The Celebrate Language Audio Project is an ongoing, collaborative effort to make audio lessons for every world language. The project contains audio files with common expressions and translations from native speakers and volunteers in many different Ghanaian languages.
HEREDOC
}])
Country.find_by_code('GN').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Guinea:
More than 1,320 Peace Corps Volunteers have served in Guinea since the program was established in 1963. See here for more information about Peace Corps Guinea.
Friends of Guinea  is a non-profit organization consisting mainly of current and former Peace Corps volunteers serving in Guinea, and their friends and families that aims to connect current and former United States Peace Corps volunteers serving in Guinea and their families and friends with other people dedicated to helping Guineans; support both current Peace Corps volunteers in Guinea and their families as they experience the difficulty of extended separation; work towards the long-term development of Guinea by supporting and initiating worthy projects; and disseminating cultural information about Guinea, its people, and their customs in order to facilitate intercultural understanding.
HEREDOC
}])
Country.find_by_code('KE').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Kenya:
More than 5,030 Peace Corps Volunteers have served in Kenya since the program was established in 1964. See here for more information about Peace Corps Kenya.
The Peace Corps Kenya Yahoo group  can be used to stay in touch with old friends from Peace Corps and to share information about Peace Corps and Kenya to prospective volunteers. All prospective, current and RPCVs are welcome.
The Peace Corps Kenya Wiki provides PCVs and RPCVs in PC Kenya a place to share and find basic information on stuff in Kenya. Most notably travel information.

HEREDOC
}])
Country.find_by_code('LS').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Lesotho:
More than 2,190 Peace Corps Volunteers have served in Lesotho since the program was established in 1967. See here For more information on Peace Corps Lesotho.
For information about Peace Corps Lesotho projects, FAQs, and other resources, see here.
The Lesotho Facebook group helps to keep volunteers in touch with one another.
Friends of Lesotho (FOL) is a non-profit organization promoting friendship between the peoples of Lesotho and North America. FOL is supported by former Peace Corps volunteers and others who share this desire. FOL provides scholarships and grants to small development projects in Lesotho, assists in locating old friends from Lesotho, and provides information about current events in Lesotho. FOL is affiliated with the National Peace Corps Association.
HEREDOC
}])
Country.find_by_code('LR').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Liberia:
More than 3,910 Peace Corps Volunteers have served in Liberia since the program was established in 1962. See here for more information on Peace Corps Liberia.
Friends of Liberia is a non-governmental, non-profit organization that seeks to positively affect Liberia by supporting education, social, economic and humanitarian programs and through advocacy efforts.
HEREDOC
}])
Country.find_by_code('MG').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Madagascar:
More than 950 Peace Corps Volunteers have served in Madagascar since the program was established in 1993. See here for more information about Peace Corps Madagascar.
For more information on Peace Corps Madagascar projects, photos, and FAQs, see here
The Madagascar Facebook group helps to keep volunteers in touch with one another.
Malagasy is the only language spoken in all of Madagascar. While there are eighteen dialects spoken in different regions, the basic grammatical structure is the same for all dialects. See here for an introduction of the Malagasy language.
HEREDOC
}])
Country.find_by_code('MW').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Malawi:
More than 2,520 Peace Corps Volunteers have served in Malawi since the program was established in 1963. See here for more information on Peace Corps Malawi.
For a volunteer run site with information on projects, extra resources, and discussion boards, see here.
Friends of Malawi  members are located across the world, and developed their love of Malawi in a variety of ways. Our members include current and returned Peace Corps volunteers, their families, Peace Corps staff, former British VSOs, Canadian CUSOs, UN Volunteers, USAID and US Embassy staff, Malawians living in the USA , and others interested in Malawi . From time to time, FOM organizes committees to recruit members, fundraise, publish newsletters, review grant proposals and follow up with prior grants to ensure sustainability. Members who live in the same city, or who know each other from their time of service, also get together from time to time to share stories and work on new projects. It is our hope that both members and friends will find this website another convenient and useful way to meet, get new ideas, and share the story of the country we love.
HEREDOC
}])
Country.find_by_code('MZ').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Mozambique:
Volunteers in Mozambique work in the areas of education and health. See here for more information on Peace Corps Mozambique.
For more information on Peace Corps Mozambique projects, photos, and FAQs, see here.
Namibia:
Namibia volunteers work in the areas of education, community health and HIV/AIDS, information technology, and small business development. See here for more information on Peace Corps Namibia.
The Namibia Facebook group helps to keep volunteers in touch with one another.
HEREDOC
}])
Country.find_by_code('RW').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Rwanda:
More than 330 Peace Corps Volunteers have served in Rwanda since the program was established in 1975. See here for more information on Peace Corps Rwanda.
Senegal:
For information about Peace Corps Senegal, including case studies, photos and a timeline of Volunteer information since the program was established in 1963, see here.
Sierra Leone:
More than 3,560 Peace Corps Volunteers have served in Sierra Leone since the program was established in 1962.  See here for more information on Peace Corps Sierra Leone.
Friends of Sierra Leone is a non-profit organization founded in 1991 by a small group of returned Peace Corps Volunteers, soon joined by their Sierra Leonean friends and other volunteers who had served in Sierra Leone. We are a country-of-service affiliate of the National Peace Corps Association.  Our goals are to aid in the development and well-being of Sierra Leone and its people; increase understanding among Americans and others about Sierra Leone; and serve as a "Virtual Cottontree," a gathering place for all of us to share our ideas and thoughts.
The Sierra Leone Facebook group helps to keep volunteers in touch with one another.
See here for the Peace Corps Krio Language Manual.
HEREDOC
}])
Country.find_by_code('ZA').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
South Africa:
More than 1,050 Peace Corps Volunteers have served in South Africa since the program was established in 1997. See here for more information on Peace Corps South Africa.
For more information on Peace Corps South Africa projects, photos, and FAQs, see here.
The South Africa Facebook group helps to keep volunteers in touch with one another.
HEREDOC
}])
Country.find_by_code('SZ').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Swaziland:
More than 1,480 Peace Corps Volunteers have served in Swaziland since the program was established in 1969. See here for more information on Peace Corps Swaziland.
For more information on Peace Corps Swaziland projects, photos, and FAQs, see here.
Friends of Swaziland is composed primarily of returned volunteers and others who have lived and served in the southern African Kingdom of Swaziland. Other individuals who are concerned about development issues related to Swaziland, and Africa in general, are also welcomed to participate in this information and aid site.
HEREDOC
}])
Country.find_by_code('TZ').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Tanzania:
More than 2,320 Peace Corps Volunteers have served in Tanzania since the program was established in 1961. See here for more information on Peace Corps Tanzania.
For more information on Peace Corps Tanzania projects, photos, and FAQs, see here.
PCTanzania.org is the Volunteer run web site for information about Peace Corps service in Tanzania. s
The Gambia:
More than 1,580 Peace Corps Volunteers have served in The Gambia since the program was established in 1967. See here for more information on Peace Corps Gambia.
The Peace Corps Gambia Yahoo group is a discussion list for current and returned U.S. Peace Corps Volunteers from The Gambia, West Africa.
For Mandinka and Wolof language dictionaries and grammar manuals, see here.
Togo:
More than 2,680 Peace Corps Volunteers have served in Togo since the program was established in 1962. See here for more information on Peace Corps Togo.
For more information on Peace Corps Togo projects, photos, and FAQs, see here.
Friends of Togo is an organization of former Peace Corps volunteers who served in Togo, and others who are interested in the welfare of the country and its people.
HEREDOC
}])
Country.find_by_code('UG').page.update_attributes(
  :revisions_attributes => [{
    :author_id => 1,
    :content => <<HEREDOC
Uganda:
More than 1,170 Peace Corps Volunteers have served in Uganda since the program was established in 1964. See here for more information on Peace Corps Uganda.
For more information on Peace Corps Uganda projects, photos, and FAQs, see here.
Zambia:
More than 1,270 Peace Corps Volunteers have served in Zambia since the program was established in 1994. See here for more information on Peace Corps Zambia.
The Zambia Facebook group helps to keep volunteers in touch with one another.
HEREDOC
}])

# create a starter page for each initiative
puts 'BUILDING PAGES FOR INITIATIVES'
Initiative.all.each do |initiative|
  page = Page.create!(
    :title => "#{initiative.name} Info",
    :country_id => Country.first.id
  )
  page.update_attributes(
    :revisions_attributes => [{
      :content => "<p>Starter content about #{initiative.name}, auto-generated by Jack.</p>",
      :author_id => 1
    }]
  )
  initiative.update_attributes(:page_id => page.id)
end

# create country/initiative associations
puts 'ADDING COUNTRIES TO INITIATIVES'
CountryInitiative.create!([{
  :country_id => Country.find_by_code('SN').id,
  :initiative_id => Initiative.find_by_abbreviation('STOMP').id,
  :country_url => 'http://www.pcsenegal.org',
  :initiative_url => 'http://stompoutmalaria.org'
},{
  :country_id => Country.find_by_code('SN').id,
  :initiative_id => Initiative.find_by_abbreviation('FOODSEC').id
},{
  :country_id => Country.find_by_code('BJ').id,
  :initiative_id => Initiative.find_by_abbreviation('FOODSEC').id
},{
  :country_id => Country.find_by_code('ML').id,
  :initiative_id => Initiative.find_by_abbreviation('STOMP').id
},{
  :country_id => Country.find_by_code('ML').id,
  :initiative_id => Initiative.find_by_abbreviation('FOODSEC').id
}])
