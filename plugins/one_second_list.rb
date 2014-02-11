module Jekyll
    class CategoryListTag < Liquid::Tag
        def render(context)
            html = ""
            category = "One Second Every Day"
            context.registers[:site].categories[category].sort{ |a, b|  b <=> a }.each do |post|
                post_name = post.data["title"]
                
                regex = %r{(\w+)* \((?<month>\w+)[ ]?(?<year>\w+)?\)}
                parsed_post_name = regex.match(post_name)

                if parsed_post_name
                    month = parsed_post_name[:month]
                    post_name = month
                    year = parsed_post_name[:year]
                    if year
                        post_name << " " + year
                    end
                end
                html << "<li class='post'><a href='%s'>%s</a></li>\n" % [ post.url , post_name ]
            end
            html
        end
    end
end

Liquid::Template.register_tag('one_second_list', Jekyll::CategoryListTag)
