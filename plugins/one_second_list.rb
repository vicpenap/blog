module Jekyll
    class CategoryListTag < Liquid::Tag
        def render(context)
            html = ""
            category = "One Second Every Day"
            context.registers[:site].categories[category].sort{ |a, b|  b <=> a }.each do |post|
                regex = %r{(\w+)* \((?<month>\w+)\)}
                original_post_name = post.data["title"]
                post_name = regex.match(original_post_name)
                post_name = post_name ? post_name[:month] : original_post_name
                html << "<li class='post'><a href='%s'>%s</a></li>\n" % [ post.url , post_name ]
            end
            html
        end
    end
end

Liquid::Template.register_tag('one_second_list', Jekyll::CategoryListTag)
