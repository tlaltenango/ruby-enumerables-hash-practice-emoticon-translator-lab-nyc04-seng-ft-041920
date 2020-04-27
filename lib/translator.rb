require "yaml" #YAML is a recursive acronym for "YAML Ain't Markup Language". YAML is used because it is easier for humans to read and write than typing out entire arrays, hashes, etc.

# load_library: This method should return a hash where each key is the name of an emoticon. These keys will point to English and Japanese versions of the emoticon.
def load_library(filedirectorypath)
  emoticons = YAML.load_file(filedirectorypath)#loads the emoticons.yml file. 
  new_hash = {}

  emoticons.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]#Each emoticon name should point to a nested hash containing two keys, :english  
    new_hash[key][:japanese] = value[1]#and :japanese.
  end

  new_hash
end



# method get_english_meaning: takes a Japanese emoticon and returns its name in English. 
def get_english_meaning(filedirectorypath, emoticon)
  library = load_library(filedirectorypath) #relies on load_library method (above) to first load the YAML file.
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end

# method get_japanese_emoticon: takes traditional Western emoticon and "translate it" to its Japanese version, e.g., :) --> (＾ｖ＾). It will also rely load_library to first load the YAML file.
def get_japanese_emoticon(filedirectorypath, emoticon)
  library = load_library(filedirectorypath) #relies on load_library method 
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

