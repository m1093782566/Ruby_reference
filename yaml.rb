def load_config(file)
  if File.exists?(file)
    load_yaml_file(file)
  else
    {}
  end
end

def write_yaml(file, hash)
  unless hash == load_config(file)
    File.open(file, "w+") do |f|
      Psych.dump(hash, f)
    end
  end
end
