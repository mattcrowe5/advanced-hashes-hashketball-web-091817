require "pry"

def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      :players => {
        "Alan Anderson" =>{
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" =>{
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee"=>{
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" =>{
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" =>{
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon"=>{
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(teamPlayer)
  playerPoints = 0
  game_hash.collect do |team, data|
    data.map do |teamDeets, values|
      game_hash[team][:players].map do |player, stats|
        if player == teamPlayer
            playerPoints = game_hash[team][:players][player][:points]
        end
      end
    end
  end
  playerPoints
end

def shoe_size(teamPlayer)
  playerShoe = 0
  game_hash.collect do |team, data|
    data.map do |teamDeets, values|
      game_hash[team][:players].map do |player, stats|
        if player == teamPlayer
            playerShoe = game_hash[team][:players][player][:shoe]
        end
      end
    end
  end
  playerShoe
end

def team_colors(teamName)
  game_hash.map do |team, data|
    data.map do |attributes, values|
      if game_hash[team][:team_name] == teamName
        return game_hash[team][:colors]
      end
    end
  end
end

def team_names
  game_hash
  arr =[]
  arr.push(game_hash[:home][:team_name])
  arr.push(game_hash[:away][:team_name])
  arr
end

def player_numbers(teamName)
  arr =[]
  game_hash.map do |team, data|
    data.map do |attributes, values|
      if values == teamName
        game_hash[team][:players].map do |player, stats|
          arr << game_hash[team][:players][player][:number]
        end
      end
    end
  end
  arr
end

def player_stats(playerName)
  playerPoints = 0
  game_hash.collect do |team, data|
    data.map do |teamDeets, values|
      game_hash[team][:players].map do |player, stats|
        if player == playerName
            return game_hash[team][:players][player]
        end
      end
    end
  end
end

def big_shoe_rebounds
  arr =[]
  game_hash.map do |team, data|
    data.map do |attributes, values|
        game_hash[team][:players].map do |player, stats|
          arr << game_hash[team][:players][player][:shoe]
        end
     end
  end
  arr = arr.slice(0..4) << arr.slice(arr.length-5..arr.length-1)
  arr = arr.flatten
  big = arr.max
  game_hash.map do |team, data|
    data.map do |attributes, values|
      game_hash[team][:players].map do |player, stats|
        if game_hash[team][:players][player][:shoe] == big
          return game_hash[team][:players][player][:rebounds]
        end
      end
    end
  end
end
