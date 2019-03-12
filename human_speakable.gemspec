Gem::Specification.new do |s|
  s.name = 'human_speakable'
  s.version = '0.1.3'
  s.summary = 'Makes it convenient to format a date as it would be spoken in English.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/human_speakable.rb']
  s.signing_key = '../privatekeys/human_speakable.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/human_speakable'
end
