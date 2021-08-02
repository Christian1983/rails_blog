class AddDataToPosts < ActiveRecord::Migration[6.1]
  def up
    (Date.new(2021,1,1)..Date.today).step(5).each do |date|
      tlen  = rand(10)
      blen  = rand(4)
      title = JSON::parse(Net::HTTP.get(URI("http://asdfast.beobit.net/api/?type=word&length=#{tlen}")))['text']
      body  = JSON::parse(Net::HTTP.get(URI("http://asdfast.beobit.net/api/?type=paragraph&length=#{blen}")))['text']
      npost = Post.new({title: title, body: body, ref_date: date})
      npost.save
      sleep 0.5
    end
  end

  def down
    Post.all.map &:destroy
  end
end
