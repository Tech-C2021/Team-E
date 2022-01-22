require 'nokogiri'
require 'open-uri'
require 'openssl' # 使うPCによってERRORが出ることがあるのでコメントしたりしなかったりする
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE # 使うPCによってERRORが出ることがあるのでコメントしたりしなかったりする

name = []
if name.empty? then
    name.push("Game_Versions")
end

url = "https://dota2.fandom.com/wiki/#{name[0]}"
charset = nil

html = URI.open(url) do |f|  #URI.open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
# nerfed の text
nerfed_text = doc.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/td[2]/ul[2]/li[1]/text()')

# nerfed の image
nerfed_image = []
doc.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/td[2]/ul[2]/li[1]/a/img').each do |image|
    nerfed_image.push(image.attribute('data-src').value)
end

p nerfed_image[0]


# buffed の text
buffed_text = doc.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/td[2]/ul[2]/li[2]/text()')

# buffed の image
buffed_image = []
doc.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/td[2]/ul[2]/li[2]/a/img/@data-src').each do |image|
    buffed_image.push(image)
end


# rebalanced の text
rebalanced_text = doc.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/td[2]/ul[2]/li[3]/text()')

# rebalanced の image
rebalanced_image = []
doc.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/td[2]/ul[2]/li[3]/a/img/@data-src').each do |image|
    rebalanced_image.push(image)
end

