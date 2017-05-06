module ApplicationHelper
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

    # configuration for webpack
    def assets_path(path)
        return "http://localhost:3001/#{path}" if Rails.env.development?
        manifest = Rails.application.config.assets_manifest
        path = manifest[path] if manifest && manifest[path].present?
        "/js/#{path}"
    end
end
