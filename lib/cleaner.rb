require 'html2textile'
require 'hpricot'

class Cleaner
  class << self
    def clean(text)
      if text.nil? || text.strip.empty?
        return nil
      end

      #puts text.inspect.scan(/\\\d{3}/).uniq.sort.inspect

      text.strip!
      text.gsub!("\205", %q[...])
      text.gsub!("\221", %q['])
      text.gsub!("\222", %q['])
      text.gsub!("\\\\\342\200\231", %q['])  # three bytes for this character: ’
      text.gsub!("\223", %q["])
      text.gsub!("\224", %q["])
      text.gsub!("\227", %q[--])
      text.gsub!(%Q[\\"], %q["])
      text.gsub!(%Q[\\'], %q['])
      #puts text
      return text
    end

    def to_textile(text)
      parser = HTMLToTextileParser.new
      parser.feed(text)
      parser.to_textile
    end

    def get_images(text)
      text = Cleaner.clean(text)
      doc = Hpricot(text)
      images = []
      (doc/"div.right, div.left, div.center").each_with_index do |div,i|
        img_tag = div.at("img")
        if img_tag
          caption = div.at("div.caption")
          caption = caption ? caption.inner_text.gsub("\n", " ") : ''
          #width_text = img_tag['width'] || ''
          #width_text = '' if width_text && width_text.empty?
          images << {
            :src => img_tag['src'],
            #:width => width_text,
            :caption => caption,
            :ordering => i+1 }
        end
      end
      #pp images
      (doc/"div.right, div.left, div.center").remove
      {:text => Cleaner.to_textile(doc.to_html), :images => images }
    end

    def local_image_fname(issue, src)
      basen = File.basename(src)

      local_fname = case issue.name(:short)
      when 'Sep2007' then find_image('september07/images', basen)
      when 'Nov2007' then find_image('november07/images', basen)
      when 'Feb2008' then find_image('FEB08', basen)
      when 'Apr2008' then find_image('april08', basen)
      when 'Sep2008' then find_image('september08/images', basen)
      when 'Nov2008' then find_image('november08/images', basen)
      when 'Feb2009' then find_image('feb09/images', basen)
      when 'Apr2009' then find_image('april09/img', basen)
      when 'Sep2009' then find_image('sep09', basen)
      when 'Nov2009' then find_image('nov09', basen)
      else
        puts "No case for that issue: #{issue.name}"
        nil
      end

      return local_fname
    end

    def find_image(img_dir, basename)
      legacy_site_root = File.expand_path "../legacy"
      file_glob = File.join(legacy_site_root, img_dir, "**", basename)
      matches = Dir[file_glob]
      raise "Multiple matches for file: #{matches.first}" if matches.size > 1
      return matches.first
    end
  end
end
