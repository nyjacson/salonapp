class SearchController < ApplicationController
    def tokyo1
        @tokyo1 = Shopbranch.where('city LIKE(?)', "%区%")
    end
    def tokyo2
        @tokyo2 = Shopbranch.find_by_sql(['select * from shopbranches where (prefec = :prefec) AND (city LIKE :city)', {prefec: '東京都',city: '%市%'}])
    end
    def ginza
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "銀座"'])
    end
    def shinjuku
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "新宿"'])
    end
    def shibuya
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "渋谷"'])
    end
    def ikebukuro
        @station = Shopbranch.find_by_sql(['select * from shopbranches where station = "池袋"'])
    end

    def hokkaido
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "北海道"'])
    end
    def tohoku
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "東北"'])
    end
    def kanto
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "関東"'])
    end
    def chubu
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "中部"'])
    end
    def kansai
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "関西"'])
    end
    def chugoku
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "中国"'])
    end
    def shikoku
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "四国"'])
    end
    def kyushu
        @area = Shopbranch.find_by_sql(['select * from shopbranches where area = "九州"'])
    end




end
