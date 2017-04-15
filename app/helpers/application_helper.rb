module ApplicationHelper
    def full_title(page_title = '')
        base_title = '美容脱毛比較.net'
        if page_title.empty?
            base_title
        else
            page_title + ' | ' + base_title
        end
    end

    def customer_rank(rb_rank)
        if rb_rank == 5
            image_tag('/images/star-5.svg', class: "ele-rankStar")
        elsif rb_rank == 4.5
            image_tag('/images/star-4-half.svg', class: "ele-rankStar")
        elsif rb_rank == 4
            image_tag('/images/star-4.svg', class: "ele-rankStar")
        elsif rb_rank == 3.5
            image_tag('/images/star-3-half.svg', class: "ele-rankStar")
        elsif rb_rank == 3
            image_tag('/images/star-3.svg', class: "ele-rankStar")
        elsif rb_rank == 2.5
            image_tag('/images/star-2-half.svg', class: "ele-rankStar")
        elsif rb_rank == 2
            image_tag('/images/star-2.svg', class: "ele-rankStar")
        elsif rb_rank == 1.5
            image_tag('/images/star-1-half.svg', class: "ele-rankStar")
        elsif rb_rank == 1
            image_tag('/images/star-1.svg', class: "ele-rankStar")
        end
    end

    def nl2br(str)
        str = html_escape(str)
        str.gsub(/\r\n|\r|\n/, "<br />")
    end

end
