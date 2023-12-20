module aoc02

using AdventOfCode2023
#include(".\\AdventOfCode2023.jl")

 # BIG THANKS TO "github.com/goggle", using his way  of reading input made everything so much easier


function day02(input::String = readInput(joinpath(@__DIR__, "..", "data", "day02.txt"))) 
#    data = parseInput(input);
#    return nothing;
end;

function parseInput(input)
    data = Dict{Int,Vector{Tuple{Int,Int,Int}}}()
    for line ∈ split(rstrip(input),"\n")
        game,gameData = split(line,:)
        gameId = parse(Int, split(game, " ")[2])
        v = Vector{Tuple{Int,Int,Int}}()
        for round ∈ split(gdata, ";")
            r = g = b = 0
            numbers = findall(r"\d+", round)
            colors = findall(r"red|green|blue", round)
            for (n, c) ∈ zip(numbers, colors)
                if round[c] == "red"
                    r = parse(Int, round[n])
                elseif round[c] == "green"
                    g = parse(Int, round[n])
                elseif round[c] == "blue"
                    b = parse(Int, round[n])
                end
            end
            push!(v, (r, g, b))
        end
        data[gameid] = v
    end
    return data
end
function part1(data::Dict{Int, Vector{Tuple{Int,Int,Int}}})
    return 1;
end;



end; # module aoc02