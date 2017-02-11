class SearchController < ApplicationController
    def tokyo1
        @tokyo1 = Shopbranch.where('city LIKE(?)', "%区%")
        @shopinfo = Shopinfo.all
    end
    def tokyo2
        @tokyo2 = Shopbranch.find_by_sql(['select * from shopbranches where (prefec = :prefec) AND (city LIKE :city)', {prefec: '東京都',city: '%市%'}])
        @shopinfo = Shopinfo.all
    end
    def ginza
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "銀座"'])
        @shopinfo = Shopinfo.all
    end
    def shinjuku
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "新宿"'])
        @shopinfo = Shopinfo.all
    end
    def shibuya
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "渋谷"'])
        @shopinfo = Shopinfo.all
    end
    def ikebukuro
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "池袋"'])
        @shopinfo = Shopinfo.all
    end

    def hokkaido
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "北海道"'])
        @shopinfo = Shopinfo.all
    end
    def tohoku
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "東北"'])
        @shopinfo = Shopinfo.all
    end
    def kanto
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "関東"'])
        @shopinfo = Shopinfo.all
    end
    def chubu
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "中部"'])
        @shopinfo = Shopinfo.all
    end
    def kansai
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "関西"'])
        @shopinfo = Shopinfo.all
    end
    def chugoku
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "中国"'])
        @shopinfo = Shopinfo.all
    end
    def shikoku
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "四国"'])
        @shopinfo = Shopinfo.all
    end
    def kyushu
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "九州"'])
        @shopinfo = Shopinfo.all
    end




end
