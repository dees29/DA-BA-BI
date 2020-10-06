import requests 

ngrok_url = 'https://b6065e57afc6.ngrok.io'
endpoint = f'{ngrok_url}/box-office-mojo-scraper'

r = requests.post(endpoint, json={})
print(r.json()["data"])
