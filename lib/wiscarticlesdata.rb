require 'rubygems'
require 'sequel'

WEMDB = Sequel.connect("mysql://wiscengr:bu3.ck1@localhost/wem_legacy")

class ArticleData < Sequel::Model(WEMDB)
  plugin :schema
  set_schema :wiscarticlesdata do
    primary_key :articletag, :varchar
    String :headline
    String :catagory
    String :subtitle
    String :month1
    String :year1
    String :article
    String :author
    String :authbio
    String :photographer
    String :html
    date :date1
    tinyint :zindex
  end
end
