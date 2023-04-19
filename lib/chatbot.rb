# appeler les gems 
require 'dotenv'
require "pry" 
require 'http'
require 'json'
require "openai"
def start  
  Dotenv.load('../mercredi/.env') # Ceci appelle le fichier .env (situé dans le même dossier indiqué)
  # et grâce à la gem Dotenv, on importe toutes les données enregistrées dans un hash ENV
  # création de la clé d'api et indication de l'url utilisée.
  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/engines/text-davinci-003/completions"
  # un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
  headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
  }
  # créer un array qui inclut l'historique de conversation 
  conversation_history = []
  # laisser l'utilisateur entrer un prompt 
  puts "> Bonjour, de quoi souhaitez vous parler ? (pour quitter, tapez #{"exit"} à tout moment)"
  while true do 
    prompt = ""
    if conversation_history.length > 0
      prompt += conversation_history.last[0]
      prompt += " "
    end
    print "> "
    entry = gets.chomp
    if entry == "exit" 
      puts "À bientôt !"
      break
    else 
    # un peu de json pour envoyer des informations directement à l'API
      prompt += entry
      data = {
      "prompt" => prompt,
      "max_tokens" => 200,
      "temperature" => 0,
      "n" => 1
      }
      # une partie un peu plus complexe :
      # - cela permet d'envoyer les informations en json à ton url
      # - puis de récupéré la réponse puis de séléctionner spécifiquement le texte rendu
      response = HTTP.post(url, headers: headers, body: data.to_json)
      response_body = JSON.parse(response.body.to_s)
      response_string = response_body['choices'][0]['text'].strip
      # intègre les nouvelles questions et réponses à l'historique de conversation 
      conversation_history << [entry, response_string]
      # ligne qui permet d'envoyer l'information sur ton terminal
      print "> "
      puts response_string 
    end 
  end 
end 
start 
