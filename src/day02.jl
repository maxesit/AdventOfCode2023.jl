using AdventOfCode2023

    # BIG THANKS TO "github.com/goggle", using his way  of reading input made everything so much easier
    # BIG THANKS TO "github.com/goggle", using his way  of reading input made everything so much easier
    # I used file structure and parseInput from him, tried to do t1 and t2 on my own.
    # I hope to do code every other thing in this format too :D

function day02(input::String = readInput(joinpath(@__DIR__,"..","data","day02.txt")))
        data = parseInput(input);
        t1 = Task1(data);
        t2 = sum(prod(maximum(x -> x[i], values(data[j])) for i in 1:3) for j in keys(data))  #[7 16 4]
        return t1,t2;
end;

function parseInput(input)
    data = Dict{Int,Vector{Tuple{Int,Int,Int}}}()
    for line ∈ split(rstrip(input),"\n")
        game, gdata = split(line, ":")
        gameid = parse(Int, split(game," ")[2])
        v = Vector{Tuple{Int,Int,Int}}()
        for round ∈ split(gdata,";")
            r = g = b = 0;
            numbers = findall(r"\d+", round)
            colors  = findall(r"red|blue|green", round)
            for (n, c) ∈ zip(numbers,colors)
                if     round[c] == "red"
                    r = parse(Int,round[n])
                elseif round[c] == "blue"
                    b = parse(Int,round[n])
                elseif round[c] == "green"
                    g = parse(Int,round[n])
                end;
            end;
            push!(v,(r,g,b))
        end;
        data[gameid] = v;
    end;
    return data;
end;
#length(data)
function Task1(data::Dict{Int,Vector{Tuple{Int,Int,Int}}})
    idsum = 0;
    r_max = 12;
    g_max = 13;
    b_max = 14;
    for (k,v) ∈ data
        flag = true;
        for (r,g,b) ∈ v
            if (( r > r_max )||( b > b_max )||( g > g_max ))
                flag = false;
                break;
            end;
        end;
        if flag == true
            idsum += k;
        end;
    end;
    return idsum;
end; # module day02

# testa = (maximum(x -> x[i], values(data[1])) for i ∈ 1:3)
# testb = prod((maximum(x -> x[i], values(data[j])) for i ∈ 1:3) for j ∈ keys(data))