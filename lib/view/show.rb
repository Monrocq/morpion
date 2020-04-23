class Show

  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    p "| #{board.board_cases[0].value} | #{board.board_cases[1].value} | #{board.board_cases[2].value} |"
    p "-------------"
    p "| #{board.board_cases[3].value} | #{board.board_cases[4].value} | #{board.board_cases[5].value} |"
    p "-------------"
    p "| #{board.board_cases[6].value} | #{board.board_cases[7].value} | #{board.board_cases[8].value} |"
  end

end