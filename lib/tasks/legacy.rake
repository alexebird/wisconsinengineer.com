namespace :legacy do
  desc "Repopulate the legacy database from the SQL dump file."
  task :reset do
    sh "mysql -u wiscengr -pbu3.ck1 -D wem_legacy -h localhost < lib/wiscarticlesdata.sql"
  end

  desc "Run the Sequel console with the legacy database."
  task :console do
    sh "irb -rwiscarticlesdata"
  end

  desc "Populate the rails database from the legacy database."
  task :populate => 'db:reset' do
    require 'cleaner'
    require 'wiscarticlesdata'
    require 'ruby-progressbar-0.9/progressbar'

    user = User.first(:conditions => { :name => 'Alex Bird' })
    #legacy_articles = ArticleData.filter(:month1 => %w[November], :year1 => %w[2009]).all
    legacy_articles = ArticleData.all
    total = legacy_articles.size
    prog = ProgressBar.new("Processing", total)

    legacy_articles.each do |e|
      cleaned_article = Cleaner.get_images(e.article)
      article_fields = {
        :headline => Cleaner.clean(e.headline),
        :lead => Cleaner.clean(e.subtitle),
        :contents => cleaned_article[:text],
        :created_at => e.date1 }
      issue_fields = { :published => Date.parse("#{e.month1} #{e.year1}"), :show => true }
      author_fields = { :name => e.author, :bio => e.authbio }
      photo_fields = { :name => e.photographer }

      article = Article.new(article_fields)
      article.user = user

      issue = Issue.first(:conditions => issue_fields)
      if issue.nil?
        issue = Issue.new(issue_fields)
        issue.user = user
        issue.save!

        cover_photog = Contributor.new#(:user => user, :contributor_type => ContributorType.photographer)
        cover_photog.user = user
        cover_photog.contributor_type = ContributorType.photographer
        cover_photog.save!
        issue.contributors << cover_photog
      end

      article.issue = issue
      article.categories << case e.catagory
                           when 'article' then Category.first(:conditions => { :name => 'article' })
                           when 'editorial' then Category.first(:conditions => { :name => 'editorial' })
                           when 'profprofile' then Category.first(:conditions => { :name => 'professor profile' })
                           when 'onemore' then Category.first(:conditions => { :name => 'just one more' })
                         end
      article.save!

      author = Contributor.new(author_fields)
      author.contributor_type = ContributorType.author
      author.user = user
      author.save!
      article.contributors << author

      photo = Contributor.new(photo_fields)
      photo.contributor_type = ContributorType.photographer
      photo.user = user
      photo.save!

      cleaned_article[:images].each do |i|
        local_fname = Cleaner.local_image_fname(issue, i[:src])
        if local_fname
          ai = ArticleImage.new
          ai.caption = i[:caption]
          ai.ordering = i[:ordering]
          ai.image = File.new(local_fname)
          ai.article = article
          ai.save!
          ai.contributors << photo
          article.images << ai
        end
      end

      #puts '-'*70
      prog.inc
    end
    prog.finish
  end
end
