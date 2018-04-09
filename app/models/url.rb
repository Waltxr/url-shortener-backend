class Url < ApplicationRecord
  validates :decoded_url, presence: true

  # bijective function that encodes integer into base62 string
  # shuffeld characters of lowercase alphabet + uppercase alphabet + 0 -9
  CHARACTERS = 'rtYsk3i201XpTa5EyqGKQS6Mwu8BZmve7b9DOzNAfVd4FxHLCIUnhloRcJgWjP'.split(//)

  def create_slug(id)
    s = ''
    base = CHARACTERS.length
    while id > 0
      s << CHARACTERS[id.modulo(base)]
      id /= base
    end
    self.slug = s.reverse
    self.save
  end

  def increment_access_count
    self.access_count += 1
  end

end
