task :load_msgs => :environment do
	data = YAML.load_file "config/locales/en.yml"
	@dataa = data["en"]["activerecord"]["errors"]["models"]["user"]["attributes"]

	@dataa.each do |key,value|
	   value.each do |key1,value1|
	   	  @messages = Message.new	 
		  @messages.path = "['en']['activerecord']['errors']['models']['user']['attributes']" + "['" + key + "']" + "['" + key1 + "']" 
		  @messages.value = value1
		  @messages.save
	   end
	end
end