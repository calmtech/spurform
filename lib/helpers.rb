def form_for(config_name)
	if File.exists?(file_name = 'config/' + config_name + '.yml')
		config = YAML.load_file(file_name)
		
		form_attributes = []
		config['form'].each do |key, value|
			form_attributes << sprintf("%s=\"%s\"", key, value)
		end
		form_tag = "<form " + form_attributes.join(" ") + ">"
				
		elements = []
		config['inputs'].each do |params|
			params['id'] = config['form']['id'] + '_' + params['name']
			elements << form_element(params)
		end
		sprintf("%s\n%s\n</form>", form_tag, elements.join("\n"))
		#form_tag += "\n" + "<table>" + elements.join("\n") + "\n</form>"
	else
		"<div id=\"error\">フォーム生成用の設定ファイル：" + file_name + " が見つかりません。</div>"
	end
	
end

def form_element(params = {})
	element = ""
	case params['type']
		when 'selectbox' then element = selectbox(params)
		when 'date_select' then element = date_select(params)
		when 'radio' then element = radio(params)
		when 'checkbox' then element = checkbox(params)
		else element = input(params)
	end
	
	element
end

def input(params = {})
	input = [] << "<input"
	label = ""
	params.each do |key, value|
		if key == "label"
			label = sprintf("<label for=\"%s\">%s</label>", params['id'], params['label'])
		elsif value.is_a? Array
			input << sprintf("%s=\"%s\"", key, value.join(" "))
		else
			input << sprintf("%s=\"%s\"", key, value)
		end
	end
	input << "/>"
	sprintf("%s\n%s<br />", label, input.join(" "))
	#label + "\n" + "<td>" + input.join(" ") + "</td>"
end

def text(params = {})
	input = "<input "
	params.
	input += " />"
end

def password(config = {})
end

def selectbox(config = {})
end

def date_select(config = {})
end

def radio(config = {})
end

def checkbox(config = {})
end

def hidden(config = {})
end

def textarea(config = {})
end

def class_selector()
end