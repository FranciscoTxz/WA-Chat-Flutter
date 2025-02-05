import json

def read_json(file_path):
    with open(file_path, 'r') as file:
        data = json.load(file)
    return data

file_path = '.../info.json'
data = read_json(file_path)
new_data = data[::-1]

print(new_data)

def write_json(file_path, data):
    with open(file_path, 'w', encoding='utf-8') as file:
        json.dump(data, file, indent=4, ensure_ascii=False)

output_file_path = '.../new_info.json'
write_json(output_file_path, new_data)