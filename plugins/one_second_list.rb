module Jekyll
    class CategoryListTag < Liquid::Tag
        def render(context)
            html = ""
            category = "One Second Every Day"
            context.registers[:site].categories[category].sort{ |a, b|  b <=> a }.each do |post|
                html << "<li class='post'><a href='%s'>%s</a></li>\n" % [ post.url , post.data["title"] ]
            end
            html
        end
    end
end

Liquid::Template.register_tag('one_second_list', Jekyll::CategoryListTag)
