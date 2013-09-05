module UsefulMethodsHelper

  def downcase_it(x)
    x.downcase!
  end

  def capitalize_it(y)
    y.mb_chars.capitalize.to_s # use instead of y.capitalize
  end


  def strip_url(url)

    if url.match /https?\:\/\/www./i
      url.sub!(/https?\:\/\/www./i, '')

    elsif url.match /www./i
      url.sub!(/www./i, '')

    elsif url.match /https?\:\/\//i
      url.sub!(/https?\:\/\//i, '')

    else
      return url
    end

  end


end