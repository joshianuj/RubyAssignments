#Game

class Player
  attr_accessor :player_cards
  def initialize
    self.player_cards =[]
  end

  def take_card newcard
    self.player_cards << newcard
  end
end

class CardDeck
  SAMPLE_CARD_VALUE = [2,3,4,5,6,7,8,9,10,11,12,13,14]
  SAMPLE_CARD_TYPE = ["H","S","D","C"]

  attr_accessor :sample_card

  def initialize
    self.sample_card = []
      (0...SAMPLE_CARD_VALUE.length).each do |i|
        (0...SAMPLE_CARD_TYPE.length).each do |j|
          self.sample_card << {"value" => SAMPLE_CARD_VALUE[i] ,"type"=> SAMPLE_CARD_TYPE[j]}
        end
      end
  end

  def selectCard
    r = Random.new()
    n = r.rand(self.sample_card.length)
    picked_card = self.sample_card[n]
    self.sample_card.delete_at(n)
    picked_card
  end

end

class Game

  def initialize number
    @number = number
    @players_array = []
    @card_deck = CardDeck.new
  end

  #create players
  def createPlayers
    n = @number
    if !(n>=17)
    (0...n).each do |x|
        @players_array[x] = Player.new
    end
    else
      p "Players Exceeded"
    end
  end

  #deal cards
  def deal
    n = @number
    (0...n).each do |x|
      newcard = @card_deck.selectCard
      @players_array[x].take_card(newcard)
    end
  end

  def display_cards
    (0...@players_array.length).each do |x|
      #puts "Player #{x+1} : #{(@players_array[x].player_cards).to_s}"
      print "Player #{x+1} :"
      (0...@players_array[x].player_cards.length).each do |y|
        print"("
        value = ((@players_array[x].player_cards[y]).to_a)[0][1]
        #print value
        if(value > 10)
          if(value  == 11 )
            print "J"
          end
          if(value == 12)
            print "Q"
          end
          if(value == 13)
            print "K"
          end
          if(value == 14)
            print "A"
          end
        else
          print value
        end
        print " "
        print ((@players_array[x].player_cards[y]).to_a)[1][1]
        print")"
        print " "
      end
      puts ""
    end
  end

  #find winner
  def is_winner
    display_cards
    np = @players_array.length
    nc = @players_array[0].player_cards.length
    card_values,card_types = [],[]

    (0...np).each do |i|
      tempvals,temptypes = [],[]
      (0...nc).each do |j|

        tempvals << (@players_array[i].player_cards[j].to_a)[0][1]
        temptypes << (@players_array[i].player_cards[j].to_a)[1][1]
        #trial --
        #double run
        #run --
        #color
        #pair --
        #none
        #highest value compare --

      end
      card_values << tempvals
      card_types << temptypes
    end

    #card_values = [[10,11,12],[2,7,2],[3,4,5]]
    #card_types = [["Clubs","Clubs","Clubs"],["Hearts","Spades","Spades"],
    # ["Hearts","Hearts",
     #"Hearts"]]

    trials = check_trial(card_values)
    #trials = check_trial([[1,1,1],[2,2,2],[3,3,3],[5,5,5],[4,4,4]])
    if !(trials == false)
      return trials
    end

    runs = check_run (card_values)
    color = check_color(card_types)

    color_runs = []
    color_no = []
    if(!(runs==false)&&!(color==false))
      (0...runs.length).each do |x|
        (0..color.length).each do |y|
          if(runs[x] == color[y])
            color_runs << card_values[runs[x]]
            color_no << runs[x]
          end
        end
      end
    end
    if !(color_runs.length == 0)
      winner = compare_values(color_runs)
      winner = color_no[winner]
      return winner
    end

    if !(runs == false)
      largest = runs[0]
      run_values = []
      (0...card_values.length).each do |x|
        (0...runs.length).each do |y|
          if(x==runs[y])
            run_values  << card_values[x]
          end
        end
      end
      output = compare_values(run_values)
      return output
    end

    if !(color == false)
      largest = color[0]
      color_values = []
      (0...card_values.length).each do |x|
        (0...color.length).each do |y|
          if(x==color[y])
            color_values  << card_values[x]
          end
        end
      end
      output = compare_values(color_values)
      return output
    end

    pairs = check_pair(card_values)
    #pairs = check_pair([[1,1,1],[2,6,5],[3,3,3],[7,7,5],[4,4,4]])
    if !(pairs == false)
      return pairs
    end

    highestval = compare_values(card_values)
      return highestval

    #puts card_values.to_s
    #puts (compare_values(card_values)+1)

  end

  def check_trial valuesoriginal
    trial_persons = []
    (0...valuesoriginal.length).each do |p|
      check = true
      i=0
      while check == true
        if(valuesoriginal[p][i] == valuesoriginal[p][i+1])
          i+=1
          if(i==valuesoriginal[p].length-1)
            trial_persons << p
            check = false
          end
        else
          check = false
        end
      end
    end
    if(trial_persons.length == 1)
      return trial_persons[0]
    elsif (trial_persons.length > 0)
      trialcheckvals = []
      (0...trial_persons.length).each do |x|
        trialcheckvals << valuesoriginal[trial_persons[x]]
      end
      win = compare_values(trialcheckvals)
      (0...valuesoriginal.length).each do |x|
        if(valuesoriginal[x] == trialcheckvals[win])
          return x
        end
      end
    end
    false
  end

  def check_run valuesoriginalip
      run_persons = []
      (0...valuesoriginalip.length).each do |p|
        check = true
        i=0
        values_original = (valuesoriginalip[p].sort{|x,y| x<=> y}).dup
        #puts values_original.to_s
        while check == true
          if(values_original[i+1] == (values_original[i]+1))
            i+=1
            if(i==(values_original.length)-1)
              run_persons << p
              check = false
            end
          else
            check = false
          end
        end
      end
    if(run_persons.length == 0)
      return false
    else
      return run_persons
    end
      #puts color_persons.to_s
      # if(run_persons.length == 1)
      #   return run_persons[0]
      # elsif (run_persons.length > 0)
      #   runcheckvals = []
      #   (0...run_persons.length).each do |x|
      #     runcheckvals << valuesoriginalip[run_persons[x]]
      #   end
      #   win = compare_values(runcheckvals)
      #   (0...valuesoriginalip.length).each do |x|
      #     if(valuesoriginalip[x] == runcheckvals[win])
      #       return x
      #     end
      #   end
      # end
      # false
  end

  def check_color valuesoriginalip
    color_persons = []
    (0...valuesoriginalip.length).each do |p|
      check = true
      i=0
      values_original = valuesoriginalip.dup
      #puts values_original.to_s
      while check == true
        if(values_original[p][i+1] == (values_original[p][i]))
          i+=1
          if(i==(values_original[p].length)-1)
            color_persons << p
            check = false
          end
        else
          check = false
        end
      end
    end
    if(color_persons.length == 0)
      return false
    else
      return color_persons
    end
  end

  def check_pair valuesoriginal
    pair_persons = []
    (0...valuesoriginal.length).each do |p|
      check = true
      i=0
      while check == true
        if(valuesoriginal[p][i] == valuesoriginal[p][i+1])
          pair_persons << p
          check = false
        else
          i+=1
          if(i==valuesoriginal[p].length)
          check = false
          end
        end
      end
    end
    if(pair_persons.length == 1)
      return pair_persons[0]
    elsif (pair_persons.length > 0)
      paircheckvals = []
      (0...pair_persons.length).each do |x|
        paircheckvals << valuesoriginal[pair_persons[x]]
      end
      win = compare_values(paircheckvals)
      (0...valuesoriginal.length).each do |x|
        if(valuesoriginal[x] == paircheckvals[win])
          return x
        end
      end
    end
    false
  end

  def compare_values valuesoriginal # [ [2,5,6],[2,3,7],[2,3,7] ,[2,3,7] ,[2,3,7]  ]
    maxvalue = 0
    i=0
    values = valuesoriginal.dup
    if(valuesoriginal.length == 1)
      return 0
    end
    check = false
    while(check==false)
      j=0
      loser = nil
      incheck = false
      values[i].sort!{|x,y| y<=>x}
      values[i+1].sort!{|x,y| y<=>x}
      while(incheck == false)
        if(values[i][j] > values[i+1][j])
          loser = i+1
          incheck = true
        elsif(values[i][j] < values[i+1][j])
          loser = i
          incheck = true
        else
          j+=1
        end
      end
      values.delete_at(loser)
      if(values.length == 1)
        check = true
      end
    end

    (0...valuesoriginal.length).each do |x|
      temp = valuesoriginal[x].sort{|x,y| y<=>x}
      if (temp == values[0])
        return x
      end
    end
  end
end


puts "Enter no of players"
#n = Integer(gets)
g = Game.new 10
g.createPlayers
g.deal
g.deal
g.deal
puts "Winner : #{(g.is_winner+1)}"
#puts (g.compare_values [ [2,5,3] ,[2,3,14]]).to_s
#puts (g.check_trial? [[3,3,3],[2,2,2],[3,4,5],[5,6,7],[6,6,6]]).to_s
