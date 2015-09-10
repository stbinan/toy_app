xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Binchan's Toy App"
    xml.description ""
    xml.link root_url + "users/1"

    for post in @posts
      xml.item do
        if post.content.index("\n") != nil
          xml.title post.content[0,post.content.index("\n")]
        else
          xml.title post.content
        end
        xml.description markdown post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link root_url + "users/1"
        #xml.link post_url(post)
        #xml.guid post_url(post)
      end
    end
  end
end
