import os

# Define folder and file structure
folders = ['templates']
files = {
    'app.py': '''
from flask import Flask, render_template, request, redirect

app = Flask(__name__)
shopping_list = []

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        item = request.form.get('item')
        if item:
            shopping_list.append(item)
        return redirect('/')
    return render_template('index.html', items=shopping_list)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
''',

    'requirements.txt': 'flask',

    os.path.join('templates', 'index.html'): '''
<!DOCTYPE html>
<html>
<head>
    <title>Shopping List Demo</title>
</head>
<body>
    <h1>🛒 Shopping List</h1>
    <form method="POST">
        <input type="text" name="item" placeholder="Add an item..." required>
        <button type="submit">Add</button>
    </form>
    <ul>
        {% for item in items %}
            <li>{{ item }}</li>
        {% endfor %}
    </ul>
</body>
</html>
''',

    'Dockerfile': '''
FROM python:3.10-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
'''
}

# Create folders
for folder in folders:
    os.makedirs(folder, exist_ok=True)

# Create and write files
for path, content in files.items():
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content.strip())

print("✅ Shopping list demo files created!")