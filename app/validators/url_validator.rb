class UrlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    valid = begin
      URI.parse(value).kind_of?(URI::HTTP) && valid_url?(value)
    rescue URI::InvalidURIError
      false
    end
    unless valid
      record.errors[value] << ("is not a valid URL")
    end
  end

  def valid_url?(url)
    # credit for the regex https://stackoverflow.com/questions/1805761/how-to-check-if-a-url-is-valid
    url_regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    !!(url =~ url_regexp)
  end

end
