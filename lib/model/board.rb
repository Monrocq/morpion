require_relative 'board_case'

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :board_cases

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @board_cases = []
    @board_cases.push(BoardCase.new('A1'))
    @board_cases.push(BoardCase.new('A2'))
    @board_cases.push(BoardCase.new('A3'))
    @board_cases.push(BoardCase.new('B1'))
    @board_cases.push(BoardCase.new('B2'))
    @board_cases.push(BoardCase.new('B3'))
    @board_cases.push(BoardCase.new('C1'))
    @board_cases.push(BoardCase.new('C2'))
    @board_cases.push(BoardCase.new('C3'))
  end

  def play_turn(value)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    p 'Dans quelle case souhaitez vous aller?'
    good_value = false
    while good_value == false do
      case_choosed = gets.chomp
      @board_cases.each do |board_case|
        if case_choosed == board_case.identifiant && board_case.value == nil
          board_case.value = value
          good_value = true
        end
      end
    end
  end

  def victory?(player)
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    possibilities = []
    possibilities.push(@board_cases.select {|board_case| board_case.identifiant[0] == 'A'})
    possibilities.push(@board_cases.select {|board_case| board_case.identifiant[0] == 'B'})
    possibilities.push(@board_cases.select {|board_case| board_case.identifiant[0] == 'C'})
    possibilities.push(@board_cases.select {|board_case| board_case.identifiant[1] == '1'})
    possibilities.push(@board_cases.select {|board_case| board_case.identifiant[1] == '2'})
    possibilities.push(@board_cases.select {|board_case| board_case.identifiant[1] == '3'})
    possibilities.push([@board_cases[0], board_cases[4], board_cases[8]])
    possibilities.push([@board_cases[2], board_cases[4], board_cases[6]])
    possibilities.each do |possibilitie|
      nb_of_x = 0
      nb_of_o = 0
      possibilitie.each do |board_case|
        if board_case.value == 'x'
          nb_of_x += 1
        elsif board_case.value == 'o'
          nb_of_o += 1
        end
      end
      if nb_of_o == 3 || nb_of_x == 3
        p "Victoire de #{player.name}"
        return true
      end
    end
    nb_of_cases = 0
    @board_cases.each do |board_case|
      if board_case.value != nil
        nb_of_cases += 1
      end
    end
    if nb_of_cases == 9
      p 'Match nul'
      return true
    end
    return false
  end
end