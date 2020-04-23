require_relative '../model/board'
require_relative '../model/player'
require_relative '../view/show'

class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board, :players
  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    player1 = Player.new('Player1', 'x')
    player2 = Player.new('Player2', 'o')
    @players = [player1, player2]
    @board = Board.new
    status = 'on going'
    current_player = player1
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    p "C'est le tour de #{current_player.name}, vous avez les #{current_player.value}"
    Show.new.show_board(@board)
    @board.play_turn(@current_player.value)
    if @board.victory?(current_player)
      return false
    else
      return true
    end
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    @board = Board.new
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    p 'Fin de partie'
  end    

end