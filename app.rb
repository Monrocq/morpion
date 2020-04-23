require_relative 'lib/controller/game'
require 'pry'

class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    # 
    play = true
    game = Game.new
    while play == true do
      p 'Bienvenue au jeux du Morpion'
      victory = false
      while victory == false do
        if game.current_player == game.players[0]
          game.current_player = game.players[1]
        else
          game.current_player = game.players[0]
        end
        continue = game.turn
        victory = true if continue == false
      end
      game.game_end
      p 'Voulez vous encore faire joujou? (o pour oui | n pour non)'
      answer = gets.chomp
      play = false if answer == 'n'
      game.new_round if answer == 'o'
    end 
  end
end


Application.new.perform