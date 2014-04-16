#!/usr/local/rvm/rubies/ruby-1.9.3-p448/bin/ruby

require 'rubygems'
require 'faker'
require 'ipaddr'
require 'random_word_generator'

I18n.enforce_available_locales = false

def faker_array
  word_list = [ Faker::Internet.email,
    Faker::Name.first_name,
    Faker::Name.last_name,
    Faker::Name.name,
    Faker::Name.prefix ,
    Faker::Name.suffix,
    Faker::Name.title,
    Faker::Business.credit_card_numbers,
    Faker::Business.credit_card_type,
    Faker::Business.credit_card_expiry_date,
    Faker::Address.building_number,
    Faker::Address.city,
    Faker::Address.city_prefix,
    Faker::Address.city_suffix,
    Faker::Address.country,
    Faker::Address.latitude,
    Faker::Address.longitude,
    Faker::Address.secondary_address,
    Faker::Address.state,
    Faker::Address.state_abbr,
    Faker::Address.street_address,
    Faker::Address.street_name,
    Faker::Address.street_suffix,
    Faker::Address.time_zone,
    Faker::Address.zip_code,
    Faker::Commerce.color,
    Faker::Commerce.department,
    Faker::Commerce.product_name,
    Faker::Company.bs,
    Faker::Company.catch_phrase,
    Faker::Company.duns_number,
    Faker::Company.name,
    Faker::Company.suffix,
    Faker::Internet.domain_name,
    Faker::Internet.domain_suffix,
    Faker::Internet.domain_word,
    Faker::Internet.email,
    Faker::Internet.free_email,
    Faker::Internet.ip_v4_address,
    Faker::Internet.ip_v4_address,
    Faker::Internet.password,
    Faker::Internet.safe_email,
    Faker::Internet.url,
    Faker::Internet.user_name,
    Faker::Lorem.paragraph(rand(0..100)),
    Faker::Lorem.sentence(rand(0..100)),
    Faker::Lorem.word,
    Faker::Code.isbn,
    Faker::Number.digit,
    Faker::Number.number(rand(0..100))
  ]
  word_list
end

def ip_list
  list = [
    IPAddr.new(rand(2**32),Socket::AF_INET),
    IPAddr.new(rand(2**128),Socket::AF_INET6)
  ]
  list
end

def hipster_ipsum
  %w(  Irure incididunt fugiat brunch, proident kitsch vero Wes Anderson irony non odio. Kitsch vinyl Truffaut, est mollit non paleo Portland tattooed photo booth hella nesciunt. Sartorial typewriter art party nulla, laborum nihil bicycle rights fugiat Blue Bottle Schlitz church-key. McSweeney's twee banh mi Cosby sweater, Williamsburg typewriter locavore irony plaid chia beard deserunt dreamcatcher. Meggings chambray McSweeney's gentrify qui. Adipisicing mollit pariatur, laborum Bushwick nesciunt do scenester. Church-key American Apparel Tumblr, next level single-origin coffee ex culpa blog Tonx est.
      Narwhal Echo Park tote bag Pinterest pour-over, Austin PBR&B duis ugh Thundercats letterpress ut officia. Organic aliqua umami dolor, Tonx photo booth pork belly asymmetrical pariatur ugh bespoke Wes Anderson selfies. Cred commodo proident cupidatat, hashtag typewriter accusamus placeat photo booth actually Vice. Gentrify tempor nulla umami kogi artisan, esse bespoke vegan mustache blog mixtape minim. Placeat tote bag ennui, fugiat craft beer seitan non before they sold out adipisicing umami dreamcatcher. Aliqua +1 Helvetica eu iPhone single-origin coffee. Tote bag nesciunt literally, non esse nihil messenger bag sunt bitters officia four loko iPhone.
      Pinterest shabby chic try-hard, pariatur pour-over letterpress cupidatat beard Banksy. Sriracha swag chillwave, beard veniam whatever irure flannel. Chambray messenger bag cillum flexitarian, typewriter readymade Williamsburg vegan delectus plaid organic street art. Schlitz flannel fingerstache, squid ethnic Wes Anderson esse VHS. Tumblr voluptate duis exercitation, chia master cleanse direct trade eu eiusmod gentrify vero retro hashtag cardigan. Elit ullamco sapiente, wolf fap asymmetrical mlkshk VHS aesthetic shabby chic bitters. Shabby chic cray cardigan id, adipisicing Carles Godard voluptate Tumblr.
      Veniam street art nulla, Wes Anderson quis mlkshk bitters officia gluten-free four loko PBR&B incididunt eiusmod Portland esse. Ad cray direct trade Echo Park cillum XOXO, food truck Pinterest laborum stumptown ugh occupy normcore American Apparel. Cardigan sriracha qui leggings skateboard, DIY keytar. Forage Vice elit, Intelligentsia nisi PBR artisan duis eiusmod messenger bag High Life est American Apparel. Deep v chambray occupy Echo Park, cupidatat nisi squid blog Pinterest labore. Odio sapiente put a bird on it aute lo-fi, PBR minim dreamcatcher +1 Williamsburg Portland Wes Anderson veniam ea American Apparel. Locavore gentrify letterpress nulla High Life.)
end

def render_message
  faker = faker_array
  message = [ ]
  output = ""

  rand(1..10).times{ message <<  ip_list.sample.to_s + " " }
  rand(1..10).times{ message <<  faker.sample.to_s + " "}
  rand(1..20).times{ message <<  Faker::Internet.email + " " }
  rand(1..30).times{ message <<  hipster_ipsum.to_a.sample + " " }
  rand(1..30).times{ message <<  RandomWordGenerator.of_length(rand(1..30)) + " " }
  rand(1..30).times{ message <<  RandomWordGenerator.of_length(rand(1..30)) + " " }
  rand(1..30).times{ message <<  RandomWordGenerator.of_length(rand(1..30)) + " " }
  rand(1..30).times{ message <<  RandomWordGenerator.composed(3, rand(1..30), '|') + " " }
  rand(1..30).times{ message <<  RandomWordGenerator.composed(2, rand(1..30), '-')  + " " }

  10000.times{ message.shuffle! }
  message_size = rand(5..(message.count ))
  1.upto(message_size){  |i| output <<  message[i].to_s }

  puts output.gsub(/\n/," ")
end

render_message
