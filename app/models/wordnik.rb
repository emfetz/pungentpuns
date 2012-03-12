require 'wordnik'

class ZipCode
  
  # Definitions
  Wordnik.word.get_definitions('hysterical')
  # Wordnik.word.get_definitions('lemurs', :use_canonical => true)
  # Wordnik.word.get_definitions('fish', :part_of_speech => 'verb,noun')
  # Wordnik.word.get_definitions('scoundrel', :limit => 20, :source_dictionaries => "ahd,wiktionary,wordnet")
  
  # Examples
  Wordnik.word.get_examples('slovenly')
  # Wordnik.word.get_examples('wrangle', :limit => 10, :skip => 10) # pagination
  
  # Related Words
  Wordnik.word.get_related('sad', :type => 'synonym')
  # Wordnik.word.get_related('bowls', :type => 'hypernym', :use_canonical => true)
  
  # Search
  Wordnik.words.search_words(:query => '*tin*', :min_dictionary_count => 3, :include_part_of_speech => 'verb', :min_length => 5, :max_length => 20)
  
  
  
end
